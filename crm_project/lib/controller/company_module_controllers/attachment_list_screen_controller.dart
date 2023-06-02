import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/models/success_model/success_model.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../models/attachment_list_screen_models/attachment_list_screen_model.dart';
import '../../utils/messaging.dart';

class AttachmentListScreenController extends GetxController {
  String companyId = Get.arguments[0];
  AttachmentComingFrom attachmentComingFrom = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  final dioRequest = dio.Dio();
  final searchTextFieldController = TextEditingController();
  final scrollController = ScrollController();

  //<Model Name>ist Type Ma
  List<AttachmentDetails> attachmentList = [];

  bool hasMore = true;
  int pageIndex = 1;
  int itemCount = 10;

//Get Attachment List
  Future<void> attachmentListFunction() async {
    if (hasMore == true) {
      String url = attachmentComingFrom == AttachmentComingFrom.company
          ? "${ApiUrl.companyAttachmentListApi}?PageNumber=$pageIndex&PageSize=$itemCount&type=company&id=$companyId"
          : "${ApiUrl.contactAttachmentApi}?PageNumber=$pageIndex&PageSize=$itemCount&type=contact&id=$companyId";
      log('Get Attachment Url: $url');
      try {
        final response = await dioRequest.get(url,
            options: dio.Options(
                headers: {"Authorization": "Bearer ${AppMessage.token}"}));
        log('Attachment responce: ${response.data}');
        AttachmentListModel attachmentListModel =
            AttachmentListModel.fromJson(response.data);
        isSuccessStatusCode.value = attachmentListModel.statusCode;
        if (isSuccessStatusCode.value == 200) {
          attachmentList.addAll(attachmentListModel.data.data);
          log("attachment Description 1 : $attachmentList");
          if (attachmentListModel.data.data.length < 10) {
            hasMore = false;
            log("Has More : $hasMore");
          }
          log("attachment List : ${attachmentList.length}");
        } else {
          log('Get Attachment List Function Else ${attachmentListModel.data.succeeded}');
        }
      } catch (e) {
        log('Catch attachment List : $e');
        if (e is dio.DioError && e.response != null) {
          final response = e.response;
          final statusCode = response!.statusCode;
          log("statusCode $statusCode");
          if (statusCode == 400) {
            log("no data found");
            isLoading(false);
          }
        }
        rethrow;
      }
      loadUi();
    } else {
      isLoading(false);
    }
    isLoading(false);
  }

//Delete Attachment
  Future<void> deleteAttachmentFunction(
      {required int index, required String attachmentId}) async {
    isLoading(true);
    final url = ApiUrl.companyAttachmentDeleteApi;
    log('Attachment Delete URL: $url');

    try {
      Map<String, dynamic> attachmentData = {
        "AttachmentID": attachmentId.toString(),
        "IsDeleted": true
      };

      final response = await dioRequest.put(url,
          data: attachmentData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log('Attachment delete responce: ${response.data}');
      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;
      if (isSuccessStatusCode.value == 200) {
        log('Attachment delete Success : $isSuccessStatusCode');
        Fluttertoast.showToast(msg: successModel.message);
        attachmentList.removeAt(index);
      } else {
        log('Attachment delete else: $isSuccessStatusCode');
      }
    } catch (e) {
      log('Catch delete attachment: $e');
    }
    isLoading(false);
  }

//Attachment status Change
  Future<void> statusChangeAttachmentFunction(
      {required String attachmentId,
      required bool status,
      required int index}) async {
    isLoading(true);
    final url = ApiUrl.companyAttachmentChangeStatusApi;
    log('status change Attachment URL: $url');
    try {
      Map<String, dynamic> attachmentStatusData = {
        "AttachmentID": attachmentId,
        "IsActive": status
      };

      final response = await dioRequest.put(url,
          data: attachmentStatusData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log('status change Attachment responce: ${response.data}');
      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        Fluttertoast.showToast(msg: successModel.message);
        attachmentList[index].isActive = status;
        log('status change Attachment : ${successModel.message}');
      } else {
        log('status change Attachment else ');
      }
    } catch (e) {
      log('Catch Attachment change status: $e');
    }

    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    log('Company Id: $companyId');
    super.onInit();
  }

  Future<void> initMethod() async {
    await attachmentListFunction();
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        await attachmentListFunction();
      }
    });
  }

  loadUi() {
    isLoading(true);
    isLoading(false);
  }
}
