import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;

import '../models/company_list_screen_models/company_list_model.dart';

class CompanyListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  RxInt successStatusCode = 0.obs;

  RxBool isCompanyStatus = false.obs;
  final searchTextFieldController = TextEditingController();

  final dioRequest = dio.Dio();
  List<CompanyData> companyList = [];

  // List companyList = [];

  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int pageIndex = 1;
  int itemCount = 10;


  // get Company List Function
  Future<void> getCompanyListFunction() async {
    // isLoading(true);
    if(hasMore == true) {
      String url = "${ApiUrl.allCompanyListApi}?PageNumber=$pageIndex&PageSize=$itemCount&CustomerId=${AppMessage.customerId}";
      log('Get Company Api Url : $url');

      try {
        final response = await dioRequest.get(
          url,
          options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}
          ),
        );

        // log('response : ${jsonEncode(response.data)}');
        CompanyListModel companyListModel = CompanyListModel.fromJson(response.data);
        isSuccessStatusCode.value = companyListModel.statusCode;
        // successStatusCode.value =

        if(isSuccessStatusCode.value == 200){
          // companyList.clear();
          companyList.addAll(companyListModel.data.data);
          log('companyList Length : ${companyList.length}');

          if (companyListModel.data.data.length < 10) {
            hasMore = false;
          }

        }
        else{
          log('Get Company Error Message :${companyListModel.data.message}');
        }

      }
      catch(e) {
        log('Get Company Function Error :$e');
      }


      loadUI();
    } else {
      isLoading(false);
    }

    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();

    super.onInit();
  }

  Future<void> initMethod() async {
    isLoading(true);
    await getCompanyListFunction();
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        //api call for more pet
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        await getCompanyListFunction();
      }
    });
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
