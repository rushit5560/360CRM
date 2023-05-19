
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/enums.dart';

class ManageCompanyDetailsScreenController extends GetxController {
  var status = Get.arguments[0];

  String titleName = Get.arguments[1];

  GlobalKey<FormState> addCompanyKey = GlobalKey<FormState>();

  List<String> companyTypeListDropDown = [
    'Developer', 'Designer', 'Consultant', 'IT', 'Developer', 'Designer', 'Consultant', 'IT', 'Developer', 'Designer', 'Consultant', 'IT'];
  final companyNameTextField = TextEditingController();
  final phoneTextField = TextEditingController();
  final phone2TextField = TextEditingController();
  final faxTextField = TextEditingController();
  final fax2TextField = TextEditingController();
  final websiteTextField = TextEditingController();
  final emailTextField = TextEditingController();
  final companyTypeTextField = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    if(CompanyOption.update == status ){
      print(status);
      print("update: Screen");
      //update Api Call And Get
      companyNameTextField.text = 'Inford demo';
      phoneTextField.text = '000 000 000 0';
      phone2TextField.text= '000 000 000 0';
      faxTextField.text = '00 00 00 0';
      fax2TextField.text = '00 00 00 0';
      websiteTextField.text = 'www.yz.com';
      emailTextField.text = 'admin@email.com';
      companyTypeTextField.text = 'IT';
    }
  }
}
