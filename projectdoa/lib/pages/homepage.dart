
import 'dart:async';

import 'package:flutter/material.dart';

import '../models/prayermodel.dart';

import '../service/locationservice.dart';
import '../service/serviceapi.dart';
import '../service/audioservice.dart';

import 'shalatpage.dart';
import 'qiblapage.dart';
import 'calendarhijriyah.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {
  PrayerModel? prayer;

  String nextPrayer = "";

  String countdown = "";

  Timer? timer;

  @override
  void initState() {
    super.initState();

    loadPrayer();
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future<void> loadPrayer() async {
    try {
      final city =
          await LocationService
              .getCity();

      final data =
          await AladhanService
              .getPrayerTime(
        city: city,
        country: "Indonesia",
      );

      prayer = PrayerModel.fromJson(
        data['timings'],
      );

      startCountdown();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void startCountdown() {
    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (prayer == null) {
          return;
        }

        final now = DateTime.now();

        final prayers = {
          "Subuh": prayer!.subuh,
          "Dzuhur": prayer!.dzuhur,
          "Ashar": prayer!.ashar,
          "Maghrib": prayer!.maghrib,
          "Isya": prayer!.isya,
        };

        DateTime? nextTime;

        String nextName = "";

        for (var item
            in prayers.entries) {
          final parts =
              item.value.split(":");

          final time = DateTime(
            now.year,
            now.month,
            now.day,
            int.parse(parts[0]),
            int.parse(parts[1]),
          );

          if (time.isAfter(now)) {
            nextTime = time;

            nextName = item.key;

            break;
          }
        }

        if (nextTime == null) {
          final parts =
              prayer!.subuh.split(":");

          nextTime = DateTime(
            now.year,
            now.month,
            now.day + 1,
            int.parse(parts[0]),
            int.parse(parts[1]),
          );

          nextName = "Subuh";
        }

        final diff =
            nextTime.difference(now);

        if (mounted) {
          setState(() {
            nextPrayer = nextName;

            countdown =
                "${diff.inHours.toString().padLeft(2, '0')}:"
                "${(diff.inMinutes % 60).toString().padLeft(2, '0')}:"
                "${(diff.inSeconds % 60).toString().padLeft(2, '0')}";
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffF5F7FA),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER

              Container(
                width: double.infinity,

                padding:
                    const EdgeInsets.all(25),

                decoration:
                    const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end:
                        Alignment.bottomRight,
                    colors: [
                      Color(0xff0F9D58),
                      Color(0xff00C897),
                    ],
                  ),

                  borderRadius:
                      BorderRadius.only(
                    bottomLeft:
                        Radius.circular(35),
                    bottomRight:
                        Radius.circular(35),
                  ),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              AssetImage(
                            'assets/logo.png',
                          ),
                        ),

                        const SizedBox(width: 15),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Text(
                                "Assalamu'alaikum",
                                style: TextStyle(
                                  color:
                                      Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Muslim App",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding:
                              const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white
                                .withOpacity(0.2),
                            borderRadius:
                                BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 30),

                    // COUNTDOWN CARD

                    Container(
                      width: double.infinity,

                      padding:
                          const EdgeInsets.all(22),

                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.15),

                        borderRadius:
                            BorderRadius.circular(
                          30,
                        ),
                      ),

                      child: Column(
                        children: [
                          const Text(
                            "Menuju Waktu Shalat",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            nextPrayer,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            countdown,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // MENU GRID

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                ),

                child: GridView.count(
                  shrinkWrap: true,

                  physics:
                      const NeverScrollableScrollPhysics(),

                  crossAxisCount: 2,

                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,

                  childAspectRatio: 1,

                  children: [
                    _menuCard(
                      title: "Jadwal Shalat",
                      icon: Icons.mosque,
                      color: Colors.green,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const ShalatPage(),
                          ),
                        );
                      },
                    ),

                    _menuCard(
                      title: "Qiblat",
                      icon: Icons.explore,
                      color: Colors.orange,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const QiblatPage(),
                          ),
                        );
                      },
                    ),

                    _menuCard(
                      title: "Hijriyah",
                      icon:
                          Icons.calendar_month,
                      color: Colors.purple,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const KalenderHijriyahPage(),
                          ),
                        );
                      },
                    ),

                    _menuCard(
                      title: "Murottal",
                      icon: Icons.headphones,
                      color: Colors.red,
                      onTap: () {
                        AudioService
                            .playMurottal();
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius:
          BorderRadius.circular(30),

      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(30),

          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Colors.black
                  .withOpacity(0.05),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            Container(
              padding:
                  const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),

              child: Icon(
                icon,
                size: 38,
                color: color,
              ),
            ),

            const SizedBox(height: 18),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
