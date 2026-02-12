// lib/widgets/do_card.dart

import 'package:flutter/material.dart';

class DoCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  const DoCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  State<DoCard> createState() => _DoCardState();
}

class _DoCardState extends State<DoCard> {
  bool isFavorite = false; // ❤️ state

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  widget.imageUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const Icon(
                          Icons.star_half,
                          color: Colors.grey,
                          size: 14,
                        ),
                        const Icon(
                          Icons.star_border,
                          color: Colors.grey,
                          size: 14,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '3,105',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ❤️ Favorite Button
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: isFavorite ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite; // toggle
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
