import 'package:flutter/material.dart';

class HotelCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String price;
  final double rating;

  const HotelCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
  });

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  bool isFavorite = false; // 🔹 Heart ka state

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Image + Fav Button
          Stack(
            children: [
              Image.asset(
                widget.imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite; // 🔹 Toggle state
                    });
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 18,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 🔹 Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hotel Title
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                // Rating Stars
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.grey, size: 16),
                    Icon(Icons.star, color: Colors.grey, size: 16),
                  ],
                ),
                const SizedBox(height: 6),

                // Price Line (top one)
                Text(
                  "From \n ${widget.price}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 6),

                // Subtext
                const Text(
                  "Earn 5% back in Tripadvisor",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
