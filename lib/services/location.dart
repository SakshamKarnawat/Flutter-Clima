import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      if (await Permission.location.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
      } else {
        // Permission has not been granted.
      }

      var status = await Permission.location.status;
      if (status.isGranted) {
        // Location permission granted
      } else if (status.isDenied) {
        // Location permission not granted so ask again:
        await Permission.location.request();
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
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
