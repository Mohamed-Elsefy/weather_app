abstract class LocationException implements Exception {
  final String message;
  const LocationException(this.message);

  @override
  String toString() => message;
}

class LocationServiceDisabled extends LocationException {
  const LocationServiceDisabled() : super('Location services are disabled');
}

class LocationPermissionDenied extends LocationException {
  const LocationPermissionDenied() : super('Location permission denied');
}

class LocationPermissionPermanentlyDenied extends LocationException {
  const LocationPermissionPermanentlyDenied()
      : super('Location permission permanently denied');
}

class LocationTimeoutException extends LocationException {
  const LocationTimeoutException() : super('Location request timed out');
}
