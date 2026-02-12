import 'package:flutter/material.dart';
import 'package:travel_loom/AccountSettingsPage.dart';
import 'package:travel_loom/Hotel/Hotelpage.dart';
import 'package:travel_loom/ReviewPage.dart';
import 'package:travel_loom/location(resturant)/Resturantpage.dart';
import 'package:travel_loom/loction(TTD)/ThingsToDoPage.dart';
import 'package:travel_loom/planpage.dart';
import 'package:travel_loom/screens/SearchScreen.dart';
import 'package:travel_loom/screens/destinationdetail_page.dart';
import 'category_button.dart';
import 'adventure_card.dart';
import 'trending_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // ✅ Scroll controller for Explore page
  final ScrollController _homeScrollController = ScrollController();

  // 🔹 Pages list (index ke hisaab se page change hoga)
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePageContent(controller: _homeScrollController), // Explore/Home
      const PlanPage(),
      const ReviewPage(),
      const AccountSettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_outlined),
            label: 'Review',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          setState(() {
            if (_selectedIndex == index) {
              // ✅ Agar same tab dobara tap kiya
              if (index == 0) {
                // Explore tab → scroll to top
                if (_homeScrollController.hasClients) {
                  _homeScrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                }
              }
              // Aap yahan aur bhi conditions daal sakte ho
              // if (index == 1) { Plan reset logic }
              // if (index == 2) { Review reset logic }
            } else {
              // ✅ Dusra tab select hua
              _selectedIndex = index;
            }
          });
        },
      ),
    );
  }
}

//
// 🔹 Home Page ka content (Scaffold ke bina)
//
class HomePageContent extends StatelessWidget {
  final ScrollController controller;
  const HomePageContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller, // ✅ Scroll controller attach
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppBar jaisa top title
          // AppBar jaisa top title
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Travelloom",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.notifications_none, color: Colors.black),
                ],
              ),
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              readOnly: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              decoration: InputDecoration(
                hintText: 'Search for gift, things to do, hotels...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: const Icon(Icons.mic, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Explore Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Explore',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.5,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Hotelpage(),
                      ),
                    );
                  },
                  child: const CategoryButton(
                    icon: Icons.bed_outlined,
                    text: 'Hotels',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThingsToDoPage(),
                      ),
                    );
                  },
                  child: const CategoryButton(
                    icon: Icons.calendar_month_outlined,
                    text: 'Things to do',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Resturantpage(),
                      ),
                    );
                  },
                  child: const CategoryButton(
                    icon: Icons.restaurant,
                    text: 'Resturants',
                  ),
                ),
                const CategoryButton(icon: Icons.attractions, text: 'Formus'),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Looking for nearby
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/pic.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Looking for something nearby?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'pakistan, okara',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Plan adventure section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Plan your next adventure',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DestinationDetailPage(
                          destinationName: 'hurghada',
                        ),
                      ),
                    );
                  },
                  child: const AdventureCard(
                    id: 101,
                    imageUrl: 'assets/images/mexico.png',
                    countryName: 'Mexico',
                    activityLabels: ['Snorkeling', 'Archaeology Tours'],
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DestinationDetailPage(
                          destinationName: 'hurghada',
                        ),
                      ),
                    );
                  },
                  child: const AdventureCard(
                    id: 102,
                    imageUrl: 'assets/images/Egypt.png',
                    countryName: 'Egypt',
                    activityLabels: ['Snorkeling', 'Swim with dolphins'],
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DestinationDetailPage(
                          destinationName: 'hurghada',
                        ),
                      ),
                    );
                  },
                  child: const AdventureCard(
                    id: 103,
                    imageUrl: 'assets/images/morocco.png',
                    countryName: 'Morocco',
                    activityLabels: ['Snorkeling', 'Archaeology Tours'],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Trending section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Trending with travelers',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 317,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: [
                TrendingCard(
                  imageUrl: 'assets/images/jaz_makdi.png',
                  title: 'jaz makdi star & spa',
                  author: 'All_Inclusive',
                  location: 'Giza, Egypt',
                ),
                SizedBox(width: 20),
                TrendingCard(
                  imageUrl: 'assets/images/swim.png',
                  title: 'Charming Dalat',
                  author: 'All_Inclusive',
                  location: 'Dalat, Vietnam',
                ),
                SizedBox(width: 20),
                TrendingCard(
                  imageUrl: 'assets/images/park.png',
                  title: 'Hurghada',
                  author: 'All_Inclusive',
                  location: 'Hurghada, Egypt',
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Full-width image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 395,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/images/flower.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Fall weekand \nGateways across the U.S.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Make the most of the season with these easy trip ideas',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
