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

    return Container(
      margin: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(25),

        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color:
                Colors.black.withOpacity(0.08),
          )
        ],
      ),

      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(25),

        child: BottomNavigationBar(

          currentIndex: currentIndex,

          onTap: onTap,

          type:
              BottomNavigationBarType.fixed,

          selectedItemColor:
              Colors.green,

          unselectedItemColor:
              Colors.grey,

          backgroundColor: Colors.white,

          elevation: 0,

          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
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
        ),
      ),
    );
  }
}