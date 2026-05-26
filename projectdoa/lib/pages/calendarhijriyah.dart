import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class KalenderHijriyahPage extends StatelessWidget {
  const KalenderHijriyahPage({super.key});

  @override
  Widget build(BuildContext context) {

    final hijri = HijriCalendar.now();

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Kalender Hijriyah",
        ),
      ),

      body: Center(

        child: Container(

          margin: const EdgeInsets.all(20),

          padding: const EdgeInsets.all(25),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius:
                BorderRadius.circular(25),

            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color:
                    Colors.black.withOpacity(
                  0.05,
                ),
              )
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              const Icon(
                Icons.calendar_month,
                size: 80,
                color: Colors.green,
              ),

              const SizedBox(height: 20),

              const Text(
                "Tanggal Hijriyah",

                style: TextStyle(
                  fontSize: 24,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear} H",

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 30,
                  fontWeight:
                      FontWeight.bold,

                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}