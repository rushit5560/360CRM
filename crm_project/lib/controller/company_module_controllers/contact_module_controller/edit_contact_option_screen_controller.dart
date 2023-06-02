import 'package:get/get.dart';
import '../../../utils/enums.dart';

class ContactOptionController extends GetxController{

  ContactOption contactOption = Get.arguments[0];
  String companyId = Get.arguments[1].toString();
  String contactId = Get.arguments[2].toString();
}
