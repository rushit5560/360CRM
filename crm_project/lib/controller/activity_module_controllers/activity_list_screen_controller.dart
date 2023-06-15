import 'dart:developer';

import 'package:crm_project/common_modules/common_toast_module.dart';
import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/models/success_model/success_model.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;

import '../../models/activity_list_screen_models/activity_list_model.dart';
class ActivityListScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  final searchTextFieldController = TextEditingController();

  final dioRequest = dio.Dio();
  List<ActivityListData> activityList = [];

  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int pageIndex = 1;
  int pageCount = 10;

  //get Activity List
  Future<void> getActivityListFunction()async{

    if(hasMore){
      final url = "${ApiUrl.activityListApi}?PageNumber=$pageIndex&PageSize=$pageCount&CustomerId=${AppMessage.customerId}&Title=&ActivityType.Type=activity";
      log('Activity List URL : $url');
      try{
        final response = await dioRequest.get(url,
        options: dio.Options(headers: {"Authorization": "Bearer ${AppMessage.token}"}));
        // log("Activity list Response : $response");
        ActivityListModel activityListModel = ActivityListModel.fromJson(response.data);
        isSuccessStatusCode.value = activityListModel.statusCode;
        // log("Activity list status code : ${activityListModel.data.toJson()}");

        if(isSuccessStatusCode.value == 200){
          activityList.addAll(activityListModel.data.data);
          log("Activity list : ${activityList.length}");
          log("Activity list status code : ${activityListModel.statusCode}");
          if(pageCount > activityListModel.data.data.length){
            hasMore = false;
            log("Activity list hasMore : $hasMore");
          }
        }
        else{
          log("else Activity list status code : ${activityListModel.statusCode}");
        }


      }catch (e) {
        if (e is dio.DioError && e.response != null) {
          final response = e.response;
          final statusCode = response!.statusCode;
          if (statusCode == 400) {
            // CommonToastModule(msg: "Record Already Exist");
            log("Record Already Exist");
            isLoading(false);
          } else if(statusCode == 401) {
            log('Please login again!');
          }
        }
        log('Error :$e');
      }

    }
    loadUI();

  }

//Change Status
  Future<void> activityStatusChangeFunction({required int activityId,required bool status,required int index})async{
    final url = ApiUrl.activityStatusChangeApi;
    log("activity Status URL: $url");
    try{
      Map<String, dynamic> data = {
        "ActivityID": activityId,
        "IsActive": status
      };
      final response = await dioRequest.put(url,data:data ,options: dio.Options(
        headers: {"Authorization": "Bearer ${AppMessage.token}"}
      ));
      log("activity change status Responce : ${response.data}");
      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;
      if(isSuccessStatusCode.value == 200){
        activityList[index].isActive = status;
        log('activity change status message : ${successModel.message}');
        CommonToastModule(msg: successModel.message,backgroundColor: AppColors.greenColor);
      }
      else{
        CommonToastModule(msg: successModel.message,backgroundColor: AppColors.redColor);
        log('else activity change status message : ${successModel.message}');
      }

    }catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          // CommonToastModule(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }
    loadUI();
  }


//delete activity
Future<void> activityDeleteFunction({required int activityId,required int index})async{
    final url= ApiUrl.activitySoftDeleteApi;
    log('activity delete URL : $url');
    try{
      Map<String,dynamic> data={
        "ActivityID": activityId,
        "IsDeleted": true
      };
     final response = await dioRequest.put(url,data:data ,options: dio.Options(headers: {"Authorization": "Bearer ${AppMessage.token}"}));
    log("activity delete Response: ${response.data}");
    SuccessModel successModel = SuccessModel.fromJson(response.data);
    isSuccessStatusCode.value = successModel.statusCode;

    if(isSuccessStatusCode.value == 200){
      activityList.removeAt(index);
      Get.back();
      CommonToastModule(msg: successModel.message,backgroundColor: AppColors.greenColor);
      log("activity delete Response: ${successModel.message}");
    }else{
      CommonToastModule(msg: successModel.message,backgroundColor: AppColors.redColor);
      log("activity delete Response: ${successModel.message}");
    }

    }catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          // CommonToastModule(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    loadUI();
}
  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
  Future<void>initMethod()async{
    getActivityListFunction();
    scrollController.addListener(()async {
      if(scrollController.position.maxScrollExtent ==scrollController.offset){
       if(hasMore){
         pageIndex++;
       }
       log("Page Index: $pageIndex");
       await getActivityListFunction();
      }
    });
  }

  loadUI(){
    isLoading(true);
    isLoading(false);
  }
}