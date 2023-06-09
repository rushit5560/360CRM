import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/enums.dart';

class ActivityDetailsScreenController extends GetxController{
  ActivityOption activityOption = Get.arguments[0];
  String activityId = Get.arguments[1];
  String activityName = Get.arguments[2];

  RxBool isLoading = false.obs;


}