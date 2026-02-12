// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:travel_loom/Hotel/DateRangeBottomSheet.dart';
import 'package:travel_loom/Hotel/FilterPage.dart';
import 'package:travel_loom/Hotel/Hotelcard.dart'; // 👈 Import your custom sheet
import 'package:intl/intl.dart';

class PlacetoStaypage extends StatefulWidget {
  const PlacetoStaypage({super.key});

  @override
  State<PlacetoStaypage> createState() => _PlacetoStaypageState();
}

class _PlacetoStaypageState extends State<PlacetoStaypage> {
  int adults = 2;
  int children = 0;

  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // 👈 back to previous screen
          },
        ),
        title: const Text(
          "London Hotels and\nPlaces to Stay",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(6),
        children: [
          // 🔹 Filter Row with Icons
          Row(
            children: [
              _buildFilterChip(
                context,
                label: "Map",
                icon: Icons.map,
                selected: true,
                onTap: () {},
              ),
              const SizedBox(width: 8),

              _buildFilterChip(
                context,
                label: startDate != null && endDate != null
                    ? "${DateFormat('MMM d').format(startDate!)}-${DateFormat('MMM d').format(endDate!)}"
                    : "Sep 4-5",

                icon: Icons.date_range,
                onTap: () async {
                  // ⚡️ Corrected onTap to open your custom sheet
                  final result = await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => const DateRangeBottomSheet(),
                  );

                  if (result != null) {
                    setState(() {
                      startDate = result['startDate'];
                      endDate = result['endDate'];
                    });
                  }
                },
              ),
              const SizedBox(width: 8),

              // 👇 Guests Chip (open bottom sheet)
              _buildFilterChip(
                context,
                label: "${adults + children}",
                icon: Icons.person,
                onTap: () async {
                  final result = await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) =>
                        GuestCounterSheet(adults: adults, children: children),
                  );

                  if (result != null) {
                    setState(() {
                      adults = result['adults'];
                      children = result['children'];
                    });
                  }
                },
              ),

              // const SizedBox(width: 4),
              _buildFilterChip(
                context,
                label: "Filter",
                icon: Icons.filter_list,
                onTap: () async {
                  final result = await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) =>
                        const FilterPage(), // 👈 filter page call
                  );

                  if (result != null) {
                    // result ek Map hoga jisme selected filters aayenge
                    print("Filters Applied: $result");

                    setState(() {
                      // Aap apne filters ko state me save kar sakte ho
                    });
                  }
                },
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Text(
            "Properties in London sorted by best value",
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 16),

          // 🔹 Hotels List
          HotelCard(
            imageUrl: "assets/images/Crowne.png",
            title: "Crowne Plaza London Docklands, an IHG Hotel",
            rating: 4.5,
            price: "\$223",
          ),
          const SizedBox(height: 16),

          HotelCard(
            imageUrl: "assets/images/Dixon.png",
            title: "The Dixon, Tower Bridge, Autograph Collection",
            rating: 4.7,
            price: "\$223",
          ),
          const SizedBox(height: 16),

          HotelCard(
            imageUrl: "assets/images/Sofa.png",
            title: "Bermonds Locke London",
            rating: 4.3,
            price: "\$223",
          ),
          const SizedBox(height: 16),

          HotelCard(
            imageUrl: "assets/images/LandMark.png",
            title: "The Landmark London",
            rating: 4.6,
            price: "\$223",
          ),
        ],
      ),
    );
  }

  // 🔹 Filter Chip UI with Icon
  Widget _buildFilterChip(
    BuildContext context, {
    required String label,
    required IconData icon,
    bool selected = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.white,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: selected ? Colors.white : Colors.black),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Bottom Sheet with Counters
class GuestCounterSheet extends StatefulWidget {
  final int adults;
  final int children;

  const GuestCounterSheet({
    super.key,
    required this.adults,
    required this.children,
  });

  @override
  State<GuestCounterSheet> createState() => _GuestCounterSheetState();
}

class _GuestCounterSheetState extends State<GuestCounterSheet> {
  late int adults;
  late int children;

  @override
  void initState() {
    super.initState();
    adults = widget.adults;
    children = widget.children;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 50,
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Text(
            "Edit details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // 🔹 Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendChip(
                const Color.fromARGB(255, 181, 228, 250),
                "Cheaper",
              ),
              const SizedBox(width: 8),
              _buildLegendChip(
                const Color.fromARGB(255, 252, 217, 204),
                "Average",
              ),
              const SizedBox(width: 8),
              _buildLegendChip(
                const Color.fromARGB(255, 252, 206, 221),
                "Higher",
              ),
            ],
          ),
          const SizedBox(height: 20),
          // 🔹 Date and Guests (Search bar smaller)
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8, // 👈 smaller height
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Sep 4–Sep 5",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 25),
              SizedBox(
                width: 60,
                height: 40,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person, size: 16, color: Colors.black54),
                      const SizedBox(width: 6),
                      Text(
                        "${adults + children}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // 🔹 Gray line under search bar
          const SizedBox(height: 30),
          Container(height: 3, color: Colors.grey[200]),
          const SizedBox(height: 20),
          // 🔹 Adults Counter
          _buildCounterRow(
            "Adults",
            adults,
            () => setState(() => adults++),
            () => setState(() {
              if (adults > 0) adults--;
            }),
          ),
          // 🔹 Children Counter
          _buildCounterRow(
            "Children",
            children,
            () => setState(() => children++),
            () => setState(() {
              if (children > 0) children--;
            }),
          ),
          const SizedBox(height: 200),
          // 🔹 Reset & Apply Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        adults = 0;
                        children = 0;
                      });
                    },
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => Navigator.pop(context, {
                  "adults": adults,
                  "children": children,
                }),
                child: const Text("Apply"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterRow(
    String title,
    int count,
    VoidCallback onAdd,
    VoidCallback onRemove,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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

  Widget _buildLegendChip(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color.withOpacity(0.6),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 13, color: Colors.black)),
      ],
    );
  }
}
