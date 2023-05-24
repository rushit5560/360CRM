import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../constants/api_url.dart';
import '../../models/contact_screen_models/contact_list_model.dart';
import '../../utils/messaging.dart';


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
    if(hasMore == true) {
      // isLoading(true);
      String url = "${ApiUrl.companyContactListApi}?id=$companyId&PageNumber=$pageIndex&PageSize=$pageCount&contact.FirstName=${searchTextFieldController.text.trim()}";
      log('Get Notes Api Url :$url');

      try {
        final response = await dioRequest.get(
          url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}
          ),
        );
        log('Get Contact Api Response : ${jsonEncode(response.data)}');

        ContactListModel contactListModel = ContactListModel.fromJson(response.data);
        isSuccessStatusCode.value = contactListModel.statusCode;

        if (isSuccessStatusCode.value == 200) {
          contactList.addAll(contactListModel.data.data);

            if (contactListModel.data.data.length < 10) {
              hasMore = false;
            }

        } else {
          log('Get Notes Function Else ${contactListModel.statusCode}');
        }

      } catch (e) {
        // log("catch");
        if (e is dio.DioError && e.response != null) {
          final response = e.response;
          final statusCode = response!.statusCode;
          // log("statusCode $statusCode");
          if (statusCode == 400) {
            // log("no data found");
            isLoading(false);
          }
        }
        // log('Get Notes Function Error :$e');
        rethrow;
      }
      loadUI();
      // isLoading(false);
    } else {
      isLoading(false);
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