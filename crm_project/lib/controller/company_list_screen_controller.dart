import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyListScreenController extends GetxController{

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool isCompanyStatus = false.obs;
  final searchTextFieldController = TextEditingController();

  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int pageIndex = 1;




  // get Company List Function
  Future<void> getCompanyListFunction() async {
    // isLoading(true);
    if(hasMore == true) {
      String url = "${ApiUrl.allCompanyListApi}?PageNumber=$pageIndex&PageSize=10&CustomerId=${AppMessage.customerId}";
      log('Get Company Api Url : $url');
      log('');
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