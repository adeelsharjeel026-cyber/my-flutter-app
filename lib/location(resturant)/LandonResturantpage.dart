import 'package:flutter/material.dart';
import 'package:travel_loom/location(resturant)/RestaurantCard.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  String selectedFilter = "All"; // 👈 yeh track karega kaunsa chip select hai

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Restaurants in London",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔹 Filter Chips
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _FilterChip(
                  label: "All",
                  selected: selectedFilter == "All",
                  onSelected: () => setState(() => selectedFilter = "All"),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: "British",
                  selected: selectedFilter == "British",
                  onSelected: () => setState(() => selectedFilter = "British"),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: "Cafe",
                  selected: selectedFilter == "Cafe",
                  onSelected: () => setState(() => selectedFilter = "Cafe"),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: "Asian",
                  selected: selectedFilter == "Asian",
                  onSelected: () => setState(() => selectedFilter = "Asian"),
                ),
                const SizedBox(width: 8),
                _FilterChip(
                  label: "Bar",
                  selected: selectedFilter == "Bar",
                  onSelected: () => setState(() => selectedFilter = "Bar"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 🔹 Section 1: The essentials
          _buildSectionHeader(
            "The essentials",
            "Our essential London restaurants, bars.",
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                RestaurantCard(
                  imageUrl: "assets/images/Bonoo.png",
                  title: "Bonoo Indian Tapas\nHampstead",
                  reviews: "3,105",
                  type: "\$\$_\$\$  Grill Healt....\nOpen now london",
                  price: "",
                ),
                SizedBox(width: 16),
                RestaurantCard(
                  imageUrl: "assets/images/Andy.png",
                  title: "Andy’s GREEK \nTaverna",
                  reviews: "3,105",
                  type: "\$\$_\$\$ Greek Tavern\nOpen now london",
                  price: "",
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                RestaurantCard(
                  imageUrl: "assets/images/Launce.png",
                  title: "Savor Indian Tapas",
                  reviews: "3,105",
                  type: "\$\$_\$\$  Grill Healt....\nOpen now london",
                  price: "",
                ),
                SizedBox(width: 16),
                RestaurantCard(
                  imageUrl: "assets/images/Dishoom.png",
                  title: "Andros GREEK",
                  reviews: "3,105",
                  type: "\$\$_\$\$ Greek Tavern\nOpen now london",
                  price: "",
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // 🔹 Section 2: Top restaurants
          _buildSectionHeader(
            "Top restaurants",
            "Spotlight experiences to fill the evenings.",
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                RestaurantCard(
                  imageUrl: "assets/images/Arcade.png",
                  title: "London Food Theatre",
                  reviews: "3,105",
                  type: "\$\$_\$\$ Grill Healt....\nOpen now London",
                  price: "",
                ),
                SizedBox(width: 16),
                RestaurantCard(
                  imageUrl: "assets/images/Taverna.png",
                  title: "Tuscany GREEK",
                  reviews: "3,105",
                  type: "\$\$_\$\$ Greek Tavern\nOpen now London",
                  price: "",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Section Header Widget
  Widget _buildSectionHeader(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        const Text(
          "See all",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

// 🔹 Filter Chip Widget
class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
      backgroundColor: Colors.white,
      selectedColor: Colors.blue, // 👈 sirf selected chip blue hogi
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black, // 👈 text bhi change
      ),
      side: const BorderSide(color: Color.fromARGB(66, 172, 104, 104)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
