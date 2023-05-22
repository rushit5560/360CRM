import 'dart:async';
import 'dart:developer';

import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/models/company_list_screen_models/company_type_list_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants/api_url.dart';
import '../models/company_list_screen_models/manage_company_screen_model/manage_company_screen_update_model.dart';
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

  List<CompanyTypeDetails> companyTypeListDropDown = [];

  final companyNameTextField = TextEditingController();
  final phoneTextField = TextEditingController();
  final phone2TextField = TextEditingController();
  final faxTextField = TextEditingController();
  final fax2TextField = TextEditingController();
  final websiteTextField = TextEditingController();
  final emailTextField = TextEditingController();
  final companyTypeTextField = TextEditingController();
  RxString companyTypeSelect = 'Select Company Type '.obs;
  RxBool isCompanyStatus = false.obs;
  RxInt CompanyTypeId = 0.obs;

  //Update Time get Company Details
  Future<void> getCompanyDetailsFunction() async {
    isLoading(true);
    String url = '${ApiUrl.companyDetailsGetApi}+$companyId';
    log("Get Company Details Api Url : $url");

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      UpdateCompanyModel updateCompanyModel =
          UpdateCompanyModel.fromJson(response.data);
      log('response : ${updateCompanyModel.data.toJson()}');
      isSuccessStatusCode.value = updateCompanyModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        companyNameTextField.text = updateCompanyModel.data.companyName;
        phoneTextField.text = updateCompanyModel.data.phone;
        phone2TextField.text = updateCompanyModel.data.phone2;
        faxTextField.text = updateCompanyModel.data.fax;
        // fax2TextField.text = updateCompanyModel.data.f;
        websiteTextField.text = updateCompanyModel.data.website;
        emailTextField.text = updateCompanyModel.data.email;
        companyTypeSelect.value = updateCompanyModel.data.companyType.companyTypes;
        //isCompanyStatus.value = updateCompanyModel.data.isActive;
        companyId = updateCompanyModel.data.companyId;

        for (int i = 0; i < companyTypeListDropDown.length; i++) {
          if (companyTypeSelect.value ==
              companyTypeListDropDown[i].companyTypes) {
            companyTypeSelect.value = companyTypeListDropDown[i].companyTypes;
            log('Match found! Stopping the loop.');
            break; // Stop the loop when a match is found
          } else {
            log('Match not found! Stopping the loop.');
          }
        }

        log('Company Type Selected : ${companyTypeSelect.value}');
        log('Company Name : ${updateCompanyModel.data.companyName}');
        isLoading(false);
      } else {}
    } catch (e) {
      log('getCompanyDetails: $e');
    }
    isLoading(false);
  }

  //get Company Type List

  Future<void> getCompanyTypeList() async {
    isLoading(true);
    String url = '${ApiUrl.companyTypeList}${AppMessage.customerId}';
    log("Get Company Type Api Url : $url");
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      CompanyTypeListModel companyTypeListModel =
          CompanyTypeListModel.fromJson(response.data);
      log('response Company Type List : ${companyTypeListModel.data}');
      isSuccessStatusCode.value = companyTypeListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        isLoading(false);
        companyTypeListDropDown.addAll(companyTypeListModel.data);
        log('response Company Type List 2  : $companyTypeListDropDown');
        isLoading(false);
      } else {}
    } catch (e) {
      log('Company Type Details : $e');
    }

    if (companyOption == CompanyOption.update) {
      await getCompanyDetailsFunction();
    } else {
      log('Nothing');
      isLoading(false);
    }
  }
//update Company Details
  Future<void> updateCompanyDetails() async {
    isLoading(true);
    String url = ApiUrl.companyAddApi;
    log("update Company Api Url : $url");
    Map<String, dynamic> updateData = {
        "CompanyId" : companyId,
        "CompanyName" : companyNameTextField.text,
        "CompanyTypeId" : 3,
        "Phone" : phoneTextField.text,
        "Phone2" : phone2TextField.text,
        "Email" : emailTextField.text,
        "Fax" : faxTextField.text,
        "Website" : websiteTextField.text,
        "CustomerId" : AppMessage.customerId,
        "IsActive" : true
    };
    try{
      final response = await dioRequest.post(url,
          data:updateData,
          options: dio.Options(
        headers:{"Authorization": "Bearer ${AppMessage.token}"},

      ));
    }
    catch(e){
      log("Update Company : $e");
    }

  }

//Add Company Details
  Future<void> addCompanyDetails() async {
    isLoading(true);
    String url = ApiUrl.companyAddApi;


  }



  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getCompanyTypeList();
  }
}
