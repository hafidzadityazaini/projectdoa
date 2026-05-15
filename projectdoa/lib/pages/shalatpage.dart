import 'package:flutter/material.dart';
import '../components/customappbar.dart';
import '../components/jadwaltile.dart';

class ShalatPage extends StatelessWidget {
  const ShalatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),

        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/maghrib.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SEBENTAR LAGI WAKTU MAGHRIB",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "+/- 1 menit lagi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: const [
              JadwalTile(waktu: "Subuh", jam: "04:36"),
              JadwalTile(waktu: "Terbit", jam: "06:02"),
              JadwalTile(waktu: "Dzuhur", jam: "11:53"),
              JadwalTile(waktu: "Ashar", jam: "15:14"),
              JadwalTile(
                waktu: "Maghrib",
                jam: "18:00",
                active: true,
              ),
              JadwalTile(waktu: "Isya", jam: "19:00"),
            ],
          ),
        )
      ],
    );
  }
}