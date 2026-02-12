import 'package:flutter/material.dart';

class Ticketspage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String reviews;
  final String name;
  final String price;

  const Ticketspage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.reviews,
    required this.name,
    required this.price,
  });

  @override
  State<Ticketspage> createState() => _TicketspageState();
}

class _TicketspageState extends State<Ticketspage> {
  bool isFavorite = false; // ✅ state rakha

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 361,
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.imageUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
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
                        isFavorite = !isFavorite; // ✅ toggle karega
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const Icon(Icons.star, color: Colors.grey, size: 16),
              const Icon(Icons.star, color: Colors.grey, size: 16),
              const SizedBox(width: 5),
              Text(
                '(${widget.reviews})',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            widget.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'From \$${widget.price} per adult',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
