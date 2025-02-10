import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel Asst."),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset("lib/assets/images/travel_banner.webp", fit: BoxFit.cover),
            ),

            const SizedBox(height: 16),

            // Category Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Explore by Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 8),

            // Category Icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryIcon(Icons.terrain, "Mountains"),
                  _buildCategoryIcon(Icons.beach_access, "Beaches"),
                  _buildCategoryIcon(Icons.location_city, "Cities"),
                  _buildCategoryIcon(Icons.directions_walk, "Adventures"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Popular Destinations Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Popular Destinations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // Destination List
            _buildDestinationList(),
          ],
        ),
      ),
    );
  }

  // Widget for category icon
  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue.shade100,
          child: Icon(icon, size: 30, color: Colors.blueAccent),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  // Widget for destination list
  Widget _buildDestinationList() {
    final List<Map<String, String>> destinations = [
      {"name": "Bali, Indonesia", "image": "lib/assets/images/bali.webp"},
      {"name": "Paris, France", "image": "lib/assets/images/paris.webp"},
      {"name": "Tokyo, Japan", "image": "lib/assets/images/tokyo.jpg"},
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    destinations[index]["image"]!,
                    width: 150,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(destinations[index]["name"]!, style: const TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}
