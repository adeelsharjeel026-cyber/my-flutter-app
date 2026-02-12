import 'package:flutter/material.dart';

class CounterRow extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CounterRow({
    super.key,
    required this.title,
    required this.count,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Row(
            children: [
              IconButton(
                onPressed: onRemove,
                icon: Icon(
                  Icons.remove_circle,
                  color: count > 0 ? Colors.black : Colors.grey,
                ),
              ),
              Text("$count", style: const TextStyle(fontSize: 16)),
              IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add_circle, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
