import 'dart:convert';
import 'package:http/http.dart' as http;

class AladhanService {
  static Future<Map<String, dynamic>> getPrayerTime({
    required String city,
    required String country,
  }) async {
    final url = Uri.parse(
      "https://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=11",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'];
    } else {
      throw Exception("Gagal mengambil jadwal shalat");
    }
  }
}