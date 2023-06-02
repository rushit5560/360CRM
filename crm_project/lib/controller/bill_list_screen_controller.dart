import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../constants/api_url.dart';
import '../models/bill_screen_model/bill_list_model.dart';
import '../models/success_model/success_model.dart';
import '../utils/enums.dart';
import '../utils/messaging.dart';

class BillListScreenController extends GetxController {
  String companyId = Get.arguments[0];
  BillComingFrom billComingFrom = Get.arguments[1];
  String contactId = Get.arguments[2];

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  final dioRequest = dio.Dio();

  TextEditingController searchTextFieldController = TextEditingController();
  List<BillData> billList = [];

  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int pageIndex = 1;
  int pageCount = 10;

  // Get Bills list function
  Future<void> getBillFunction() async {
    if (hasMore == true) {
      String url = billComingFrom == BillComingFrom.company
          ? "${ApiUrl.getAllBillApi}?PageNumber=$pageIndex&PageSize=$pageCount&type=company&id=$companyId"
          : "${ApiUrl.getAllBillApi}?PageNumber=$pageIndex&PageSize=$pageCount&type=contact&id=$contactId";
      log('Get Bill Api Url : $url');

      try {
        final response = await dioRequest.get(
          url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}),
        );
        log('Get Bill Api Response : ${jsonEncode(response.data)}');

        BillListModel billListModel = BillListModel.fromJson(response.data);
        isSuccessStatusCode.value = billListModel.statusCode;

        if (isSuccessStatusCode.value == 200) {
          billList.addAll(billListModel.data.data);
          log('billList Length : ${billList.length}');
          if (billListModel.data.data.length < pageCount) {
            hasMore = false;
          }
        } else {
          log('getBillFunction Else');
        }
      } catch (e) {
        if (e is dio.DioError && e.response != null) {
          final response = e.response;
          final statusCode = response!.statusCode;
          if (statusCode == 400) {
            Fluttertoast.showToast(msg: "Record Already Exist");
            log("Record Already Exist");
            isLoading(false);
          } else if (statusCode == 401) {
            log('Please login again!');
          }
        }
        log('Error :$e');
      }

      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  // Change Bill status function
  Future<void> changeBillStatusFunction(
      {required String billId,
      required bool status,
      required int index}) async {
    isLoading(true);
    String url = ApiUrl.changeBillStatusApi;
    log('Change Bill Status Api Url :$url');

    try {
      Map<String, dynamic> bodyData = {"BillID": billId, "IsActive": status};

      final response = await dioRequest.put(
        url,
        data: bodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );

      log('Change Status Response :${jsonEncode(response.data)}');
      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        Fluttertoast.showToast(msg: successModel.message);
        billList[index].isActive = status;
      } else {
        log('Change Status Function Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if (statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    isLoading(false);
  }

  // Delete Ledger Function
  Future<void> deleteBillFunction(
      {required String billId, required int index}) async {
    isLoading(true);
    String url = ApiUrl.deleteBillApi;
    log('Delete Bill Api Url : $url');

    try {
      Map<String, dynamic> bodyData = {"BillID": billId, "IsDeleted": true};

      final response = await dioRequest.put(
        url,
        data: bodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log('Delete Bill Api Response : ${jsonEncode(response.data)}');

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value == successModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        Fluttertoast.showToast(msg: successModel.message);
        billList.removeAt(index);
      } else {
        log('Delete Ledger Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if (statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
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
    await getBillFunction();

    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        //api call for more notes
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        await getBillFunction();
      }
    });
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
