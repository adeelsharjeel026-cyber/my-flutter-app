import 'package:flutter/material.dart';
import 'package:travel_loom/widgets/Destination_Card.dart';
import 'package:travel_loom/widgets/Experience_Card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // 🔍 Search Bar
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: 'Where to?',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 🎁 Rewards Card
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white, // background white
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ), // grey border
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🔵 Icon Circle
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.attach_money,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 📝 Title
                    const Text(
                      'Earn rewards on hotels\nbooked directly in-app',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // 📄 Subtitle
                    const Text(
                      'Choose from a wide selection of hotels to\n'
                      'book in our app and get 5% back in\n'
                      'Travelloom Rewards on each stay.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 🌍 Top Experiences Section
              const Text(
                'Top experiences on\nTravellroom',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              SizedBox(
                height: 361,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ExperienceCard(
                      imageUrl: 'assets/images/Landon.png',
                      title: 'London Eye-Champagne\nExperience Ticket',
                      reviews: '7,426',
                      name: 'Skyscrapers & Towers',
                      price: '89',
                    ),
                    SizedBox(width: 16),
                    ExperienceCard(
                      imageUrl: 'assets/images/castle.png',
                      title: 'Stonehenge, London\nCastle, and Bath...',
                      reviews: '7,426',
                      name: 'Full-day Tours',
                      price: '133',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // 🗺️ Destinations Section
              const Text(
                'Destination travelers love',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.0,
                ),
                children: const [
                  DestinationCard(
                    imageUrl: 'assets/images/newyork.png',
                    name: 'New York\ncity',
                  ),
                  DestinationCard(
                    imageUrl: 'assets/images/singapore.png',
                    name: 'Singapore',
                  ),
                  DestinationCard(
                    imageUrl: 'assets/images/rome.png',
                    name: 'Rome',
                  ),
                  DestinationCard(
                    imageUrl: 'assets/images/paris.png',
                    name: 'Paris',
                  ),
                ],
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
