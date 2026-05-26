import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../models/prayermodel.dart';

import '../service/serviceapi.dart';
import '../service/locationservice.dart';
import '../service/worldcityservice.dart';

import '../components/jadwaltile.dart';

class ShalatPage extends StatefulWidget {

  const ShalatPage({
    super.key,
  });

  @override
  State<ShalatPage> createState() =>
      _ShalatPageState();
}

class _ShalatPageState
    extends State<ShalatPage> {

  PrayerModel? prayer;

  bool isLoading = true;

  String selectedCity =
      "Bogor";

  String selectedCountry =
      "Indonesia";

  String nextPrayer = "";

  String countdown = "";

  Timer? timer;

  final cityController =
      TextEditingController();

  @override
  void initState() {

    super.initState();

    loadCurrentLocation();
  }

  @override
  void dispose() {

    timer?.cancel();

    cityController.dispose();

    super.dispose();
  }

  // =========================
  // LOAD GPS LOCATION
  // =========================

  Future<void>
      loadCurrentLocation() async {

    try {

      selectedCity =
          await LocationService
              .getCity();

      selectedCountry =
          "Indonesia";

      cityController.text =
          "$selectedCity, $selectedCountry";

    } catch (e) {

      selectedCity =
          "Bogor";

      selectedCountry =
          "Indonesia";
    }

    await getPrayer();
  }

  // =========================
  // GET PRAYER TIME
  // =========================

  Future<void> getPrayer() async {

    setState(() {

      isLoading = true;
    });

    try {

      final data =
          await AladhanService
              .getPrayerTime(

        city: selectedCity,

        country:
            selectedCountry,
      );

      prayer =
          PrayerModel.fromJson(
        data['timings'],
      );

      startCountdown();

    } catch (e) {

      debugPrint(
        e.toString(),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(

        const SnackBar(

          content: Text(
            "Kota tidak ditemukan",
          ),
        ),
      );
    }

    setState(() {

      isLoading = false;
    });
  }

  // =========================
  // COUNTDOWN
  // =========================

  void startCountdown() {

    timer?.cancel();

    timer = Timer.periodic(

      const Duration(
        seconds: 1,
      ),

      (_) {

        if (prayer == null) {
          return;
        }

        final now =
            DateTime.now();

        final prayers = {

          "Subuh":
              prayer!.subuh,

          "Dzuhur":
              prayer!.dzuhur,

          "Ashar":
              prayer!.ashar,

          "Maghrib":
              prayer!.maghrib,

          "Isya":
              prayer!.isya,
        };

        DateTime? nextTime;

        String nextName = "";

        for (var item
            in prayers.entries) {

          final parts =
              item.value.split(
            ":",
          );

          final time =
              DateTime(

            now.year,
            now.month,
            now.day,

            int.parse(
              parts[0],
            ),

            int.parse(
              parts[1],
            ),
          );

          if (time.isAfter(now)) {

            nextTime = time;

            nextName =
                item.key;

            break;
          }
        }

        if (nextTime == null) {

          final parts =
              prayer!.subuh
                  .split(":");

          nextTime =
              DateTime(

            now.year,
            now.month,
            now.day + 1,

            int.parse(
              parts[0],
            ),

            int.parse(
              parts[1],
            ),
          );

          nextName =
              "Subuh";
        }

        final diff =
            nextTime
                .difference(now);

        if (mounted) {

          setState(() {

            nextPrayer =
                nextName;

            countdown =
                "${diff.inHours.toString().padLeft(2, '0')}:"
                "${(diff.inMinutes % 60).toString().padLeft(2, '0')}:"
                "${(diff.inSeconds % 60).toString().padLeft(2, '0')}";
          });
        }
      },
    );
  }

  // =========================
  // CURRENT PRAYER
  // =========================

  String currentPrayer() {

    if (prayer == null) {
      return "";
    }

    final now =
        DateTime.now();

    DateTime parse(
      String time,
    ) {

      final p =
          time.split(":");

      return DateTime(

        now.year,
        now.month,
        now.day,

        int.parse(p[0]),
        int.parse(p[1]),
      );
    }

    final subuh =
        parse(prayer!.subuh);

    final dzuhur =
        parse(prayer!.dzuhur);

    final ashar =
        parse(prayer!.ashar);

    final maghrib =
        parse(prayer!.maghrib);

    final isya =
        parse(prayer!.isya);

    if (now.isAfter(subuh) &&
        now.isBefore(dzuhur)) {

      return "Subuh";
    }

    if (now.isAfter(dzuhur) &&
        now.isBefore(ashar)) {

      return "Dzuhur";
    }

    if (now.isAfter(ashar) &&
        now.isBefore(maghrib)) {

      return "Ashar";
    }

    if (now.isAfter(maghrib) &&
        now.isBefore(isya)) {

      return "Maghrib";
    }

    if (now.isAfter(isya)) {

      return "Isya";
    }

    return "Subuh";
  }

  // =========================
  // ICON
  // =========================

  IconData prayerIcon(
    String prayer,
  ) {

    switch (prayer) {

      case "Subuh":
        return Icons.wb_twilight;

      case "Dzuhur":
        return Icons.sunny;

      case "Ashar":
        return Icons.wb_cloudy;

      case "Maghrib":
        return Icons
            .nights_stay_outlined;

      case "Isya":
        return Icons.dark_mode;

      default:
        return Icons.access_time;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(
        0xffF5F7FA,
      ),

      body: SafeArea(

        child:
            SingleChildScrollView(

          child: Column(

            children: [

              // ====================
              // HEADER
              // ====================

              Container(

                width:
                    double.infinity,

                padding:
                    const EdgeInsets
                        .all(20),

                decoration:
                    const BoxDecoration(

                  gradient:
                      LinearGradient(

                    colors: [

                      Color(
                        0xff0F9D58,
                      ),

                      Color(
                        0xff00A884,
                      ),
                    ],
                  ),

                  borderRadius:
                      BorderRadius.only(

                    bottomLeft:
                        Radius.circular(
                      30,
                    ),

                    bottomRight:
                        Radius.circular(
                      30,
                    ),
                  ),
                ),

                child: Column(

                  children: [

                    const Text(

                      "Jadwal Shalat Dunia",

                      style: TextStyle(

                        color:
                            Colors.white,

                        fontSize: 26,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // ====================
                    // SEARCH CITY
                    // ====================

                    TypeAheadField<dynamic>(

                      controller:
                          cityController,

                      suggestionsCallback:
                          (pattern) async {

                        return WorldCityService
                            .searchCity(
                          pattern,
                        );
                      },

                      itemBuilder:
                          (
                        context,
                        item,
                      ) {

                        return ListTile(

                          leading:
                              const Icon(
                            Icons
                                .location_city,
                          ),

                          title: Text(
                            item['name'],
                          ),

                          subtitle:
                              Text(
                            item['country'],
                          ),
                        );
                      },

                      onSelected:
                          (item) {

                        setState(() {

                          selectedCity =
                              item['name'];

                          selectedCountry =
                              item['country'];

                          cityController
                              .text =

                              "${item['name']}, ${item['country']}";
                        });

                        getPrayer();
                      },

                      builder: (

                        context,
                        controller,
                        focusNode,

                      ) {

                        return TextField(

                          controller:
                              controller,

                          focusNode:
                              focusNode,

                          decoration:
                              InputDecoration(

                            hintText:

                                "Cari kota seluruh dunia...",

                            filled:
                                true,

                            fillColor:
                                Colors.white,

                            prefixIcon:
                                const Icon(
                              Icons.search,
                            ),

                            border:
                                OutlineInputBorder(

                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),

                              borderSide:
                                  BorderSide.none,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // ====================
              // NEXT PRAYER CARD
              // ====================

              if (prayer != null)

                Container(

                  margin:
                      const EdgeInsets
                          .all(16),

                  padding:
                      const EdgeInsets
                          .all(24),

                  decoration:
                      BoxDecoration(

                    gradient:
                        const LinearGradient(

                      colors: [

                        Color(
                          0xff0F9D58,
                        ),

                        Color(
                          0xff00A884,
                        ),
                      ],
                    ),

                    borderRadius:
                        BorderRadius.circular(
                      25,
                    ),
                  ),

                  child: Column(

                    children: [

                      CircleAvatar(

                        radius: 40,

                        backgroundColor:
                            Colors.white
                                .withOpacity(
                          .15,
                        ),

                        child: Icon(

                          prayerIcon(
                            nextPrayer,
                          ),

                          color:
                              Colors.white,

                          size: 45,
                        ),
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      const Text(

                        "Menuju Waktu Shalat",

                        style: TextStyle(
                          color:
                              Colors.white70,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(

                        nextPrayer,

                        style:
                            const TextStyle(

                          color:
                              Colors.white,

                          fontSize: 28,

                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(

                        countdown,

                        style:
                            const TextStyle(

                          color:
                              Colors.white,

                          fontSize: 34,

                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              // ====================
              // JADWAL SHALAT
              // ====================

              if (isLoading)

                const Padding(

                  padding:
                      EdgeInsets.all(
                    40,
                  ),

                  child:
                      CircularProgressIndicator(),
                )

              else if (prayer != null)

                Padding(

                  padding:
                      const EdgeInsets
                          .all(16),

                  child: Column(

                    children: [

                      JadwalTile(

                        waktu:
                            "Subuh",

                        jam:
                            prayer!.subuh,

                        active:
                            currentPrayer() ==
                                "Subuh",
                      ),

                      JadwalTile(

                        waktu:
                            "Terbit",

                        jam:
                            prayer!.terbit,
                      ),

                      JadwalTile(

                        waktu:
                            "Dzuhur",

                        jam:
                            prayer!.dzuhur,

                        active:
                            currentPrayer() ==
                                "Dzuhur",
                      ),

                      JadwalTile(

                        waktu:
                            "Ashar",

                        jam:
                            prayer!.ashar,

                        active:
                            currentPrayer() ==
                                "Ashar",
                      ),

                      JadwalTile(

                        waktu:
                            "Maghrib",

                        jam:
                            prayer!.maghrib,

                        active:
                            currentPrayer() ==
                                "Maghrib",
                      ),

                      JadwalTile(

                        waktu:
                            "Isya",

                        jam:
                            prayer!.isya,

                        active:
                            currentPrayer() ==
                                "Isya",
                      ),
                    ],
                  ),
                ),

              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}