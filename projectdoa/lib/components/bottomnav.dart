import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pan_tool),
          label: "Amalan",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: "Artikel",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mosque),
          label: "Shalat",
        ),
      ],
    );
  }
}