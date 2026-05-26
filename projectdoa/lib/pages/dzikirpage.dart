import 'package:flutter/material.dart';

class DzikirDetailPage extends StatelessWidget {
  final String title;
  final String arab;
  final String latin;
  final String arti;

  const DzikirDetailPage({
    super.key,
    required this.title,
    required this.arab,
    required this.latin,
    required this.arti,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // ======================
            // ARAB
            // ======================

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.green.shade50,

                borderRadius:
                    BorderRadius.circular(15),
              ),

              child: Text(
                arab,

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 34,
                  height: 2,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ======================
            // LATIN
            // ======================

            const Text(
              "Latin",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              latin,

              style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 25),

            // ======================
            // ARTI
            // ======================

            const Text(
              "Arti",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              arti,

              style: const TextStyle(
                fontSize: 18,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            // ======================
            // TASBIH COUNTER
            // ======================

            Center(
              child: ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(Icons.favorite),

                label: const Text(
                  "Dzikir Sunnah",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}