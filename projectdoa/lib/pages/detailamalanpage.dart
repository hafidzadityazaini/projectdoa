import 'package:flutter/material.dart';
import '../models/amalanmodel.dart';

class DetailAmalanPage extends StatelessWidget {

  final AmalanModel amalan;

  const DetailAmalanPage({
    super.key,
    required this.amalan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(amalan.title),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: Text(
                amalan.arab,
                textAlign: TextAlign.right,

                style: const TextStyle(
                  fontSize: 30,
                  height: 2,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Latin",
              style: TextStyle(
                fontWeight:
                    FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              amalan.latin,
              style: const TextStyle(
                fontSize: 18,
                fontStyle:
                    FontStyle.italic,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Arti",
              style: TextStyle(
                fontWeight:
                    FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              amalan.arti,
              style: const TextStyle(
                fontSize: 18,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}