import 'package:flutter/material.dart';

class DzikirListPage extends StatelessWidget {

  final String title;

  final List data;

  const DzikirListPage({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(15),

        itemCount: data.length,

        itemBuilder: (context, index) {

          final dzikir = data[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 20),

            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius:
                  BorderRadius.circular(15),

              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.1),
                )
              ],
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  dzikir['title'],

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  dzikir['arab'],

                  textAlign: TextAlign.right,

                  style: const TextStyle(
                    fontSize: 30,
                    height: 2,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  dzikir['latin'],

                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  dzikir['arti'],

                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
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