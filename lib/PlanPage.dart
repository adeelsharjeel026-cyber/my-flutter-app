import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Trips & Saves
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false, // ✅ Back arrow remove
          title: const Text(
            "Plan",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          bottom: const TabBar(
            isScrollable: true, // ✅ Tabs left aligned
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            tabs: [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Tab(text: "Trips"),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Tab(text: "Saves"),
              ),
            ],
          ),
        ),

        // ✅ Sirf TabBarView hoga (navbar removed)
        body: const TabBarView(
          children: [TripsTabContent(), SavesTabContent()],
        ),
      ),
    );
  }
}

class TripsTabContent extends StatelessWidget {
  const TripsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const TripFeatureItem(
            icon: Icons.favorite_border,
            title: "Save places you'd like to visit",
          ),
          const TripFeatureItem(
            icon: Icons.location_on_outlined,
            title: "See your saves on a map",
          ),
          const TripFeatureItem(
            icon: Icons.note_alt_outlined,
            title: "Keep track of notes, links, and more",
          ),
          const TripFeatureItem(
            icon: Icons.group_outlined,
            title: "Share and collaborate on your plans",
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              "Create a Trip",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TripFeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const TripFeatureItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 4, 138, 248),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class SavesTabContent extends StatelessWidget {
  const SavesTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Your saved places will appear here.",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
