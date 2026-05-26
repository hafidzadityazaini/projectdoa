class PrayerModel {

  final String subuh;
  final String terbit;
  final String dzuhur;
  final String ashar;
  final String maghrib;
  final String isya;

  PrayerModel({

    required this.subuh,
    required this.terbit,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
  });

  factory PrayerModel.fromJson(
      Map<String, dynamic> json) {

    return PrayerModel(

      subuh: json['Fajr'],

      terbit: json['Sunrise'],

      dzuhur: json['Dhuhr'],

      ashar: json['Asr'],

      maghrib: json['Maghrib'],

      isya: json['Isha'],
    );
  }
}