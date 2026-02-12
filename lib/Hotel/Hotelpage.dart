import 'package:flutter/material.dart';
import 'package:travel_loom/Hotel/PlacetoStaypage.dart';
import 'package:travel_loom/loction(TTD)/Destination_Item.dart';

class Hotelpage extends StatelessWidget {
  const Hotelpage({super.key});

  // 🔹 Helper function to build tappable destination tile
  Widget buildDestinationTile(
    BuildContext context,
    String city,
    String country,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PlacetoStaypage()),
        );
      },
      child: DestinationTile(city: city, country: country),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 🔹 List of destinations
    final destinations = [
      {"city": "London", "country": "England, United Kingdom"},
      {"city": "Dubai", "country": "Emirate of Dubai, United Arab Emirates"},
      {"city": "Istanbul", "country": "Turkiye, Europe"},
      {"city": "New York City", "country": "New York, United States"},
      {"city": "Belek", "country": "Turkish Mediterranean Coast, Turkiye"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔙 Back + Search bar in one row
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Where to?",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 📍 Hotels heading
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200,
                    ),
                    child: const Icon(Icons.navigation, color: Colors.black),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Hotels",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              // 📌 Popular Destination
              const Text(
                "Popular Destination",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 33),

              // 📋 Destination List
              Expanded(
                child: ListView.separated(
                  itemCount: destinations.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 30),
                  itemBuilder: (context, index) {
                    final destination = destinations[index];
                    return buildDestinationTile(
                      context,
                      destination["city"]!,
                      destination["country"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
