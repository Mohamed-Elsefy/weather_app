import 'package:intl/intl.dart';

String formatDate(String date, String locale) {
  try {
    final dt = DateTime.parse(date);
    return DateFormat.E(locale).format(dt);
  } catch (_) {
    return date;
  }
}
