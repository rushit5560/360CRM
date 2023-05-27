import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../utils/messaging.dart';

class UnderManagementScreenController extends GetxController {
  String companyId = Get.arguments[0].toString();
  final searchTextFieldController = TextEditingController();
  RxBool isLoading = false.obs;
  final dioRequest = dio.Dio();

  Future<void> getUnderManagementList() async {
    isLoading(true);
    final url = "${ApiUrl.baseUrl}/Property/GetUnderManagementByCompany?companyId=$companyId";
    log("Under Management list URl: $url");
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log("under management list responce : $response");
    } catch (e) {
      log("Catch Under Management list: $e");
    }
    isLoading(false);
  }

  @override
  void onInit() {
    log("Company Id : $companyId");
    getUnderManagementList();
    super.onInit();
  }
}
