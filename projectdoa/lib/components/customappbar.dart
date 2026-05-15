import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(
            'assets/logo.png',
            width: 100,
          ),

          const SizedBox(width: 10),

          const Expanded(
            child: Text(
              "Muhammad Hafidz Aditya Zaini",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          const Icon(Icons.settings)
        ],
      ),
    );
  }
}