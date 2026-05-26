import 'package:flutter/material.dart';

class ArtikelDetailPage extends StatelessWidget {

  final String title;

  final String image;

  final String description;

  const ArtikelDetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Hero(
              tag: image,

              child: Image.asset(
                image,

                width: double.infinity,

                height: 280,

                fit: BoxFit.cover,

                errorBuilder:
                    (context, error, stackTrace) {

                  return Container(
                    height: 280,
                    color: Colors.grey.shade300,

                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),

            Container(
              width: double.infinity,

              padding:
                  const EdgeInsets.all(25),

              decoration: const BoxDecoration(
                color: Colors.white,

                borderRadius:
                    BorderRadius.only(
                  topLeft:
                      Radius.circular(30),
                  topRight:
                      Radius.circular(30),
                ),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    description,

                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}