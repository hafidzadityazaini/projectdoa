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

  IconData getPrayerIcon() {
    switch (waktu) {
      case "Subuh":
        return Icons.wb_twilight;

      case "Terbit":
        return Icons.wb_sunny_outlined;

      case "Dzuhur":
        return Icons.sunny;

      case "Ashar":
        return Icons.wb_cloudy;

      case "Maghrib":
        return Icons.nights_stay_outlined;

      case "Isya":
        return Icons.dark_mode;

      default:
        return Icons.access_time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: active
            ? Colors.green.shade100
            : Colors.white,

        borderRadius:
            BorderRadius.circular(20),

        border: active
            ? Border.all(
                color: Colors.green,
                width: 2,
              )
            : null,

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.05,
            ),
            blurRadius: 10,
          ),
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(
            radius: 25,

            backgroundColor: active
                ? Colors.green
                : Colors.orange.shade100,

            child: Icon(
              getPrayerIcon(),

              color: active
                  ? Colors.white
                  : Colors.orange,

              size: 28,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              waktu,

              style: TextStyle(
                fontSize: 18,

                fontWeight:
                    FontWeight.bold,

                color: active
                    ? Colors.green
                    : Colors.black87,
              ),
            ),
          ),

          Text(
            jam,

            style: TextStyle(
              fontSize: 20,

              fontWeight:
                  FontWeight.bold,

              color: active
                  ? Colors.green
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}