import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class QiblatPage extends StatelessWidget {
  const QiblatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Qiblat Compass"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,

        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                "Sensor kompas tidak tersedia",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          final double direction =
              snapshot.data!.heading ?? 0;

          return Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [
                Container(
                  padding:
                      const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black
                            .withOpacity(0.08),
                      ),
                    ],
                  ),

                  child: Transform.rotate(
                    angle:
                        -direction *
                        (math.pi / 180),

                    child: Image.asset(
                      'assets/compass.jpg',
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  "${direction.toStringAsFixed(0)}°",
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Arah Kompas",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}