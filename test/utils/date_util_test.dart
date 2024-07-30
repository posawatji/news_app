import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/utils/date_util.dart';

void main() {
  group('DateUtil', () {
    test('convertTimestampStringToInt should convert valid string to int', () {
      expect(DateUtil.convertTimestampStringToInt('1622505600000'), 1622505600000);
    });

    test('convertTimestampStringToInt should return 0 for invalid string', () {
      expect(DateUtil.convertTimestampStringToInt('invalid'), 0);
    });

    test('convertTimestampIntToDateTime should convert int to DateTime', () {
      final DateTime dateTime = DateUtil.convertTimestampIntToDateTime(1622505600000);
      expect(dateTime.year, 2021);
      expect(dateTime.month, 6);
      expect(dateTime.day, 1);
      expect(dateTime.hour, 7);
      expect(dateTime.minute, 0);
    });

    test('dateFormat should format DateTime to string with default pattern', () {
      final DateTime dateTime = DateTime(2021, 6, 1, 12, 0);
      final String formattedDate = DateUtil.dateFormat(dateTime);
      expect(formattedDate, 'Tue 01 Jun 2021 12:00 PM');
    });

    test('dateFormat should format DateTime to string with custom pattern', () {
      final DateTime dateTime = DateTime(2021, 6, 1, 12, 0);
      final String formattedDate = DateUtil.dateFormat(dateTime, pattern: 'yyyy-MM-dd');
      expect(formattedDate, '2021-06-01');
    });

    test('dateAndTimeFromTimestampString should format timestamp string to date and time string with default pattern', () {
      final String formattedDate = DateUtil.dateAndTimeFromTimestampString('1622505600000');
      expect(formattedDate, 'Tue 01 Jun 2021 07:00 AM');
    });

    test('dateAndTimeFromTimestampString should format timestamp string to date and time string with custom pattern', () {
      final String formattedDate = DateUtil.dateAndTimeFromTimestampString('1622505600000', pattern: 'yyyy-MM-dd');
      expect(formattedDate, '2021-06-01');
    });

    test('dateAndTimeFromTimestampString should return empty string for empty timestamp', () {
      final String formattedDate = DateUtil.dateAndTimeFromTimestampString('');
      expect(formattedDate, '');
    });
  });
}
