import 'package:flutter/material.dart';
import 'package:travel_loom/loction(TTD)/WalkingTourCard.dart';

class WalkingToursPage extends StatelessWidget {
  const WalkingToursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Walking Tours"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          WalkingTourCard(
            imageUrl: "assets/images/Buck.png",
            title: "Buckingham Palace",
            rating: 4,
            reviews: "3,105",
            category: "Private and luxury",
            price: "From \$97 per adult",
          ),
          WalkingTourCard(
            imageUrl: "assets/images/Ghost.png",
            title: "Ghost, Ghouls and Gallows",
            rating: 4,
            reviews: "3,105",
            category: "Private and luxury",
            price: "From \$97 per adult",
          ),
          WalkingTourCard(
            imageUrl: "assets/images/Abbey.png",
            title: "Westminster Abbey",
            rating: 4,
            reviews: "3,105",
            category: "Private and luxury",
            price: "From \$97 per adult",
          ),
          WalkingTourCard(
            imageUrl: "assets/images/Hill.png",
            title: "Notting Hill Walking Tour",
            rating: 4,
            reviews: "3,105",
            category: "Private and luxury",
            price: "From \$97 per adult",
          ),
          WalkingTourCard(
            imageUrl: "assets/images/Green.png",
            title: "Greenwich, London",
            rating: 4,
            reviews: "3,105",
            category: "Private and luxury",
            price: "From \$97 per adult",
          ),
        ],
      ),
    );
  }
}
