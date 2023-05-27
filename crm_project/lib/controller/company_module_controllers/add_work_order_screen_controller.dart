import 'dart:developer';

import 'package:crm_project/models/work_order_screen_models/active_work_order_list_model.dart';
import 'package:get/get.dart';

import '../../constants/api_url.dart';
import '../../utils/messaging.dart';
import 'package:dio/dio.dart' as dio;

class AddWorkOrderScreenController extends GetxController {
  String companyId = Get.arguments[0].toString();
  RxBool isLoading = false.obs;
  final dioRequest = dio.Dio();
  RxInt isSuccessStatusCode = 0.obs;

  //Work List DropDown Value
  List<WorkOrderListData> workOrderListDropDown = [];

  WorkOrderListData workOrderTypeValue = WorkOrderListData();

  RxBool workOrderIsActive = true.obs;

  // RxString workOrderTypeSelected = AppMessage.selectWorkOrder.obs;
  // RxString workOrderTypeId = ''.obs;

  //get Work order Data API call
  Future<void> getWorkOrderListData() async {
    isLoading(true);
    final url =
        '${ApiUrl.companyWorkOrderAddTypeListApi}?customerId=${AppMessage.customerId}';
    log('Get Work Order List Data URL : $url');
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log('get work order list response : $response');
      ActiveWorkOrderListModel activeWorkOrderListModel =
          ActiveWorkOrderListModel.fromJson(response.data);
      isSuccessStatusCode.value = activeWorkOrderListModel.statusCode;
      if (isSuccessStatusCode.value == 200) {
        workOrderListDropDown.clear();
        workOrderListDropDown.add(
            WorkOrderListData(workOrderDetails: AppMessage.selectWorkOrder));
        workOrderTypeValue = workOrderListDropDown[0];
        workOrderListDropDown.addAll(activeWorkOrderListModel.data);
      } else {
        log('Else get work order list data : ${activeWorkOrderListModel.statusCode}');
      }
    } catch (e) {
      log('catch get work order list data : $e');
    }
    isLoading(false);
  }

  //add work order
  Future<void> addWorkOrderFunction() async {
    final url = ApiUrl.companyWorkOrderAddApi;
    log('add work order URL: $url');
    try {
      Map<String, dynamic> addWorkOrderData = {
          "workOrderStatusID":workOrderTypeValue.workOrderStatusId,
          "actualCost": workOrderTypeValue.actualCost,
          "budget":workOrderTypeValue.budget,
          "workOrderDetails":workOrderTypeValue.workOrderDetails,
          "companyId":companyId.toString(),
          "unit": workOrderTypeValue.unit,
          "perDiemBonus": workOrderTypeValue.perDiemBonus,
          "perDiemPenalty": workOrderTypeValue.perDiemPenalty,
          "percentOfBudget": workOrderTypeValue.percentOfBudget,
          "projectedCost": workOrderTypeValue.projectedCost,
          "costOverRuns":workOrderTypeValue.costOverRuns,
          "specialTerms": workOrderTypeValue.specialTerms,
          "workOrderTypeID": workOrderTypeValue.workOrderTypeId,
          "customerId":workOrderTypeValue.customerId,
          "type": workOrderTypeValue.type,
          "isActive":workOrderIsActive.value
      };

      final response = await dioRequest.post(url,
          data: addWorkOrderData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log('catch add work order : $response');
    } catch (e) {
      log('catch add work order : $e');
    }
  }

  @override
  void onInit() {
    log('companyId: $companyId');
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getWorkOrderListData();
  }
}
