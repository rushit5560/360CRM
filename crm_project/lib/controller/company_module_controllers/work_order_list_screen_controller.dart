import 'dart:developer';

import 'package:crm_project/common_modules/common_toast_module.dart';
import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/models/success_model/success_model.dart';
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

//Work Order List Api Call Function
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

        WorkOrderListModel workOrderListModel =
            WorkOrderListModel.fromJson(response.data);
        isSuccessStatusCode.value = workOrderListModel.statusCode;
        if (isSuccessStatusCode.value == 200) {
          log('Work Order List Response : ${response.statusMessage}');
          log('Work Order List Response : $workOrderList');
          workOrderList.addAll(workOrderListModel.data.data);
          if (workOrderListModel.data.data.length < 10) {
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

// Status Change Function
  Future<void> changeWorkOrderStatusFunction(
      {required String workOrderID,
      required bool status,
      required int index}) async {
    isLoading(true);
    final url = ApiUrl.companyWorkOrderChangeStatusApi;
    log('Work order change status URL: $url');
    try {
      Map<String, dynamic> workOrderStatusChangeData = {
        "isActive": status,
        "workOrderID": workOrderID.toString()
      };

      final response = await dioRequest.put(url,
          data: workOrderStatusChangeData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log("work order status response : ${response.data}");
      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;
      if (isSuccessStatusCode.value == 200) {
        workOrderList[index].isActive = status;
        log('work order status change : ${successModel.message}');
      } else {
        log('Else work order status change : ${successModel.message}');
      }
    } catch (e) {
      log('catch work order status change : $e');
    }
    isLoading(false);
  }

//delete Work Order List
  Future<void> deleteWorkOrderFunction(
      {required String workOrderId, required int index}) async {
    isLoading(true);
    final url = ApiUrl.companyWorkOrderSoftDeleteApi;
    log("delete work order Api URL: $url");
    try {
      Map<String, dynamic> workOrderDeleteData = {
        "workOrderID": workOrderId.toString(),
        "IsDeleted": true
      };
      final response = await dioRequest.put(url,
          data: workOrderDeleteData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;
      log("work order responce: ${response.data}");
      if(isSuccessStatusCode.value==200){
        CommonToastModule(msg: successModel.message,backgroundColor: AppColors.greenColor);
        workOrderList.removeAt(index);
        log("work order deleted : ${successModel.message}");
      }
      else{
        CommonToastModule(msg: successModel.message,backgroundColor: AppColors.redColor);
        log("else work order deleted : ${successModel.message}");
      }


    } catch (e) {
      log("catch delete work order: $e");
    }
    isLoading(false);
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
