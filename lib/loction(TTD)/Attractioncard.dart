import 'package:flutter/material.dart';

class AttractionCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final String reviews;
  final String category;
  final String locationOrStatus;

  const AttractionCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.category,
    required this.locationOrStatus,
  });

  @override
  State<AttractionCard> createState() => _AttractionCardState();
}

class _AttractionCardState extends State<AttractionCard> {
  bool isFavorite = false; // ✅ state rakha heart ke liye

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + Heart
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  widget.imageUrl,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 120,
                      height: 120,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite; // ✅ toggle karega
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber[700], size: 16),
                      Icon(Icons.star, color: Colors.amber[700], size: 16),
                      Icon(Icons.star, color: Colors.amber[700], size: 16),
                      const Icon(Icons.star, color: Colors.grey, size: 16),
                      const Icon(Icons.star, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.rating}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' (${widget.reviews})',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.category,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.locationOrStatus,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
