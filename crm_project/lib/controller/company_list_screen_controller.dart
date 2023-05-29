import 'dart:convert';
import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/models/success_model/success_model.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;

import '../common_modules/common_toast_module.dart';
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
    if (hasMore == true) {
      String url =
          "${ApiUrl.allCompanyListApi}?PageNumber=$pageIndex&PageSize=$itemCount&CustomerId=${AppMessage.customerId}";
      log('Get Company Api Url : $url');

      try {
        final response = await dioRequest.get(
          url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}),
        );

        // log('response : ${jsonEncode(response.data)}');
        CompanyListModel companyListModel =
            CompanyListModel.fromJson(response.data);
        isSuccessStatusCode.value = companyListModel.statusCode;
        // successStatusCode.value =

        if (isSuccessStatusCode.value == 200) {
          // companyList.clear();
          companyList.addAll(companyListModel.data.data);
          log('companyList Length : ${companyList.length}');

          if (companyListModel.data.data.length < 10) {
            hasMore = false;
          }
        } else {
          log('Get Company Error Message :${companyListModel.data.message}');
        }
      }  catch (e) {
        if (e is dio.DioError && e.response != null) {
          final response = e.response;
          final statusCode = response!.statusCode;
          if (statusCode == 400) {
            CommonToastModule(msg: "Record Already Exist");
            log("Record Already Exist");
            isLoading(false);
          } else if(statusCode == 401) {
            log('Please login again!');
          }
        }
        log('Error :$e');
      }

      loadUI();
    } else {
      isLoading(false);
    }

    isLoading(false);
  }

//change company Status
  Future<void> changeCompanyStatusFunction({required companyId,required status,required index}) async {
    isLoading.value = true;
    final url = ApiUrl.companyChangeStatusApi;
    Map<String,dynamic> changeStatusData = {
      "CompanyId" : companyId,
      "IsActive" : status
    };
    log('change Company Status Api : $url');
    try {
      final response = await dioRequest.put(url,data: changeStatusData,options: dio.Options(
        headers: {"Authorization": "Bearer ${AppMessage.token}"}
      ));

      log('Delete Notes Api Response : ${jsonEncode(response.data)}');
      SuccessModel  successModel = SuccessModel.fromJson(response.data);
      if(successModel.statusCode == 200){
        isLoading.value = false;
        companyList[index].isActive = status;
        Fluttertoast.showToast(msg: successModel.message);
      }
      else{
        isLoading.value = false;
        Fluttertoast.showToast(msg: successModel.message);
      }

    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          CommonToastModule(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }
  }

//delete Company
  Future<void> deleteCompanyFunction({required context,required companyId,required index}) async {
    isLoading.value = true;
    final url = ApiUrl.companyDeleteApi;
    Map<String, dynamic> deleteData = {
      "CompanyId": companyId,
      "IsDeleted": true
    };

    try {
      final responce = await dioRequest.put(url,
          data: deleteData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      SuccessModel successModel = SuccessModel.fromJson(responce.data);

      if (successModel.statusCode == 200) {
        companyList.removeAt(index);
        Fluttertoast.showToast(msg: successModel.message);
        log('Company delete : ${successModel.message}');
        Get.back();
      } else {
        Fluttertoast.showToast(msg: successModel.message);
        log('else Company delete : ${successModel.message}');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          CommonToastModule(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
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
