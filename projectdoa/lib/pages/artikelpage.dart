import 'package:flutter/material.dart';

import '../data/artikeldata.dart';
import 'artikeldetail.dart';

class ArtikelPage extends StatelessWidget {
  const ArtikelPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          "Artikel Islami",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: artikelData.length,

        itemBuilder: (context, index) {

          final artikel = artikelData[index];

          return GestureDetector(

            onTap: () {

              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => ArtikelDetailPage(

                    title:
                        artikel['title']!,

                    image:
                        artikel['image']!,

                    description:
                        artikel['description']!,
                  ),
                ),
              );
            },

            child: Container(

              margin:
                  const EdgeInsets.only(
                bottom: 20,
              ),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(
                  25,
                ),

                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                    color: Colors.black
                        .withOpacity(0.05),
                  )
                ],
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  ClipRRect(
                    borderRadius:
                        const BorderRadius.only(
                      topLeft:
                          Radius.circular(
                              25),
                      topRight:
                          Radius.circular(
                              25),
                    ),

                    child: Image.asset(
                      artikel['image']!,

                      height: 220,

                      width:
                          double.infinity,

                      fit: BoxFit.cover,

                      errorBuilder:
                          (context, error, stackTrace) {

                        return Container(
                          height: 220,
                          color: Colors.grey.shade300,

                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets
                            .all(20),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [

                        Text(
                          artikel['title']!,

                          style:
                              const TextStyle(
                            fontSize: 26,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),

                        const SizedBox(
                            height: 15),

                        Text(
                          artikel[
                                  'description']!
                              .substring(
                                  0, 90),

                          style:
                              TextStyle(
                            color:
                                Colors.grey.shade700,
                            fontSize: 17,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(
                            height: 20),

                        ElevatedButton(

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green.shade50,

                            foregroundColor:
                                Colors.green,

                            elevation: 0,

                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 14,
                            ),
                          ),

                          onPressed: () {

                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    ArtikelDetailPage(

                                  title:
                                      artikel[
                                          'title']!,

                                  image:
                                      artikel[
                                          'image']!,

                                  description:
                                      artikel[
                                          'description']!,
                                ),
                              ),
                            );
                          },

                          child: const Text(
                            "Baca Selengkapnya",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}