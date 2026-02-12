import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Date Range Picker',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Date Range Picker")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => const DateRangeBottomSheet(),
            );

            if (result != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Start: ${result['startDate']} | End: ${result['endDate']}",
                  ),
                ),
              );
            }
          },
          child: const Text("Open Calendar"),
        ),
      ),
    );
  }
}

class DateRangeBottomSheet extends StatefulWidget {
  const DateRangeBottomSheet({super.key});

  @override
  State<DateRangeBottomSheet> createState() => _DateRangeBottomSheetState();
}

class _DateRangeBottomSheetState extends State<DateRangeBottomSheet> {
  DateTime? _startDate;
  DateTime? _endDate;

  void _handleDateTap(DateTime date) {
    setState(() {
      if (_startDate == null || (_startDate != null && _endDate != null)) {
        _startDate = date;
        _endDate = null;
      } else {
        if (date.isBefore(_startDate!)) {
          _startDate = date;
          _endDate = null;
        } else if (date.isAfter(_startDate!)) {
          _endDate = date;
        } else {
          _endDate = _startDate;
        }
      }
    });
  }

  bool _isDateSelected(DateTime date) {
    if (_startDate == null) return false;
    if (_endDate == null) return date == _startDate;
    return date.isAtSameMomentAs(_startDate!) ||
        date.isAtSameMomentAs(_endDate!) ||
        (date.isAfter(_startDate!) && date.isBefore(_endDate!));
  }

  Color _getPriceColor(DateTime date) {
    if (date.day % 3 == 0) return Colors.green.shade100;
    if (date.day % 2 == 0) return Colors.yellow.shade100;
    return Colors.red.shade100;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            "Edit details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Price Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildColorLegend("Cheaper", Colors.green.shade100),
              const SizedBox(width: 16),
              _buildColorLegend("Average", Colors.yellow.shade100),
              const SizedBox(width: 16),
              _buildColorLegend("Higher", Colors.red.shade100),
            ],
          ),
          const SizedBox(height: 24),

          // Date and Guest chips
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildInfoChip(
                  icon: Icons.calendar_today,
                  label: _startDate == null
                      ? "Select Dates"
                      : "Sep ${_startDate!.day}–${_endDate?.day ?? ''}",
                ),
              ),
              const SizedBox(width: 8),
              _buildInfoChip(icon: Icons.person, label: "2"),
            ],
          ),
          const SizedBox(height: 24),

          // Calendar
          Table(
            children: [
              const TableRow(
                children: [
                  Center(child: Text("S")),
                  Center(child: Text("M")),
                  Center(child: Text("T")),
                  Center(child: Text("W")),
                  Center(child: Text("T")),
                  Center(child: Text("F")),
                  Center(child: Text("S")),
                ],
              ),
              ..._buildCalendarRows(),
            ],
          ),
          const SizedBox(height: 16),

          // Bottom actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _startDate = null;
                    _endDate = null;
                  });
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: _startDate != null && _endDate != null
                    ? () {
                        Navigator.of(
                          context,
                        ).pop({'startDate': _startDate, 'endDate': _endDate});
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text("Apply"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorLegend(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildInfoChip({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: Colors.black),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }

  List<TableRow> _buildCalendarRows() {
    List<TableRow> rows = [];
    final firstDayOfMonth = DateTime(2024, 9, 1);
    const daysInMonth = 30;
    int dayIndex = 0;

    List<Widget> weekDays = List.generate(
      firstDayOfMonth.weekday % 7,
      (index) => const SizedBox(), // Empty starting cells
    );

    while (dayIndex < daysInMonth) {
      for (int i = weekDays.length; i < 7; i++) {
        dayIndex++;
        if (dayIndex > daysInMonth) break;

        final currentDate = DateTime(2024, 9, dayIndex);
        final isSelected = _isDateSelected(currentDate);

        weekDays.add(
          InkWell(
            onTap: () => _handleDateTap(currentDate),
            borderRadius: BorderRadius.circular(99),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : _getPriceColor(currentDate),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                dayIndex.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }

      // 👇 Agar 7 se kam cells hain, to filler boxes add karo
      while (weekDays.length < 7) {
        weekDays.add(const SizedBox());
      }
      rows.add(TableRow(children: weekDays));
      weekDays = [];
    }

    return rows;
  }
}
