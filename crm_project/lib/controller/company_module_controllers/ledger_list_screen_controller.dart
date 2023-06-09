import 'dart:convert';
import 'dart:developer';
import 'package:crm_project/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../models/ledger_screen_model/ledger_list_model.dart';
import '../../models/success_model/success_model.dart';
import '../../utils/enums.dart';
import '../../utils/messaging.dart';

class LedgerListScreenController extends GetxController {
  String companyId = Get.arguments[0];
  LedgerComingFrom ledgerComingFrom = Get.arguments[1];
  String contactId =Get.arguments[2];

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  final dioRequest = dio.Dio();

  TextEditingController searchTextFieldController = TextEditingController();
  List<LedgerData> ledgerList = [];

  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int pageIndex = 1;
  int pageCount = 10;

  /// Get All Ledger Function
  Future<void> getLedgersFunction() async {
    if (hasMore == true) {
      String url = ledgerComingFrom == LedgerComingFrom.company
          ? "${ApiUrl.getAllLedgerApi}?PageNumber=$pageIndex&PageSize=$pageCount&type=company&id=$companyId"
          : ledgerComingFrom == LedgerComingFrom.workOrder
              ? "${ApiUrl.getAllLedgerApi}?PageNumber=$pageIndex&PageSize=$pageCount&type=Workorder&id=$companyId"
              : "${ApiUrl.getAllLedgerApi}?PageNumber=$pageIndex&PageSize=$pageCount&type=contact&id=$companyId";
      log('Get Ledger Api Url : $url');
      try {
        final response = await dioRequest.get(
          url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}),
        );
        log('Get Ledger Api Response : ${jsonEncode(response.data)}');
        LedgerListModel ledgerListModel =
            LedgerListModel.fromJson(response.data);
        isSuccessStatusCode.value = ledgerListModel.statusCode;
        if (isSuccessStatusCode.value == 200) {
          ledgerList.addAll(ledgerListModel.data.data);
          if (ledgerListModel.data.data.length < pageCount) {
            hasMore = false;
          }
        } else {
          log('getLedgersFunction Else');
        }
      } catch (e) {
        if (e is dio.DioError && e.response != null) {
          final response = e.response;
          final statusCode = response!.statusCode;
          if (statusCode == 400) {
            // Fluttertoast.showToast(msg: "Record Already Exist");
            // log("Record Already Exist");
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

  /// Change Ledger status function
  Future<void> changeLedgerStatusFunction(
      {required String ledgerId,
      required bool status,
      required int index}) async {
    isLoading(true);
    String url = ApiUrl.ledgerStatusChangeApi;

    try {
      Map<String, dynamic> bodyData = {
        "AccountLedgerID": ledgerId,
        "IsActive": status
      };

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
        ledgerList[index].isActive = status;
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

  /// Delete Ledger Function
  Future<void> deleteLedgerFunction(
      {required String ledgerId, required int index}) async {
    isLoading(true);
    String url = ApiUrl.ledgerDeleteApi;
    log('Delete Ledger Api Url : $url');

    try {
      Map<String, dynamic> bodyData = {
        "AccountLedgerID": ledgerId,
        "IsDeleted": true
      };

      final response = await dioRequest.put(
        url,
        data: bodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log('Delete Ledger Api Response : ${jsonEncode(response.data)}');

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value == successModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        Fluttertoast.showToast(msg: successModel.message);
        ledgerList.removeAt(index);
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
    await getLedgersFunction();

    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        //api call for more notes
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        await getLedgersFunction();
      }
    });
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
