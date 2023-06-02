import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../constants/api_url.dart';
import '../../../models/repair_screen_models/active_repair_area_list_model.dart';
import '../../../models/repair_screen_models/repair_item_model.dart';
import '../../../utils/messaging.dart';

class RepairListScreenController extends GetxController {
  String companyId = Get.arguments[0];
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  final dioRequest = dio.Dio();
  // TextEditingController searchTextFieldController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<RepairAreaData> repairAreaList = [];
  RepairAreaData repairAreaDataValue = RepairAreaData();

  List<RepairItemModel> mainRepairDataList = [];


  void addMainRepairDataItem() {
    TextEditingController qtyFieldController = TextEditingController();
    RepairAreaData repairAreaDataValue = repairAreaList[0];
    String itemDataValue = "";
    TextEditingController descriptionFieldController = TextEditingController();
    TextEditingController unitCostFieldController = TextEditingController();
    TextEditingController totalFieldController = TextEditingController();
    DateTime dueDate = DateTime.now();
    DateTime completedDate = DateTime.now();
    bool isCompleted = false;

    mainRepairDataList.add(
      RepairItemModel(
        qtyFieldController: qtyFieldController,
        repairAreaDataValue: repairAreaDataValue,
        itemDataValue: itemDataValue,
        descriptionFieldController: descriptionFieldController,
        unitCostFieldController: unitCostFieldController,
        totalFieldController: totalFieldController,
        dueDate: dueDate,
        completedDate: completedDate,
        isCompleted: isCompleted,
      ),
    );
  }



  /// Get All Active Category Function
  Future<void> getAllActiveRepairAreaFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getAllActiveRepairAreaApi}?customerId=${AppMessage.customerId}";
    log('Get All Active Repair area Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Category Response :${response.data}');

      RepairAreaListModel repairAreaListModel =
      RepairAreaListModel.fromJson(response.data);
      isSuccessStatusCode.value = repairAreaListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        repairAreaList.clear();
        repairAreaList
            .add(RepairAreaData(repairAreas: "Select Area"));
        repairAreaDataValue = repairAreaList[0];
        repairAreaList.addAll(repairAreaListModel.data);
      } else {
        log('getAllActiveRepairAreaFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          // Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    isLoading(false);
    // await getAllActivePropertyFunction();
  }


  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getAllActiveRepairAreaFunction();
    addMainRepairDataItem();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}