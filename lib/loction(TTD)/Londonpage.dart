import 'package:flutter/material.dart';

// Assuming these are your custom widgets
import 'package:travel_loom/loction(TTD)/Attractioncard.dart';
import 'package:travel_loom/loction(TTD)/Days_trip.dart';
import 'package:travel_loom/loction(TTD)/MapTrip_page.dart';
import 'package:travel_loom/loction(TTD)/Ticketspage.dart';
import 'package:travel_loom/loction(TTD)/walking_page.dart';
import 'package:travel_loom/loction(TTD)/walkingtours.dart';
import 'package:travel_loom/widgets/Experience_Card.dart';

class LondonPage extends StatefulWidget {
  const LondonPage({super.key});

  @override
  State<LondonPage> createState() => _LondonPageState();
}

class _LondonPageState extends State<LondonPage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> filters = [
    {"label": "Map", "icon": Icons.map},
    {"label": "Day Trips", "icon": Icons.calendar_today},
    {"label": "Walking Tours", "icon": Icons.directions_walk},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Things to do in London"),
        centerTitle: false, // Align title to the left
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            // Add navigation logic to go back
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Add search functionality here
              print('Search tapped');
            },
          ),
          const SizedBox(width: 8), // Add some spacing to the right
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔹 Filter Chips Row
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final filter = filters[index];
                final isSelected = index == selectedIndex;

                return ChoiceChip(
                  // Ab avatar ke andar se GestureDetector ko hata diya gaya hai.
                  avatar: Icon(
                    filter["icon"],
                    size: 18,
                    color: isSelected ? Colors.white : Colors.black54,
                  ),
                  label: Text(
                    filter["label"],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: Colors.blue,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onSelected: (_) {
                    setState(() {
                      selectedIndex = index;
                    });
                    // Navigation logic yahan par sahi se kaam karega.
                    if (filter["label"] == "Day Trips") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapTripPage(),
                        ),
                      );
                    } else if (filter["label"] == "Walking Tours") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WalkingToursPage(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 32),
          // 🌍 Section 1: Must-do Experiences
          _buildExperienceSection(
            title: 'Must-do experiences\nin London',
            subtitle: 'Book these experiences for a close-up look at London',
            children: const [
              ExperienceCard(
                imageUrl: 'assets/images/Landon.png',
                title:
                    'ig Bus London Hop-On\nHop-Off Tour & RiverCurise- 50% Off Kids',
                reviews: '7,426',
                name: 'Bus Tours',
                price: '51',
              ),
              SizedBox(width: 16),
              ExperienceCard(
                imageUrl: 'assets/images/stone.png',
                title: 'Stonehenge,Lon Hop-On\nCastle, and Bar & River\nLondon',
                reviews: '7,426',
                name: 'Full-day Tours',
                price: '133',
              ),
            ],
          ),
          const SizedBox(height: 32),
          // 🏞️ Section 2: Day Trips
          _buildExperienceSection(
            title: 'Day Trips',
            subtitle: 'From quick jaunts to full-day outings.',
            children: const [
              DaysTrip(
                imageUrl: 'assets/images/leede.png',
                title: 'Tower of London &\nCrown Jewels Ticket',
                reviews: '7,426',
                name: 'Full-day Tours',
                price: '51',
              ),
              SizedBox(width: 16),
              DaysTrip(
                imageUrl: 'assets/images/stonehenge.png',
                title: 'London Eye – Fast Track\nEntry Ticket',
                reviews: '7,426',
                name: 'Full-day Tours',
                price: '133',
              ),
            ],
          ),
          const SizedBox(height: 32),
          // 🚶 Section 3: Walking Tours
          _buildExperienceSection(
            title: 'Walking Tours',
            children: const [
              Walkingtours(
                imageUrl: 'assets/images/guidedtour.png',
                title:
                    'Guided Tour of London\nWestminster Abbey,\nBig Ben, Buckingham',
                reviews: '7,426',
                name: 'City Tours',
                price: '114',
              ),
              SizedBox(width: 16),
              Walkingtours(
                imageUrl: 'assets/images/Eiffel.png',
                title:
                    'Guided Luxury,Hop-Trip\nwith Optiond Bar&R at the\nEiffel Tower',
                reviews: '7,426',
                name: 'Rails Tours',
                price: '413',
              ),
            ],
          ),
          const SizedBox(height: 32),
          // 🎟️ Section 4: Tickets & Passes
          _buildExperienceSection(
            title: 'Tickets & Passes',
            children: const [
              Ticketspage(
                imageUrl: 'assets/images/Landon.png',
                title: 'London Eye - Champagne\nExperience Ticket',
                reviews: '7,426',
                name: 'Skyscrapers & Towers',
                price: '79',
              ),
              SizedBox(width: 16),
              Ticketspage(
                imageUrl: 'assets/images/gallery.png',
                title:
                    'London: National ry,Lon\nGallery,s Audioh Optiond\nSkip-the-line T',
                reviews: '7,426',
                name: 'Skip the line Tickettowes',
                price: '13',
              ),
            ],
          ),
          const SizedBox(height: 32),
          // 🏛️ Section 5: Top Attractions
          const Text(
            'Top attractions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Attraction Card 1
          AttractionCard(
            imageUrl: 'assets/images/River.png',
            title: 'Tower of London',
            rating: 4.5,
            reviews: '3,105',
            category: 'Historic Sites . Points of Int...',
            locationOrStatus: 'City of London',
          ),
          const SizedBox(height: 20),
          // Attraction Card 2
          AttractionCard(
            imageUrl: 'assets/images/british.png',
            title: 'The British Museum',
            rating: 4.5,
            reviews: '3,105',
            category: 'Seciality Museum Art M...',
            locationOrStatus: 'Bloomsbury',
          ),
          const SizedBox(height: 20),
          // Attraction Card 3
          AttractionCard(
            imageUrl: 'assets/images/eye.png',
            title: 'London Eye',
            rating: 4.5,
            reviews: '3,105',
            category: 'Points of Interest & Landma..',
            locationOrStatus: 'Open now',
          ),
          const SizedBox(height: 40),
          // View all attractions button
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  // Handle button tap
                  print('View all attractions tapped');
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  side: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
                child: const Text(
                  'View all attractions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for building the horizontal list sections
  Widget _buildExperienceSection({
    required String title,
    String? subtitle,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'See all',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          child: ListView(scrollDirection: Axis.horizontal, children: children),
        ),
      ],
    );
  }
}
