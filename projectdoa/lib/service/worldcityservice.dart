import 'dart:convert';

import 'package:flutter/services.dart';

class WorldCityService {

  static List<dynamic> allCities = [];

  // =========================
  // LOAD JSON
  // =========================

  static Future<void> loadCities() async {

    final String data =
        await rootBundle.loadString(
      'assets/worldcities.json',
    );

    allCities = jsonDecode(data);
  }

  // =========================
  // SEARCH CITY
  // =========================

  static List<dynamic> searchCity(
    String query,
  ) {

    if (query.isEmpty) {
      return [];
    }

    final lowercase =
        query.toLowerCase();

    return allCities.where((city) {

      final cityName =
          city['name']
              .toString()
              .toLowerCase();

      final countryName =
          city['country']
              .toString()
              .toLowerCase();

      return cityName.contains(
                lowercase,
              ) ||
          countryName.contains(
            lowercase,
          );

    }).take(30).toList();
  }
}