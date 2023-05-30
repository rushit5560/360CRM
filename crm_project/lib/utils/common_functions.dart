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