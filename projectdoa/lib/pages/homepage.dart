import 'package:flutter/material.dart';
import '../components/customappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),

        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "25 Dzulka’dah 1447 Hijriah",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "12 Mei 2026",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sebentar Lagi Waktu Zuhur",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 5),

              Text(
                "+/- 4 Menit Lagi",
                style: TextStyle(
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),

        const SizedBox(height: 10),

        Image.asset(
          'assets/poster.png',
          height: 350,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}