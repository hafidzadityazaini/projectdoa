import 'package:flutter/material.dart';
import '../components/customappbar.dart';

class ArtikelPage extends StatelessWidget {
  const ArtikelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [

              const Text(
                "Artikel Ramadhan",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              buildPoster(
                image: 'assets/poster.png',
                title: 'Puasa Ramadhan 2024 / 1445 H',
              ),

              const SizedBox(height: 20),

              buildPoster(
                image: 'assets/maghrib.jpeg',
                title: 'Keutamaan Waktu Maghrib',
              ),

              const SizedBox(height: 20),

              buildPoster(
                image: 'assets/poster.png',
                title: 'Amalan di Bulan Ramadhan',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPoster({
    required String image,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              image,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}