import 'package:intl/intl.dart';

class DateTimeHelper {
  static final _formatTime1 = DateFormat('yyyy-MM-dd HH:mm:ss');
  static final _formatTime2 = DateFormat('dd-MM-yyyy');
  static final _formatTime3 = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
  static final _formatTime4 = DateFormat('dd/MM/yyyy');
  static final _formatTime5 = DateFormat('hh:mm a MMMM dd, yyyy');

  /// yyyy-MM-dd HH:mm:ss
  static String timeToString1(DateTime time) => _formatTime1.format(time);

  /// dd-MM-yyyy
  static String timeToString2(DateTime time) => _formatTime2.format(time);

  /// yyyy-MM-dd'T'HH:mm:ss.SSSSSSS
  static String timeToString3(DateTime time) => _formatTime3.format(time);

  /// dd/MM/yyyy
  static String timeToString4(DateTime time) => _formatTime4.format(time);

  /// hh:mm:ss a MMM/dd/yyyy
  static String timeToString5(DateTime time) => _formatTime5.format(time);

  /// yyyy-MM-dd HH:mm:ss
  static DateTime stringToTime1(String time) => _formatTime1.parse(time);

  /// dd-MM-yyyy
  static DateTime stringToTime2(String time) => _formatTime2.parse(time);

  /// yyyy-MM-dd'T'HH:mm:ss.SSSSSSS
  static DateTime stringToTime3(String time) => _formatTime3.parse(time);

  static DateTime? stringToTime3Nullable(String? time) =>
      time != null ? _formatTime3.parse(time) : null;

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
