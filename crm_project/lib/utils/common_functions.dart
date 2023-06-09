import 'package:intl/intl.dart';

class DateFormatChanger {

  String dateFormat(DateTime date) {
    String formatDate = DateFormat("MM-dd-yyyy").format(date);
    return formatDate;
  }

}

class DateFormatChangerYMD {
  String dateFormat(DateTime date) {
    String formatDate = DateFormat("yyyy-MM-dd").format(date);
    return formatDate;
  }
}

class TimeFormatChanger{
  String formatTime(DateTime time) {
    final formatter = DateFormat('hh:mm'); // Define the desired time format here
    return formatter.format(time);
  }
}