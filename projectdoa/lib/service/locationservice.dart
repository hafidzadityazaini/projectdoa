import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {

  /// Mendapatkan nama kota otomatis
  static Future<String> getCity() async {
    try {

      bool serviceEnabled =
          await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return "Bogor";
      }

      LocationPermission permission =
          await Geolocator.checkPermission();

      if (permission ==
          LocationPermission.denied) {

        permission =
            await Geolocator.requestPermission();

        if (permission ==
            LocationPermission.denied) {
          return "Bogor";
        }
      }

      if (permission ==
          LocationPermission.deniedForever) {
        return "Bogor";
      }

      Position position =
          await Geolocator.getCurrentPosition(
        desiredAccuracy:
            LocationAccuracy.high,
      );

      List<Placemark> placemarks =
          await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) {
        return "Bogor";
      }

      Placemark place =
          placemarks.first;

      return place.subAdministrativeArea ??
          place.locality ??
          place.administrativeArea ??
          "Bogor";

    } catch (e) {

      print("ERROR CITY : $e");

      return "Bogor";
    }
  }

  /// Mendapatkan posisi GPS
  static Future<Position> getPosition() async {

    bool serviceEnabled =
        await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception(
        "GPS tidak aktif",
      );
    }

    LocationPermission permission =
        await Geolocator.checkPermission();

    if (permission ==
        LocationPermission.denied) {

      permission =
          await Geolocator.requestPermission();
    }

    if (permission ==
        LocationPermission.deniedForever) {

      throw Exception(
        "Permission lokasi ditolak",
      );
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy:
          LocationAccuracy.high,
    );
  }

  /// Latitude pengguna
  static Future<double> getLatitude() async {

    Position position =
        await getPosition();

    return position.latitude;
  }

  /// Longitude pengguna
  static Future<double> getLongitude() async {

    Position position =
        await getPosition();

    return position.longitude;
  }
}