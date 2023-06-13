import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission perm = await Geolocator.requestPermission();
      if (perm != LocationPermission.whileInUse &&
          perm != LocationPermission.always) {
        throw Exception("Location permission not granted");
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print("$e");
    }
  }
}
