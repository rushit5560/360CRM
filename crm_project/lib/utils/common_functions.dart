import 'package:intl/intl.dart';

class DateFormatChanger {

  String dateFormat(DateTime date) {
    String formatDate = DateFormat("MM-dd-yyyy").format(date);
    return formatDate;
  }

}