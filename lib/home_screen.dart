import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Position the blue container at the top
          Container(
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Spread out items
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align texts to left
                    children: [
                      Text(
                        "Support",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Contact",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      SizedBox(width: 15), // Add spacing between icons

                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // ... rest of your content below
        ],
      ),
    );
  }
}
