import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'location_exceptions.dart';

class LocationService {
  Future<void> _ensurePermission() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw const LocationServiceDisabled();
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const LocationPermissionDenied();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw const LocationPermissionPermanentlyDenied();
    }
  }

  Future<Position> getCurrentLocation() async {
    await _ensurePermission();

    LocationSettings settings;

    if (kIsWeb) {
      settings = WebSettings(accuracy: LocationAccuracy.high);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      settings = AndroidSettings(accuracy: LocationAccuracy.high);
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      settings = AppleSettings(accuracy: LocationAccuracy.high);
    } else {
      settings = const LocationSettings(accuracy: LocationAccuracy.high);
    }

    try {
      return await Geolocator.getCurrentPosition(
        locationSettings: settings,
      ).timeout(const Duration(seconds: 10));
    } catch (_) {
      throw const LocationTimeoutException();
    }
  }
}
