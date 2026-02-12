import 'package:flutter/material.dart';

class WalkingTourCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final int rating;
  final String reviews;
  final String category;
  final String price;

  const WalkingTourCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.category,
    required this.price,
  });

  @override
  State<WalkingTourCard> createState() => _WalkingTourCardState();
}

class _WalkingTourCardState extends State<WalkingTourCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📌 Left side image with heart icon on top-right
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Image.asset(
                  widget.imageUrl,
                  height: 160,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          // 📌 Right side details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // ⭐ Rating + reviews
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Icon(
                          index < widget.rating
                              ? Icons.star
                              : Icons.star_border,
                          size: 16,
                          color: index < widget.rating
                              ? Colors.amber
                              : Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "• ${widget.reviews} reviews",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    widget.category,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.black, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "Free cancellation",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      Icon(Icons.info_outline, size: 16, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
