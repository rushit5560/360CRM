import 'dart:developer';

import 'package:crm_project/common_modules/common_toast_module.dart';
import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/models/success_model/success_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import '../../models/activity_list_screen_models/activity_details_screen_models/activity_user_list_screen_models/activity_users_list_model.dart';
import '../../utils/enums.dart';
import '../../utils/messaging.dart';

class ActivityUserScreenController extends GetxController{
  ActivityOption activityOption = Get.arguments[0];
  String activityId = Get.arguments[1];
  String activityName = Get.arguments[2];

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  final searchTextFieldController = TextEditingController();


  final dioRequest = dio.Dio();
  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int pageIndex = 1;
  int pageCount = 10;

  List<UserListData> userList = [];


  //get user list
  Future<void>getUserListFunction()async{
    if(hasMore){
      final url = "${ApiUrl.userListApi}?PageNumber=$pageIndex&PageSize=$pageCount&SystemUser.FullName=&ActivityID=$activityId";
      log("user List URL: $url");
    try{
      final response = await dioRequest.get(url,options: dio.Options(headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      // log("user list Responce : $response");
      ActivityUsersListModel activityUsersListModel = ActivityUsersListModel.fromJson(response.data);
      isSuccessStatusCode.value = activityUsersListModel.statusCode;
      if(isSuccessStatusCode.value == 200){
        userList.addAll(activityUsersListModel.data.data);
        log("user list : ${userList.length}");
        log("user list status code : ${activityUsersListModel.statusCode}");
        if(pageCount > activityUsersListModel.data.data.length){
          hasMore = false;
          log("user list hasMore : $hasMore");
        }
      }
      else{
        log("else user list status code : ${activityUsersListModel.statusCode}");
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

  //change user status
Future<void>userChangeStatusFunction({required String userId ,required bool status, required index})async{
    final url = ApiUrl.userChangeStatusApi;
    log('user change status URL: $url');
    try{
      Map<String,dynamic>data={
        'mtmActivityUserId': userId,
        'IsActive': status};

      final response = await dioRequest.put(url,data: data,options: dio.Options(headers:{"Authorization": "Bearer ${AppMessage.token}"} ));
      log('user status Response: $response');

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;

      if(isSuccessStatusCode.value == 200){
        userList[index].isActive = status;
        CommonToastModule(msg: successModel.message,backgroundColor: AppColors.greenColor);
        log('user status Change Message: ${successModel.message}');
      }
      else{
        log('else user status Change Message: ${successModel.message}');
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

//user soft delete
Future<void>userSoftDeleteFunction({required String userId ,required index})async{
    final url = ApiUrl.userChangeStatusApi;
    log('user soft delete URL: $url');
    try{
      Map<String,dynamic>data=
        {'mtmActivityUserId': userId, 'IsDeleted': true};

      final response = await dioRequest.put(url,data: data,options: dio.Options(headers:{"Authorization": "Bearer ${AppMessage.token}"} ));
      log('user soft delete Response: $response');

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;

      if(isSuccessStatusCode.value == 200){
        userList.removeAt(index);
        Get.back();
        CommonToastModule(msg: successModel.message,backgroundColor: AppColors.greenColor);
        log('user soft delete Message: ${successModel.message}');
      }
      else{
        CommonToastModule(msg: successModel.message,backgroundColor: AppColors.redColor);
        log('else user soft delete Message: ${successModel.message}');
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
    getUserListFunction();
    scrollController.addListener(()async {
      if(scrollController.position.maxScrollExtent ==scrollController.offset){
        if(hasMore){
          pageIndex++;
        }
        log("Page Index: $pageIndex");
        await getUserListFunction();
      }
    });
  }
  loadUI(){
    isLoading(true);
    isLoading(false);
  }
}