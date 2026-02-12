import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hotel Search")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, // pura screen cover karega
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => const FilterPage(),
            );
          },
          child: const Text("Open Filter"),
        ),
      ),
    );
  }
}

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? sortBy = "Best value";
  List<String> deals = [];
  List<String> propertyTypes = [];
  List<String> amenities = [];
  RangeValues? priceRange = const RangeValues(0, 975);
  int? selectedRating = 0;
  RangeValues? distanceRange = const RangeValues(0, 25);
  List<String> selectedLandmarks = [];
  List<int> selectedTravelerRatings = [];
  List<String> selectedHotelClasses = [];
  List<String> selectedStyles = []; // New state for 'Style'
  List<String> selectedBrands = []; // New state for 'Brand'

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // 🔹 Top Bar with Back Arrow & Title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
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
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios, size: 20),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              "Filter",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 48), // right side balance
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // 🔹 Main Content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  children: [
                    // Sort By
                    const SizedBox(height: 20),
                    const Text(
                      "Sort by",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildChoiceChip("Best value"),
                        _buildChoiceChip("Traveler ranking"),
                        _buildChoiceChip("Price(low to high)"),
                        _buildChoiceChip("Distance to city center"),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Popular
                    const Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildRatingChip(),
                        _buildFilterChip("4 Star", list: deals),
                        _buildFilterChip("Free Wifi", list: deals),
                        _buildFilterChip("Mid-range", list: deals),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Deals
                    const Text(
                      "Deals",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildFilterChip(
                          "Properties with special offers",
                          list: deals,
                        ),
                        _buildFilterChip(
                          "Fully refundable options",
                          info: true,
                          list: deals,
                        ),
                        _buildFilterChip(
                          "Reserve now, pay at stay",
                          info: true,
                          list: deals,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Price
                    const Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$${priceRange!.start.round()} - \$${priceRange!.end.round()}",
                      style: const TextStyle(color: Colors.black54),
                    ),
                    RangeSlider(
                      values: priceRange!,
                      min: 0,
                      max: 975,
                      divisions: 20,
                      activeColor: Colors.black,
                      onChanged: (values) {
                        setState(() {
                          priceRange = values;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // Property types
                    const Text(
                      "Property types",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildFilterChip(
                              "Specialty lodgings",
                              list: propertyTypes,
                            ),
                            _buildFilterChip("Hotels", list: propertyTypes),
                            _buildFilterChip(
                              "B&Bs & Inns",
                              list: propertyTypes,
                            ),
                            _buildFilterChip("Condo", list: propertyTypes),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("View more"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Amenities
                    const Text(
                      "Amenities",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildFilterChip("Free Wifi", list: amenities),
                        _buildFilterChip("Breakfast included", list: amenities),
                        _buildFilterChip("Free parking", list: amenities),
                        _buildFilterChip("Pool", list: amenities),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("View more"),
                      ),
                    ),

                    // Distance
                    const Text(
                      "Distance from",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${distanceRange!.end.round()} min",
                      style: const TextStyle(color: Colors.black54),
                    ),
                    RangeSlider(
                      values: distanceRange!,
                      min: 0,
                      max: 60,
                      divisions: 12,
                      activeColor: Colors.black,
                      onChanged: (values) {
                        setState(() {
                          distanceRange = values;
                        });
                      },
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildFilterChip("London Eye", list: selectedLandmarks),
                        _buildFilterChip(
                          "The British Museum",
                          list: selectedLandmarks,
                        ),
                        _buildFilterChip(
                          "Tower of London",
                          list: selectedLandmarks,
                        ),
                        _buildFilterChip(
                          "London Underground",
                          list: selectedLandmarks,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("View more"),
                      ),
                    ),

                    // Traveler rating
                    const Text(
                      "Traveler rating",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildTravelerRatingChip(5),
                        _buildTravelerRatingChip(4),
                        _buildTravelerRatingChip(3),
                        _buildTravelerRatingChip(2),
                      ],
                    ),

                    // Hotel class
                    const Text(
                      "Hotel class",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildFilterChip("5 Star", list: selectedHotelClasses),
                        _buildFilterChip("4 Star", list: selectedHotelClasses),
                        _buildFilterChip("3 Star", list: selectedHotelClasses),
                      ],
                    ),

                    // Style
                    const Text(
                      "Style",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildFilterChip("Mid-range", list: selectedStyles),
                        _buildFilterChip("Budget", list: selectedStyles),
                        _buildFilterChip("Business", list: selectedStyles),
                        _buildFilterChip("Modern", list: selectedStyles),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("View more"),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Brand
                    const Text(
                      "Brand",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildFilterChip(
                          "Independently owned property",
                          list: selectedBrands,
                        ),
                        _buildFilterChip("Premier Inn", list: selectedBrands),
                        _buildFilterChip("OYO", list: selectedBrands),
                        _buildFilterChip(
                          "Travelodge Hotels Ltd",
                          list: selectedBrands,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("View more"),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              // 🔹 Apply Button + Clear
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      // 🔹 Left side Clear filter
                      TextButton(
                        onPressed: () {
                          setState(() {
                            sortBy = null;
                            deals.clear();
                            priceRange = null;
                            propertyTypes.clear();
                            amenities.clear();
                            selectedRating = null;
                            distanceRange = null;
                            selectedLandmarks.clear();
                            selectedTravelerRatings.clear();
                            selectedHotelClasses.clear();
                            selectedStyles.clear();
                            selectedBrands.clear();
                          });
                        },
                        child: const Text(
                          "Clear filter",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // 🔹 Right side Expanded button
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            final result = {
                              "sortBy": sortBy,
                              "deals": deals,
                              "priceRange": priceRange,
                              "propertyTypes": propertyTypes,
                              "amenities": amenities,
                              "selectedRating": selectedRating,
                              "distanceRange": distanceRange,
                              "selectedLandmarks": selectedLandmarks,
                              "selectedTravelerRatings":
                                  selectedTravelerRatings,
                              "selectedHotelClasses": selectedHotelClasses,
                              "selectedStyles": selectedStyles,
                              "selectedBrands": selectedBrands,
                            };
                            Navigator.pop(context, result);
                          },
                          child: const Text("Show 4,000+ results"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔹 ChoiceChip (single select)
  Widget _buildChoiceChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: sortBy == label,
      onSelected: (selected) {
        setState(() {
          sortBy = label;
        });
      },
      selectedColor: Colors.black,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: sortBy == label ? Colors.white : Colors.black,
      ),
    );
  }

  // 🔹 FilterChip (multi select with optional info icon)
  Widget _buildFilterChip(
    String label, {
    bool info = false,
    required List<String> list,
  }) {
    final isSelected = list.contains(label);
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          if (info) ...[
            const SizedBox(width: 4),
            const Icon(Icons.info_outline, size: 16),
          ],
        ],
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (selected) {
            list.add(label);
          } else {
            list.remove(label);
          }
        });
      },
      selectedColor: Colors.black,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
    );
  }

  // 🔹 Star Rating Chip
  Widget _buildRatingChip() {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Icon(
            index < 4 ? Icons.star : Icons.star_border,
            color: index < 4 ? Colors.yellow[700] : Colors.grey,
            size: 20,
          );
        }),
      ),
      selected: selectedRating == 4,
      onSelected: (selected) {
        setState(() {
          selectedRating = selected ? 4 : 0;
        });
      },
      selectedColor: Colors.grey[200],
      backgroundColor: Colors.white,
      side: BorderSide(
        color: selectedRating == 4 ? Colors.black : Colors.grey,
        width: 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      labelPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
    );
  }

  // 🔹 Traveler Rating Chip
  Widget _buildTravelerRatingChip(int stars) {
    final isSelected = selectedTravelerRatings.contains(stars);
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Icon(
            index < stars ? Icons.star : Icons.star_border,
            color: index < stars ? Colors.yellow[700] : Colors.grey[400],
            size: 20,
          );
        }),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (selected) {
            selectedTravelerRatings.add(stars);
          } else {
            selectedTravelerRatings.remove(stars);
          }
        });
      },
      selectedColor: Colors.black,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
