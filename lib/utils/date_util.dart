import 'package:intl/intl.dart';

abstract class DateUtil {
  DateUtil._();

  static int convertTimestampStringToInt(String timestamp) {
    return int.tryParse(timestamp) ?? 0;
  }

  static DateTime convertTimestampIntToDateTime(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  static String dateFormat(DateTime date, {String pattern = 'E dd MMM yyyy HH:mm a'}) {
    return DateFormat(pattern).format(date);
  }

  static String dateAndTimeFromTimestampString(String timestamp, {String pattern = 'E dd MMM yyyy HH:mm a'}) {
    if (timestamp.isEmpty) return '';

    final int timestampInt = convertTimestampStringToInt(timestamp);
    final DateTime timestampDateTime = convertTimestampIntToDateTime(timestampInt);
    final String dateAndTimePattern = dateFormat(timestampDateTime, pattern: pattern);

    return dateAndTimePattern;
  }
}
