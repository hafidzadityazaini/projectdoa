import 'package:flutter/material.dart';

import '../data/amalandata.dart';
import 'detailamalanpage.dart';

class AmalanPage extends StatelessWidget {
  const AmalanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          "Amalan & Sunnah Harian",
        ),
      ),

      body: ListView.builder(
        padding:
            const EdgeInsets.all(15),

        itemCount: amalanList.length,

        itemBuilder: (context, index) {

          final item =
              amalanList[index];

          return Card(
            margin:
                const EdgeInsets.only(
              bottom: 15,
            ),

            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(
                20,
              ),
            ),

            child: ListTile(
              contentPadding:
                  const EdgeInsets.all(
                15,
              ),

              leading: CircleAvatar(
                backgroundColor:
                    Colors.green.shade100,

                child: const Icon(
                  Icons.menu_book,
                  color: Colors.green,
                ),
              ),

              title: Text(
                item.title,
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DetailAmalanPage(
                      amalan: item,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}