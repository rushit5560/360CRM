import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

import '../constants/colors.dart';

Future CommonToastModule(
    {required String msg,
    Color backgroundColor = AppColors.appColors,
    Color textColor = AppColors.whiteColor}) {
  return Fluttertoast.showToast(
      msg: msg, backgroundColor: backgroundColor, textColor: textColor);
}
