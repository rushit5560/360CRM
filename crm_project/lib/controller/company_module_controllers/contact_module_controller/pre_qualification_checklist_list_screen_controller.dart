import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:crm_project/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../models/pre_qulification_checklist_screen_model/get_pre_qualification_list.dart';
import '../../../models/success_model/success_model.dart';
import '../../../utils/messaging.dart';

class PreQualificationCheckListScreenController extends GetxController {
  String contactId = Get.arguments;
  RxBool isLoading = false.obs;
  final dioRequest = dio.Dio();
  RxInt isSuccessStatusCode = 0.obs;
  final ScrollController scrollController = ScrollController();

  List<PreQualificationList> preQualificationList = [];
  bool hasMore = true;
  int pageIndex = 1;
  int pageCount = 10;
  TextEditingController searchTextFieldController = TextEditingController();

  Future<void> getPreQualificationCheckListFunction() async {
    // isLoading(true);

    if (hasMore == true) {
      String url =
          "${ApiUrl.getPreQualificationListApi}?PageNumber=$pageIndex&PageSize=$pageCount&type=contact&id=$contactId";
      log("getPreQualificationCheckListFunction api url $url");
      try {
        final response = await dioRequest.get(
          url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}),
        );
        log('getContactsFunction Api Response : ${jsonEncode(response.data)}');

        GetPreQualificationCheckListModel getPreQualificationCheckListModel =
            GetPreQualificationCheckListModel.fromJson(response.data);

        isSuccessStatusCode.value =
            getPreQualificationCheckListModel.statusCode;

        if (isSuccessStatusCode.value == 200) {
          preQualificationList
              .addAll(getPreQualificationCheckListModel.data.data);
          log("contactList.length ${preQualificationList.length}");
          if (getPreQualificationCheckListModel.data.data.length < 10) {
            hasMore = false;
          }
        } else {
          log('getContactsFunction Function Else ${getPreQualificationCheckListModel.statusCode}');
          isLoading(false);
        }
      } catch (e) {
        if (e is dio.DioError && e.response != null) {
          final response = e.response;
          final statusCode = response!.statusCode;
          if (statusCode == 400) {
            // Fluttertoast.showToast(msg: "Record Already Exist");
            log("Record Already Exist");
            isLoading(false);
          } else if (statusCode == 401) {
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

  Future<void> deletePreQualificationCheckListFunction(
      {required String preQualificationId, required int index}) async {
    isLoading(true);
    String url = ApiUrl.deletePreQualificationCheckListApi;
    log("deletePreQualificationCheckListFunction api url: $url");
    try {
      Map<String, dynamic> bodyData = {
        "preQualificationCheckListId": preQualificationId,
        "IsDeleted": true,
        // "Type": "Company"
      };
      final response = await dioRequest.put(
        url,
        data: bodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log('deleteContactFunction Api Response : ${jsonEncode(response.data)}');

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value == successModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        Fluttertoast.showToast(msg: successModel.message);
        preQualificationList.removeAt(index);
      } else {
        log('deleteContactFunction Else');
      }
    } catch (e) {
      log("deletePreQualificationCheckListFunction error : $e");
    }
    isLoading(false);
  }

  Future<void> initMethod() async {
    isLoading(true);

    await getPreQualificationCheckListFunction();
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        //api call for more pet
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        await getPreQualificationCheckListFunction();
      }
    });
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
