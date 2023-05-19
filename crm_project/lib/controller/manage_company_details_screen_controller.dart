import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants/api_url.dart';
import '../utils/enums.dart';

class ManageCompanyDetailsScreenController extends GetxController {
  CompanyOption companyOption = Get.arguments[0];
  String titleName = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> addCompanyKey = GlobalKey<FormState>();

  List<String> companyTypeListDropDown = [
    'Developer',
    'Designer',
    'Consultant',
    'IT',
    'Developer',
    'Designer',
    'Consultant',
    'IT',
    'Developer',
    'Designer',
    'Consultant',
    'IT'
  ];
  final companyNameTextField = TextEditingController();
  final phoneTextField = TextEditingController();
  final phone2TextField = TextEditingController();
  final faxTextField = TextEditingController();
  final fax2TextField = TextEditingController();
  final websiteTextField = TextEditingController();
  final emailTextField = TextEditingController();
  final companyTypeTextField = TextEditingController();

  Future<void> getCompanyDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.companyDetailsGetApi;
    log("Get Company Details Api Url : $url");
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    if (companyOption == CompanyOption.update) {
      companyNameTextField.text = 'Inford demo';
      phoneTextField.text = '000 000 000 0';
      phone2TextField.text = '000 000 000 0';
      faxTextField.text = '00 00 00 0';
      fax2TextField.text = '00 00 00 0';
      websiteTextField.text = 'www.yz.com';
      emailTextField.text = 'admin@email.com';
      companyTypeTextField.text = 'IT';
    } else {
      log('Nothing');
    }
  }
}
