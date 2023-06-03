import 'dart:developer';

import 'package:crm_project/common_modules/common_toast_module.dart';
import 'package:crm_project/models/success_model/success_model.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../constants/api_url.dart';
import '../../models/invoice_screen_models/invoice_list_model.dart';
import '../../utils/messaging.dart';

class InvoiceListScreenController extends GetxController {
  String companyId = Get.arguments[0];
  InvoiceComingFrom invoiceComingFrom = Get.arguments[1];
  String contactId = Get.arguments[2];

  RxInt isSuccessStatusCode = 0.obs;
  RxBool isLoading = false.obs;
  final dioRequest = dio.Dio();

  final searchTextFieldController = TextEditingController();
  ScrollController scrollController = ScrollController();
  int pageIndex = 1;
  int pageCount = 10;
  bool hasMore = true;

  List<InvoiceListData> invoiceList = [];

//get invoice list
  Future<void> getInvoiceListFunction() async {
    if (hasMore) {
      final url = invoiceComingFrom == InvoiceComingFrom.company
          ? '${ApiUrl.invoiceListApi}?PageNumber=$pageIndex&PageSize=$pageCount&SearchString=&type=company&id=$companyId'
          : '${ApiUrl.invoiceListApi}?PageNumber=$pageIndex&PageSize=$pageCount&SearchString=&type=contact&id=$contactId';
      log('Invoice List URL : $url');
      try {
        final response = await dioRequest.get(url,
            options: dio.Options(
                headers: {"Authorization": "Bearer ${AppMessage.token}"}));

        // log("invoice List Responce : ${response.data}");
        InvoiceListModel invoiceListModel =
            InvoiceListModel.fromJson(response.data);
        log("invoice List Responce : ${invoiceListModel.data.toJson()}");
        isSuccessStatusCode.value = invoiceListModel.statusCode;
        if (isSuccessStatusCode.value == 200) {
          invoiceList.addAll(invoiceListModel.data.data);
          log("invoice List length : ${invoiceList.length}");
          if (invoiceListModel.data.data.length < 10) {
            hasMore = false;
            log('Invoice List hasMore : $hasMore');
          }
        } else {
          log("else invoice List response : ${invoiceListModel.statusCode}");
        }
      } catch (e) {
        if (e is dio.DioError && e.response != null) {
          final response = e.response;
          final statusCode = response!.statusCode;
          if (statusCode == 400) {
            CommonToastModule(msg: "Record Already Exist");
            log("Record Already Exist");
            isLoading(false);
          } else if (statusCode == 401) {
            log('Please login again!');
          }
        }
        log('Error :$e');
      }
    }
    loadUi();
  }

  //change Status
  Future<void> changeStatusInvoiceFunction(
      {required invoiceId, required bool status, required index}) async {
    final url = ApiUrl.invoiceStatusChangeApi;
    log("invoice Status Change Url : $url");

    try {
      Map<String, dynamic> invoiceData = {
        "InvoiceID": invoiceId,
        "IsActive": status
      };

      final response = await dioRequest.put(url,
          data: invoiceData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));

      log("invoice Status Response : ${response.data}");
      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        invoiceList[index].isActive = status;
        log("invoice Status Response : ${successModel.statusCode}");
      } else {
        log("else invoice Status Response : ${successModel.statusCode}");
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          CommonToastModule(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if (statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }
    loadUi();
  }

  //Delete
  Future<void> deleteInvoiceFunction(
      {required invoiceId, required index}) async {
    final url = ApiUrl.invoiceSoftDeleteApi;
    log("invoice delete URL : $url");

    try {
      Map<String, dynamic> deleteData = {
        "InvoiceID": invoiceId,
        "IsDeleted": true
      };

      final response = await dioRequest.put(url,
          data: deleteData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log('invoice delete Responce : ${response.data}');
      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        Get.back();
        invoiceList.removeAt(index);
        log('invoice delete : ${successModel.message}');
      } else {
        log('else invoice delete : ${successModel.message}');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          CommonToastModule(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if (statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }
  }

  @override
  void onInit() {
    log('Company Id : $companyId');
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getInvoiceListFunction();
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (hasMore == true) {
          pageIndex++;
        }
        log('page Index: $pageIndex');
        await getInvoiceListFunction();
      }
    });
  }

  loadUi() {
    isLoading(true);
    isLoading(false);
  }
}
