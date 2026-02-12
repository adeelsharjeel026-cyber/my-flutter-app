import 'package:flutter/material.dart';
import 'package:travel_loom/widgets/abudhabiad_card.dart';
import '../widgets/do_card.dart';
import '../widgets/stay_card.dart';
import '../widgets/eat_card.dart';

import '../widgets/forum_topic_card.dart';

class DestinationDetailPage extends StatefulWidget {
  final String destinationName;

  const DestinationDetailPage({super.key, required this.destinationName});

  @override
  State<DestinationDetailPage> createState() => _DestinationDetailPageState();
}

class _DestinationDetailPageState extends State<DestinationDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/Egypt.png',
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: Container(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blueAccent,
                  tabs: const [
                    Tab(text: 'Overview'),
                    Tab(text: 'Hotels'),
                    Tab(text: 'Things to do'),
                    Tab(text: 'Reviews'),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destinationName,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Stunning coral reefs and turquoise waters perfect for windsurfing have made Hurghada, on Egypt’s Red sea co....',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text(
                          'Read more',
                          style: TextStyle(
                            fontSize: 24,

                            decoration: TextDecoration.underline,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 3),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 40,
                          color: Colors.black,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                      label: const Text('View Map'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Do',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
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
                        const SizedBox(height: 4),
                        const Text(
                          'Places to see, ways to wander, and signature experiences.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          DoCard(
                            imageUrl: 'assets/images/jaz_makdi.png',
                            title: 'jaz_makdi star & spa',
                            description: 'All-Inclusive\nMakadi Bay, Egypt',
                          ),
                          SizedBox(width: 16),
                          DoCard(
                            imageUrl: 'assets/images/hurghada.png',
                            title: 'Marines,  Open now',
                            description: 'All-Inclusive\nTicket from \$52',
                          ),
                          SizedBox(width: 16),
                          DoCard(
                            imageUrl: 'assets/images/boat.png',
                            title: 'Boat Trips',
                            description:
                                'All-Inclusive\nRelax on a yacht in the Red Sea',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'stay',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
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
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          StayCard(
                            imageUrl: 'assets/images/star&spa.png',
                            title: 'Jaz Makadi Star & Spa',
                            rating: 4,
                            description: 'Luxury resort with private beach',
                          ),
                          SizedBox(width: 16),
                          StayCard(
                            imageUrl: 'assets/images/jaz_makdi.png',
                            title: 'Hurghada Marriott Red Sea Beach',
                            rating: 5,
                            description: 'Beachfront hotel with a marina',
                          ),
                          SizedBox(width: 16),
                          StayCard(
                            imageUrl: 'assets/images/sofra.png',
                            title: 'Steigenberger Aldau Beach',
                            rating: 5,
                            description: 'Golf & spa resort with water park',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Eat',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
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
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          EatCard(
                            imageUrl: 'assets/images/sofra1.png',
                            title: 'DuPort Pool Bar & Restaurant',
                            rating: 4,
                            description: 'Casual dining with sea views',
                          ),
                          SizedBox(width: 16),
                          EatCard(
                            imageUrl: 'assets/images/Iberotal.png',
                            title: 'El Halaka Fish Restaurant',
                            rating: 4,
                            description: 'Fresh seafood by the harbor',
                          ),
                          SizedBox(width: 16),
                          EatCard(
                            imageUrl: 'assets/images/sofra.png',
                            title: 'Bella Vista Italian Restaurant',
                            rating: 3,
                            description: 'Authentic Italian cuisine',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    const SizedBox(height: 16),
                    const AbuDhabiAdCard(),

                    const SizedBox(height: 24),

                    // Trending in the forums section
                    const Text(
                      'Trending in the forums',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const ForumTopicCard(
                      iconUrl: 'assets/images/sun.png',
                      topicTitle: 'e-visa from visa2egypt.gov.egm  ',
                      commentsCount: 'By Trents Tamworth, UK  9 contributions',
                    ),
                    const ForumTopicCard(
                      iconUrl: 'assets/images/sun.png',
                      topicTitle: 'Should I cancel my holiday??',
                      commentsCount: 'By Terry F 10 contributions',
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
