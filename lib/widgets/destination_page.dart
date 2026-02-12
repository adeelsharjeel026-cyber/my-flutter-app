import 'package:flutter/material.dart';

class DestinationDetailPage extends StatelessWidget {
  final String destinationName;
  final int id; // 👈 id receive karne ke liye

  const DestinationDetailPage({
    super.key,
    required this.destinationName,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destinationName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Destination: $destinationName",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Destination ID: $id",
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
