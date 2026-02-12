// lib/widgets/eat_card.dart

import 'package:flutter/material.dart';
import 'stay_card.dart';

class EatCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int rating;
  final String description;

  const EatCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return StayCard(
      imageUrl: imageUrl,
      title: title,
      rating: rating,
      description: description,
    );
  }
  // ignore: non_constant_identifier_names
}
