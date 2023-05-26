import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/models/work_order_screen_models/work_order_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../utils/messaging.dart';

class WorkOrderListScreenController extends GetxController {
  String companyId = Get.arguments[0].toString();

  RxInt isSuccessStatusCode = 0.obs;
  RxBool isLoading = false.obs;
  final searchTextFieldController = TextEditingController();
  final dioRequest = dio.Dio();

  //<>List Type
  List<WorkOrderData> workOrderList = [];
  final ScrollController scrollController = ScrollController();


  bool hasMore = true;
  int pageIndex = 1;
  int pageCount = 10;

  Future<void> getWorkOrderList() async {
    // isLoading(true);
    if (hasMore) {
      final url =
          '${ApiUrl.companyWorkOrderList}?PageNumber=$pageIndex&PageSize=$pageCount&type=Company&id=$companyId';
      log('Work Order List URL: $url ');
      try {
        final response = await dioRequest.get(url,
            options: dio.Options(
                headers: {"Authorization": "Bearer ${AppMessage.token}"}));
        // log('Work Order List Response : $response');

        WorkOrderListModel workOrderListModel = WorkOrderListModel.fromJson(response.data);
        isSuccessStatusCode.value = workOrderListModel.statusCode;
        if (isSuccessStatusCode.value == 200) {
          log('Work Order List Response : ${response.statusMessage}');
          log('Work Order List Response : $workOrderList');
          workOrderList.addAll(workOrderListModel.data.data);
          if(workOrderListModel.data.data.length < 10){
            hasMore = false;
            log('Work Order List Response : ${workOrderListModel.data.data.length}');
            log('Work Order List Response : ${workOrderListModel.data.data}');
            log('Work Order List Response : $hasMore');
          }
        } else {
          log('else Work Order List Response : ${response.statusMessage}');
        }
      } catch (e) {
        log('Catch get work order List : $e');
      }
    }
    loadUi();
  }

  @override
  void onInit() {
    log("Company Id : $companyId");
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getWorkOrderList();
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        //api call for more notes
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        await getWorkOrderList();
      }
    });
  }

  loadUi() {
    isLoading(true);
    isLoading(false);
  }
}
