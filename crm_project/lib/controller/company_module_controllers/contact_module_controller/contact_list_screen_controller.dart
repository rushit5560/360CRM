import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../constants/api_url.dart';
import '../../../models/contact_screen_models/contact_list_model.dart';
import '../../../models/success_model/success_model.dart';
import '../../../utils/messaging.dart';

class ContactListScreenController extends GetxController {
  String companyId = Get.arguments[0];

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  TextEditingController searchTextFieldController = TextEditingController();
  List<ContactDetails> contactList = [];

  final dioRequest = dio.Dio();

  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int pageIndex = 1;
  int pageCount = 10;

  // Get Notes List Function
  Future<void> getContactsFunction() async {
    if (hasMore == true) {
      // isLoading(true);
      String url =
          "${ApiUrl.companyContactListApi}?PageNumber=$pageIndex&PageSize=$pageCount&Contact.ContactCategory.ContactCategorys=&CompanyID=$companyId";
      log('getContactsFunction Api Url :$url');
      try {
        final response = await dioRequest.get(
          url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}),
        );
        log('getContactsFunction Api Response : ${jsonEncode(response.data)}');

        GetContactListModel getContactListModel =
            GetContactListModel.fromJson(response.data);
        isSuccessStatusCode.value = getContactListModel.statusCode;

        if (isSuccessStatusCode.value == 200) {
          contactList.addAll(getContactListModel.data.data);
          log("contactList.length ${contactList.length}");
          if (getContactListModel.data.data.length < 10) {
            hasMore = false;
          }
        } else {
          log('getContactsFunction Function Else ${getContactListModel.statusCode}');
          isLoading(false);
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
      loadUI();
      // isLoading(false);
    } else {
      isLoading(false);
    }
    isLoading(false);
  }

  // Change contact list status function
  Future<void> changeContactFunction(
      {required String contactId,
      required bool status,
      required int index}) async {
    isLoading(true);
    String url = ApiUrl.companyContactStatusChangeApi;

    Map<String, dynamic> bodyData = {
      "MTMCompanyContactId": contactId,
      "IsActive": status
    };

    final response = await dioRequest.put(
      url,
      data: bodyData,
      options:
          dio.Options(headers: {"Authorization": "Bearer ${AppMessage.token}"}),
    );

    log('Change Status Response :${jsonEncode(response.data)}');
    SuccessModel successModel = SuccessModel.fromJson(response.data);
    isSuccessStatusCode.value = successModel.statusCode;

    if (isSuccessStatusCode.value == 200) {
      Fluttertoast.showToast(msg: successModel.message);
      contactList[index].isActive = status;
    } else {
      log('Change Status Function Else');
    }

    isLoading(false);
  }

  Future<void> deleteContactFunction(
      {required String contactId, required int index}) async {
    isLoading(true);
    String url = ApiUrl.deleteContactApi;
    log("deleteContactFunction api url: $url");
    try {
      Map<String, dynamic> bodyData = {
        "MTMCompanyContactId": contactId,
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
        contactList.removeAt(index);
      } else {
        log('deleteContactFunction Else');
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
    await getContactsFunction();

    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        //api call for more pet
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        await getContactsFunction();
      }
    });
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
