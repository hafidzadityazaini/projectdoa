import 'package:flutter/material.dart';

class JadwalTile extends StatelessWidget {
  final String waktu;
  final String jam;
  final bool active;

  const JadwalTile({
    super.key,
    required this.waktu,
    required this.jam,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                waktu,
                style: TextStyle(
                  fontSize: 20,
                  color: active ? Colors.green : Colors.black,
                ),
              ),

              Text(
                jam,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: active ? Colors.green : Colors.black,
                ),
              ),
            ],
          ),

          const Icon(
            Icons.notifications,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}