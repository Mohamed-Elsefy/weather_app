import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location/location_service.dart';

class LocationNotifier extends AsyncNotifier<Position> {
  late final LocationService _service;

  @override
  Future<Position> build() async {
    _service = LocationService();
    return _service.getCurrentLocation();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _service.getCurrentLocation());
  }
}

final locationProvider = AsyncNotifierProvider<LocationNotifier, Position>(
  LocationNotifier.new,
);
