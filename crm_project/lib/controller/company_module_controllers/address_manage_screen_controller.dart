import 'dart:developer';
import 'package:crm_project/models/address_manage_screen_model/get_all_city_model.dart';
import 'package:crm_project/models/address_manage_screen_model/get_all_state_model.dart';
import 'package:dio/dio.dart' as dio;

import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/api_url.dart';
import '../../models/address_manage_screen_model/get_all_address_model.dart';
import '../../utils/messaging.dart';

class AddressManageScreenController extends GetxController {
  AddressOption addressOption = Get.arguments[0];
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxString appBarHeader = "".obs;
  RxInt isSuccessStatusCode = 0.obs;
  RxInt addressTypeId = 0.obs;
  RxInt stateTypeId = 0.obs;
  RxInt cityTypeId = 0.obs;

  RxString appTitleText = "".obs;
  RxString addressTypeSelect = 'Select address type'.obs;
  RxString stateTypeSelect = 'Select state type'.obs;
  RxString cityTypeSelect = 'Select city type'.obs;

  final dioRequest = dio.Dio();
  List<AddressList> addressTypeListDropDown = [];
  List<StateList> stateListDropDown = [];
  StateList? stateSelectedItem;
  List<CityList> cityListDropDown = [];

// address Type ID find
  void addressTypeIdFindFunction() {
    for (int i = 0; i < addressTypeListDropDown.length; i++) {
      if (addressTypeSelect.value == addressTypeListDropDown[i].addressTypes) {
        addressTypeSelect.value = addressTypeListDropDown[i].addressTypes;
        addressTypeId.value = addressTypeListDropDown[i].addressTypeId;
        log('addressTypeIdFindFunction loop ');
        log('addressTypeIdFindFunction Type: $addressTypeSelect ');
        log('addressTypeIdFindFunction ID:  $addressTypeId');
        break; // Stop the loop when a match is found
      } else {
        log('addressTypeIdFindFunction Match not found! Stopping the loop.');
      }
    }
  }

//get all address type
  Future<void> GetAllAddressTypeFunction() async {
    log("GetAllAddressTypeFunction");
    isLoading(true);
    String url = '${ApiUrl.getAllAddress}?CustomerId=${AppMessage.customerId}';
    log("GetAllAddressTypeFunction url $url");
    try {
      log("GetAllAddressTypeFunction try");
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log("GetAllAddressTypeFunction response $response");
      GetAllAddressModel getAllAddressModel =
          GetAllAddressModel.fromJson(response.data);
      isSuccessStatusCode.value = getAllAddressModel.statusCode;
      if (isSuccessStatusCode.value == 200) {
        isLoading(false);
        addressTypeListDropDown.addAll(getAllAddressModel.data);
        log('GetAllAddressTypeFunction Type List   : $addressTypeListDropDown');
        isLoading(false);
      }
    } catch (e) {
      log("GetAllAddressTypeFunction catch $e");
    }
    if (addressOption == AddressOption.create) {
      log("getAllStateFunction");
      await getAllStateFunction();
    } else {
      log('GetAllAddressTypeFunction nothing');
      isLoading(false);
    }
  }

// state Type ID find
  void stateTypeIdFindFunction() {
    for (int i = 0; i < stateListDropDown.length; i++) {
      if (stateTypeSelect.value == stateListDropDown[i].stateName) {
        stateTypeSelect.value = stateListDropDown[i].stateName;
        stateTypeId.value = stateListDropDown[i].stateId;
        log('stateTypeIdFindFunction loop ');
        log('stateTypeIdFindFunction Type: $stateTypeSelect ');
        log('stateTypeIdFindFunction ID:  $stateTypeId');
        break; // Stop the loop when a match is found
      } else {
        log('stateTypeIdFindFunction Match not found! Stopping the loop.');
      }
    }
  }

// Get state list function
  Future<void> getAllStateFunction() async {
    isLoading(true);
    String url = '${ApiUrl.getAllState}?CustomerId=${AppMessage.customerId}';
    log("getAllStateFunction url $url");

    try {
      log("getAllStateFunction try");
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log("getAllStateFunction response $response");
      GetAllStateModel getAllStateModel =
          GetAllStateModel.fromJson(response.data);
      isSuccessStatusCode.value = getAllStateModel.statusCode;
      if (isSuccessStatusCode.value == 200) {
        isLoading(false);
        stateListDropDown.addAll(getAllStateModel.data);
        stateSelectedItem = stateListDropDown[0];

        log('getAllStateFunction Type List   : $stateListDropDown');
        log("getAllStateFunction stateSelectedItem $stateSelectedItem");
        isLoading(false);
      }
    } catch (e) {
      log("getAllStateFunction catch $e");
    }
    if (addressOption == AddressOption.create) {
      log("getAllStateFunction");
      await getAllStateWiseCityFunction(stateSelectedItem!.stateId.toString());
    } else {
      log('GetAllAddressTypeFunction nothing');
      isLoading(false);
    }
  }

// city Type ID find
  void cityTypeIdFindFunction() {
    for (int i = 0; i < cityListDropDown.length; i++) {
      if (cityTypeSelect.value == cityListDropDown[i].cityName) {
        cityTypeSelect.value = cityListDropDown[i].cityName;
        cityTypeId.value = cityListDropDown[i].cityId;
        log('cityTypeIdFindFunction loop ');
        log('cityTypeIdFindFunction Type: $cityTypeSelect ');
        log('cityTypeIdFindFunction ID:  $cityTypeId');
        break; // Stop the loop when a match is found
      } else {
        log('cityTypeIdFindFunction Match not found! Stopping the loop.');
      }
    }
  }

// Get city list function
  Future<void> getAllStateWiseCityFunction(String stateId) async {
    String url = '${ApiUrl.getAllCity}?CustomerId=${AppMessage.customerId}';
    log("getAllStateWiseCityFunction url $url");

    try {
      log("getAllStateWiseCityFunction try");
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log("getAllStateWiseCityFunction response $response");
      GetAllCityModel getAllCityModel = GetAllCityModel.fromJson(response.data);
      isSuccessStatusCode.value = getAllCityModel.statusCode;
      if (isSuccessStatusCode.value == 200) {
        isLoading(false);
        cityListDropDown.addAll(getAllCityModel.data);

        log('getAllStateWiseCityFunction Type List   : $cityListDropDown');
        isLoading(false);
      }
    } catch (e) {
      log("getAllStateWiseCityFunction catch $e");
    } finally {
      isLoading(true);
      isLoading(false);
    }
  }

  Future<void> initMethod() async {
    bool isCreate = addressOption == AddressOption.create ? true : false;
    appBarHeader.value =
        isCreate == true ? AppMessage.addAddress : AppMessage.updateAddress;
    log("appBarHeader.value $appBarHeader.value");

    appTitleText.value = isCreate == true ? AppMessage.add : AppMessage.update;
    log("appBarHeader.value $appBarHeader.value");
    // appBarHeader.value = notesOption == NotesOption.create ? AppMessage.addNotes : AppMessage.notesDetails;
    // appBarHeader.value = "";

    if (addressOption == AddressOption.create) {
      await GetAllAddressTypeFunction();
    }
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
