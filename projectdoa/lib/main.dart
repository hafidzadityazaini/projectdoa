import 'package:flutter/material.dart';

import 'pages/homepage.dart';
import 'pages/amalanpage.dart';
import 'pages/artikelpage.dart';
import 'pages/shalatpage.dart';

import 'components/bottomnav.dart';

import 'service/notificationservice.dart';
import 'service/worldcityservice.dart';

import 'theme/apptheme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // INIT NOTIFICATION
  await NotificationService.init();

  // LOAD DATABASE KOTA DUNIA
  await WorldCityService.loadCities();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {

  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() =>
      _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int currentIndex = 0;

  final List<Widget> pages = [

    const HomePage(),

    const AmalanPage(),

    const ArtikelPage(),

    const ShalatPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner:
          false,

      theme: AppTheme.lightTheme,

      home: Scaffold(

        body: SafeArea(
          child:
              pages[currentIndex],
        ),

        bottomNavigationBar:
            BottomNav(

          currentIndex:
              currentIndex,

          onTap: (index) {

            setState(() {

              currentIndex =
                  index;
            });
          },
        ),
      ),
    );
  }
}