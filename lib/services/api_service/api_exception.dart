// failure.dart
import 'package:dio/dio.dart';

class Failure {
  final String message; // machine-friendly message
  final int statusCode; // HTTP code or custom code (0 = unknown)
  final dynamic details; // optional: raw body, stacktrace, etc.

  Failure({required this.message, required this.statusCode, this.details});

  @override
  String toString() => 'Failure(code: $statusCode, message: $message)';
}

// error_mapper.dart
String? extractMessage(dynamic body) {
  if (body == null) return null;
  if (body is String) return body;
  if (body is Map) {
    if (body['error'] != null) return body['error'].toString();
    if (body['message'] != null) return body['message'].toString();
    if (body['errors'] != null) {
      final errs = body['errors'];
      if (errs is Map) return errs.values.map((v) => v.toString()).join('\n');
      if (errs is List && errs.isNotEmpty) return errs.first.toString();
    }
    return body.toString();
  }
  return body.toString();
}

// map_dio_exception.dart
Failure mapDioException(DioException e) {
  final code = e.response?.statusCode ?? 0;
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout) {
    return Failure(message: 'timeout', statusCode: code, details: e.message);
  }
  if (e.type == DioExceptionType.cancel) {
    return Failure(message: 'request_cancelled', statusCode: code);
  }
  if (e.type == DioExceptionType.connectionError || e.type == DioExceptionType.unknown) {
    final msg = extractMessage(e.response?.data) ?? 'no_internet_or_unknown';
    return Failure(message: msg, statusCode: code, details: e.message);
  }
  // badResponse
  final body = e.response?.data;
  final msg = extractMessage(body) ?? 'server_error';
  return Failure(message: msg, statusCode: code, details: body);
}
