import 'dart:convert';
import 'dart:developer';
import 'package:crm_project/constants/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;
import '../../models/address_manage_screen_model/address_list_model.dart';
import '../../models/success_model/success_model.dart';
import '../../utils/messaging.dart';
import 'package:http/http.dart' as http;

class AddressListScreenController extends GetxController {
  String companyId = Get.arguments[0];
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  final ScrollController scrollController = ScrollController();
  final searchTextFieldController = TextEditingController();
  bool hasMore = true;
  int pageIndex = 1;

  // int itemCount = 10;
  int pageCount = 10;

  final dioRequest = dio.Dio();
  List<AddressDetails> addressList = [];
// get address api
  Future<void> getAddressList() async {
    // isLoading(true);

    if (hasMore == true) {
      // isLoading(true);

      String url =
          "${ApiUrl.companyGetAddressApi}?PageNumber=$pageIndex&PageSize=$pageCount&type=company&id=$companyId";
      log("getAddressList Api url $url");
      try {
        http.Response response = await http.get(Uri.parse(url),
            headers: {"Authorization": "Bearer ${AppMessage.token}"});

        log('getAddressList Api Response : ${response.body}');

        AddressListModel addressListModel =
            AddressListModel.fromJson(json.decode(response.body));
        isSuccessStatusCode.value = addressListModel.statusCode;
        if (isSuccessStatusCode.value == 200) {
          addressList.addAll(addressListModel.data.data);

          if (addressListModel.data.data.length < 10) {
            hasMore = false;
          }
        } else {
          log('getAddressList Api Function Else ${addressListModel.data.message}');
          isLoading(false);
        }
      } catch (e) {
        log("getAddressList catch $e");
      }
      // isLoading(false);

      loadUI();
    } else {
      isLoading(false);
    }
    isLoading(false);
  }

// delete address api
  Future<void> deleteAddressFunction(
      {required String addressId, required int index}) async {
    isLoading(true);
    String url = ApiUrl.companyDeleteAddressApi;
    log('Delete Note Api Url : $url');

    try {
      Map<String, dynamic> bodyData = {"AddressId": addressId, "IsDeleted": true};

      final response = await dioRequest.put(
        url,
        data: bodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log('Delete Notes Api Response : ${jsonEncode(response.data)}');

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value == successModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        Fluttertoast.showToast(msg: successModel.message);
        addressList.removeAt(index);
      } else {
        log('Delete Note Else');
      }
    } catch (e) {
      log('Delete Note Error :$e');
    }
    isLoading(false);
  }


  // Change address status function
  Future<void> changeAddressFunction(
      {required String addressId,
        required bool status,
        required int index}) async {
    isLoading(true);
    String url = ApiUrl.companyAddressChangeStatusApi;

    Map<String, dynamic> bodyData = {"AddressId": addressId, "IsActive": status};

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
      addressList[index].isActive = status;
    } else {
      log('Change Status Function Else');
    }

    isLoading(false);
  }
  Future<void> initMethod() async {
    // isLoading(true);
    getAddressList();

    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        //api call for more pet
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        await getAddressList();
      }
    });
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    // isLoading(true);
    initMethod();
    super.onInit();
  }
}
