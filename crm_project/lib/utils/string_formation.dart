import 'package:intl/intl.dart';

class StringFormation {

  String currencyFormatter(String value) {
    String currency = NumberFormat.currency(
      symbol: '₹ ',
      locale: "HI",
      decimalDigits: 2,
    ).format(double.parse(value));

    return currency;
  }
}