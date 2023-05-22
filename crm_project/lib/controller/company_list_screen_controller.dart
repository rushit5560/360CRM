import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;

class CompanyListScreenController extends GetxController{

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool isCompanyStatus = false.obs;
  final searchTextFieldController = TextEditingController();

  final dioRequest = dio.Dio();
  List companyList = [];

  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int pageIndex = 1;
  int itemCount = 15;




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

        log('response : ${response.data}');

        if(response.statusCode == 200){
          
          isLoading.value = false;
        }
        else{
          isLoading.value = true;
        }

      }
      catch(e) {
        log('Get Company Function Error :$e');
      }

    } else {
      isLoading(false);
    }
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
      if(scrollController.position.maxScrollExtent == scrollController.offset) {
        //api call for more pet
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        await getCompanyListFunction();
      }
    });
  }

}