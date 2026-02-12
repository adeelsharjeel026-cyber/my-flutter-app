import 'package:flutter/material.dart';

class RestaurantCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String reviews;
  final String type;
  final String price;

  const RestaurantCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.reviews,
    required this.type,
    required this.price,
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool isFavorite = false; // 🔹 heart icon state

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.imageUrl,
                  height: 150,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              // Heart Icon (top right)
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
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
          const SizedBox(height: 8),
          Text(
            widget.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const Icon(Icons.star, size: 16, color: Colors.grey),
              const Icon(Icons.star, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(widget.reviews, style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "${widget.type} • ${widget.price}",
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
