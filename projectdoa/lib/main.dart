import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/amalanpage.dart';
import 'pages/artikelpage.dart';
import 'pages/shalatpage.dart';
import 'components/bottomnav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int currentIndex = 0;

  final List pages = [
    const HomePage(),
    const AmalanPage(),
    const ArtikelPage(),
    const ShalatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.grey[200],

        body: SafeArea(
          child: pages[currentIndex],
        ),

        bottomNavigationBar: BottomNav(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}