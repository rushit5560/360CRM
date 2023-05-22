
import 'dart:developer';

import 'package:crm_project/models/company_list_screen_models/manage_company_screen_mode/manage_company_screen_update_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants/api_url.dart';
import '../utils/enums.dart';
import '../utils/messaging.dart';

class ManageCompanyDetailsScreenController extends GetxController {
  CompanyOption companyOption = Get.arguments[0];
  String titleName = Get.arguments[1];
  int companyId = Get.arguments[2];


  final dioRequest = dio.Dio();
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  GlobalKey<FormState> addCompanyKey = GlobalKey<FormState>();

  List<String> companyTypeListDropDown = [
    'Developer',
    'Designer',
    'Consultant',
    'Test Company Type',
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


  //Update Time get Company Details
  Future<void> getCompanyDetailsFunction() async {
    isLoading(true);
    String url = '${ApiUrl.companyDetailsGetApi}+$companyId';
    log("Get Company Details Api Url : $url");

    try{
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}
        ),
      );
       UpdateCompanyModel updateCompanyModel = UpdateCompanyModel.fromJson(response.data);
      log('response : ${updateCompanyModel.data.toJson()}');
      isSuccessStatusCode.value = updateCompanyModel.statusCode;

      if(isSuccessStatusCode.value == 200){
        companyNameTextField.text = updateCompanyModel.data.companyName;
        phoneTextField.text = updateCompanyModel.data.phone;
        phone2TextField.text = updateCompanyModel.data.phone2;
        faxTextField.text = updateCompanyModel.data.fax;
        // fax2TextField.text = updateCompanyModel.data.f;
        websiteTextField.text = updateCompanyModel.data.website;
        emailTextField.text = updateCompanyModel.data.email;
        // companyTypeTextField.text = updateCompanyModel.data.companyType;
        log('response : ${updateCompanyModel.data.companyName}');
      }
      else{

      }
    }
    catch(e){
      log('getCompanyDetails: $e');
    }
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    if (companyOption == CompanyOption.update) {
      getCompanyDetailsFunction();
    } else {
      log('Nothing');
    }
  }
}
