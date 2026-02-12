import 'package:flutter/material.dart';

// Assuming these are your custom widgets
import 'package:travel_loom/loction(TTD)/Days_trip.dart';

class MapTripPage extends StatelessWidget {
  const MapTripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Things to do in London"),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ✅ left align
          children: [
            const SizedBox(height: 16),

            // 🔹 Section Heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Day Trips",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "From quick jaunts to full-day outings.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 First horizontal scroll list
            SizedBox(
              height: 380,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  DaysTrip(
                    imageUrl: 'assets/images/leede.png',
                    title: 'Tower of London &\nCrown Jewels Ticket',
                    reviews: '7,426',
                    name: 'Full-day Tours',
                    price: '51',
                  ),
                  SizedBox(width: 16),
                  DaysTrip(
                    imageUrl: 'assets/images/stonehenge.png',
                    title: 'London Eye – Fast Track\nEntry Ticket',
                    reviews: '7,426',
                    name: 'Full-day Tours',
                    price: '133',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Second horizontal scroll list
            SizedBox(
              height: 380,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  DaysTrip(
                    imageUrl: 'assets/images/Rooms.png',
                    title:
                        'Winston Churchill’s London\nand the Churchill War\nRooms',
                    reviews: '7,426',
                    name: 'Public Transportation Tours',
                    price: '51',
                  ),
                  SizedBox(width: 16),
                  DaysTrip(
                    imageUrl: 'assets/images/Hope.png',
                    title:
                        'London Bridge, Lon Hop-On\nCastle, and Bar & River\nLondon',
                    reviews: '7,426',
                    name: 'Full-day Tours',
                    price: '133',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Third horizontal scroll list (agar repeat karna ho)
            SizedBox(
              height: 380,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  DaysTrip(
                    imageUrl: 'assets/images/Rooms.png',
                    title: 'Stonehenge & Bath Tour',
                    reviews: '8,426',
                    name: 'Guided Tours',
                    price: '120',
                  ),
                  SizedBox(width: 16),
                  DaysTrip(
                    imageUrl: 'assets/images/Hope.png',
                    title: 'Hop-On Hop-Off Bus Tour',
                    reviews: '6,101',
                    name: 'City Tours',
                    price: '40',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
