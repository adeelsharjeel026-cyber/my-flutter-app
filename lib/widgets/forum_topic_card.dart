import 'package:flutter/material.dart';

class ForumTopicCard extends StatelessWidget {
  final String iconUrl;
  final String topicTitle;
  final String commentsCount;

  const ForumTopicCard({
    super.key,
    required this.iconUrl,
    required this.topicTitle,
    required this.commentsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topicTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(iconUrl), radius: 18),
              const SizedBox(width: 8),
              Text(
                commentsCount,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
