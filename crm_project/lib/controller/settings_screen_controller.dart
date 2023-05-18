import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingScrreenController extends GetxController{
GlobalKey<FormState> settingScreenKey = GlobalKey<FormState>();
final estimatedTexBracketTextField = TextEditingController(text: '0.0');
final realtorFeesTextField = TextEditingController(text: '0.0');
final closingCostsTextField = TextEditingController(text: '0.0');
final defaultClosingCostsTextField = TextEditingController(text: '0');
final expectedHoldTermTextField = TextEditingController(text: '0');

RxDouble estimatedTexBracketSlider = 0.0.obs;
RxDouble realtorFeeSlider = 0.0.obs;
RxDouble closingCostSlider = 0.0.obs;
}