// adventure_card.dart

import 'package:flutter/material.dart';

class AdventureCard extends StatefulWidget {
  final String imageUrl;
  final String? countryName; // Optional: for the bottom-right label
  final List<String>? activityLabels; // Optional: for the top-left labels
  final int id;

  const AdventureCard({
    super.key,
    required this.imageUrl,
    this.countryName,
    this.activityLabels,
    required this.id,
  });

  @override
  State<AdventureCard> createState() => _AdventureCardState();
}

class _AdventureCardState extends State<AdventureCard> {
  bool isFavorite = false; // ❤️ by default empty

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image
            Image.asset(widget.imageUrl, fit: BoxFit.cover),

            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),

            // Top-left activity labels
            if (widget.activityLabels != null &&
                widget.activityLabels!.isNotEmpty)
              Positioned(
                top: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.activityLabels!
                      .map(
                        (label) => Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              label,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

            // Bottom-left country name
            if (widget.countryName != null)
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  widget.countryName!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            // Favorite heart (toggle)
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
                      isFavorite = !isFavorite;
                    });
                  },
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
