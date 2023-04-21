// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

class AppDateTimeHelper {
  static const _formatTimeDdMmYyyy = 'dd/MM/yyyy';
  static const _formatDotTimeDdMmYyyy = 'dd.MM.yyyy';
  static const _formatTimeHHmm = 'HH:mm';
  static const _formatTimeHhMmDdMmYyyy = 'HH:mm, dd/MM/yyyy';

  static const _formatTime1 = 'yyyy-MM-dd HH:mm:ss';
  static final _formatTime2 = DateFormat('dd-MM-yyyy');
  static final _formatTime3 = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
  static final _formatTime4 = DateFormat('dd/MM/yyyy');
  static final _formatTime5 = DateFormat('HH:mm');
  static final _formatTime6 = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSSS");

  static const _formatTimeIso8601 = "yyyy-MM-dd'T'HH:mm:ss";

  static String timeToString(DateTime time) {
    final dateFormat = DateFormat(_formatTime1);
    return dateFormat.format(time);
  }

  static String timeToStringDDMMYYYY(DateTime? time) {
    if (time != null) {
      final dateFormat = DateFormat(_formatTimeDdMmYyyy);
      return dateFormat.format(time);
    }
    return '';
  }

  static DateTime stringToTime(String time) {
    final dateFormat = DateFormat(_formatTime1);
    return dateFormat.parse(time, true);
  }

  static String timeToStringHHmm(DateTime? time) {
    if (time != null) {
      final dateFormat = DateFormat(_formatTimeHHmm);
      return dateFormat.format(time);
    }
    return '';
  }

  static String timeToStringDotDDMMYYYY(DateTime? time) {
    if (time != null) {
      final dateFormat = DateFormat(_formatDotTimeDdMmYyyy);
      return dateFormat.format(time);
    }
    return '';
  }

  static DateTime? stringToTimeHHmmDDmmYYYY(String? time) {
    if (time != null && time.isNotEmpty) {
      final dateFormat = DateFormat(_formatTimeHhMmDdMmYyyy);
      return dateFormat.parse(time, true);
    }
    return null;
  }

  static String timeToStringHHmmDDmmYYYY(DateTime? time) {
    if (time != null) {
      final dateFormat = DateFormat(_formatTimeHhMmDdMmYyyy);
      return dateFormat.format(time);
    }
    return '';
  }

  static DateTime? stringToTimeIso8601(String? time) {
    if (time != null && time.isNotEmpty) {
      final dateFormat = DateFormat(_formatTimeIso8601);
      return dateFormat.parse(time, true);
    }
    return null;
  }

  static String timeToStringIso8601(DateTime? time) {
    if (time != null) {
      final dateFormat = DateFormat(_formatTimeIso8601);
      return dateFormat.format(time);
    }
    return '';
  }

  /// dd-MM-yyyy
  static String timeToString2(DateTime time) => _formatTime2.format(time);

  /// yyyy-MM-dd'T'HH:mm:ss.SSSSSSS
  static String timeToString3(DateTime time) => _formatTime3.format(time);

  /// dd/MM/yyyy
  static String timeToString4(DateTime time) => _formatTime4.format(time);

  /// HH:mm
  static String timeToString5(DateTime time) => _formatTime5.format(time);

  /// HH:mm
  static String timeToString6(DateTime time) => _formatTime6.format(time);

  /// dd-MM-yyyy
  static DateTime stringToTime2(String time) => _formatTime2.parse(time, true);

  /// yyyy-MM-dd'T'HH:mm:ss
  static DateTime stringToTime3(String time) => _formatTime3.parse(time, true);

  static DateTime stringToTime6(String time) => _formatTime6.parse(time, true);

  static DateTime? stringToTime3Nullable(String? time) =>
      time != null ? _formatTime3.parse(time, true) : null;

  static bool isTheSameDay(DateTime date1, DateTime date2) =>
      date1.day == date2.day &&
      date1.month == date2.month &&
      date1.year == date2.year;

  static String getDayOfWeekVi(int dayOfWeek) {
    switch (dayOfWeek) {
      case DateTime.monday:
        return 'Thứ 2';
      case DateTime.tuesday:
        return 'Thứ 3';
      case DateTime.wednesday:
        return 'Thứ 4';
      case DateTime.thursday:
        return 'Thứ 5';
      case DateTime.friday:
        return 'Thứ 6';
      case DateTime.saturday:
        return 'Thứ 7';
      default:
        return 'Chủ Nhật';
    }
  }
}
