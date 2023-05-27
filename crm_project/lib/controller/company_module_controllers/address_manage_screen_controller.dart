import 'dart:developer';
import 'package:crm_project/models/address_manage_screen_model/get_all_city_model.dart';
import 'package:crm_project/models/address_manage_screen_model/get_all_state_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../constants/api_url.dart';
import '../../models/address_manage_screen_model/address_list_model.dart';
import '../../models/address_manage_screen_model/city_get_by_id_model.dart';
import '../../models/address_manage_screen_model/get_all_address_model.dart';
import '../../models/success_model/success_model.dart';
import '../../utils/messaging.dart';

class AddressManageScreenController extends GetxController {
  AddressOption addressOption = Get.arguments[0];
  String companyId = Get.arguments[1].toString();

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
  CityGetByIdData? citySelectedItem;
  List<CityGetByIdData> cityListDropDown = [];
  List<AddressDetails> addressList = [];
  RxBool isCompanyStatus = false.obs;
  List<CityList> filterCityList = [];
  TextEditingController addressOneFieldController = TextEditingController();

  TextEditingController addressTwoFieldController = TextEditingController();
  TextEditingController zipCodeFieldController = TextEditingController();

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
    // if (addressOption == AddressOption.create) {
    //   log("getAllStateFunction");
    //   await getAllStateWiseCityFunction(stateTypeId.value.toString());
    // } else {
    //   log('GetAllAddressTypeFunction nothing');
    // }
    isLoading(false);
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
  Future<void> cityGetByIdFunction({required String stateId}) async {
    String url = '${ApiUrl.cityGetById}?stateId=$stateId';
    log("citygetByIdFunction stateTypeId $stateId:");

    log("citygetByIdFunction url $url");

    try {
      log("citygetByIdFunction try");
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log("citygetByIdFunction response $response");
      CityGetByIdListModel cityGetByIdListModel =
          CityGetByIdListModel.fromJson(response.data);
      isSuccessStatusCode.value = cityGetByIdListModel.statusCode;
      if (isSuccessStatusCode.value == 200) {
        // isLoading(false);
        cityListDropDown.clear();
        cityTypeSelect.value = "Select city type";
        cityListDropDown.addAll(cityGetByIdListModel.data);
        citySelectedItem = cityListDropDown[0];

        for (var element in cityListDropDown) {
          log("element");
          if (element.stateId == stateTypeId.value) {
            log("element 111");
            log("element.stateId ${element.stateId} stateSelectedItem!.stateId ${stateTypeId.value}");
            citySelectedItem = element;
            log('getAllStateWiseCityFunction cityListDropDown : ${citySelectedItem!.cityName}');
          }
        }
      }
    } catch (e) {
      log("citygetByIdFunction catch $e");
    } finally {
      isLoading(true);
      isLoading(false);
    }
  }

// add address function
  Future<void> addAddressDetails() async {
    isLoading(true);
    String url = ApiUrl.companyAddAddressApi;
    log("addAddressDetails api url : $url");

    Map<String, dynamic> addAddressData = {
      "AddressTypeId": addressTypeId.value,
      "CompanyID": companyId,
      "Address1": addressOneFieldController.text.trim(),
      "Address2": addressTwoFieldController.text.trim(),
      "StateID": stateTypeId.value,
      "Zip": zipCodeFieldController.text.trim(),
      "type": "company",
      "CityID": cityTypeSelect.value.isNotEmpty ? cityTypeId.value : "",
      "IsActive": isCompanyStatus.value,
    };
    log("addAddressData $addAddressData");

    try {
      log("Add address try");
      final response = await dioRequest.post(url,
          data: addAddressData,
          options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"},
          ));
      log("addAddressDetails response ${response.data}");

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      log("addAddressDetails address : ${successModel.statusCode}");

      if (successModel.statusCode == 201) {
        Get.back();
        Fluttertoast.showToast(msg: successModel.message);
        isLoading(false);
      } else {
        log("addAddressDetails else statusCode");
        Fluttertoast.showToast(msg: successModel.message);
        isLoading(false);
      }
    } catch (e) {
      log("addAddressDetails catch");
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        log("addAddressDetails statusCode $statusCode");
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        }
      }
    }
    isLoading(false);
  }

//update address api function
  Future<void> updateAddressFunction() async {
    isLoading(true);
    // String url=
    // isLoading(false);

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
