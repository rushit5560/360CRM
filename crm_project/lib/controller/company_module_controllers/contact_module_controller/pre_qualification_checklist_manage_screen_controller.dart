import 'package:get/get.dart';

import '../../../utils/enums.dart';

class PreQualificationChecklistMangeScreenController extends GetxController {
  String contactId=Get.arguments[0];
  PreQualificationChecklistOption preQualificationChecklistOption=Get.arguments[1];
  RxBool isLoading= false.obs;
}
