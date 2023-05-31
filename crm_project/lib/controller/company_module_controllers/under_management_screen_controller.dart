import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/screens/under_management_screen/under_management_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../models/under_management_screen_models/under_management_list_model.dart';
import '../../utils/messaging.dart';

class UnderManagementScreenController extends GetxController {
  String companyId = Get.arguments[0].toString();
  final searchTextFieldController = TextEditingController();
  RxBool isLoading = false.obs;
  final dioRequest = dio.Dio();

  RxInt isSuccessStatusCode = 0.obs;
  List<UnderManagementData> underManagementList = [];

  // ScrollController scrollController = ScrollController();
  //
  // bool hasMore = true;
  // int pageIndex = 1;
  // int pageCount = 10;

  Future<void> getUnderManagementList() async {
    isLoading(true);
    final url = "${ApiUrl.baseUrl}/Property/GetUnderManagementByCompany?companyId=$companyId";
    log("Under Management list URl: $url");
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log("under management list responce : $response");

      UnderManagementListModel underManagementListModel =UnderManagementListModel.fromJson(response.data);
      isSuccessStatusCode.value =  underManagementListModel.statusCode;

      if(isSuccessStatusCode.value == 200){
        underManagementList.addAll(underManagementListModel.data);

        log("Under Management list length: ${underManagementList.length}");
        log("Under Management list: ${underManagementListModel.statusCode}");
      }
      else{
        log("else Under Management list: ${underManagementListModel.statusCode}");
      }

    } catch (e) {
      log("Catch Under Management list: $e");
    }
    isLoading(false);
    loadUi();
  }

  @override
  void onInit() {
    log("Company Id : $companyId");
    initMethod();
    super.onInit();
  }
  Future<void>initMethod()async{
    await getUnderManagementList();
    // scrollController.addListener(() async{
    //   if(scrollController.position.maxScrollExtent == scrollController.offset){
    //     //Api Call
    //     if(hasMore == true){
    //       pageIndex++;
    //     }
    //     log("pageIndex : $pageIndex");
    //     await getUnderManagementList();
    //   }
    // });
  }

  loadUi(){
    isLoading(true);
    isLoading(false);

  }
}
