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
import '../../models/address_manage_screen_model/get_by_id_address_model.dart';
import '../../models/success_model/success_model.dart';
import '../../utils/messaging.dart';

class AddressManageScreenController extends GetxController {
  AddressOption addressOption = Get.arguments[0];
  String companyId = Get.arguments[1].toString();
  String addressId = Get.arguments[2].toString();
  String stateId = "";
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxString appBarHeader = "".obs;
  RxInt isSuccessStatusCode = 0.obs;
  RxString addressTypeId = ''.obs;
  RxString stateTypeId = "".obs;
  RxString cityTypeId = "".obs;

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
  RxBool isAddressStatus = false.obs;
  List<CityList> filterCityList = [];
  TextEditingController addressOneFieldController = TextEditingController();

  TextEditingController addressTwoFieldController = TextEditingController();
  TextEditingController zipCodeFieldController = TextEditingController();

// address Type ID find
  void addressTypeIdFindFunction() {
    for (int i = 0; i < addressTypeListDropDown.length; i++) {
      if (addressTypeSelect.value == addressTypeListDropDown[i].addressTypes) {
        addressTypeSelect.value = addressTypeListDropDown[i].addressTypes.toString();
        addressTypeId.value =
            addressTypeListDropDown[i].addressTypeId.toString();
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
  Future<void> getAllAddressTypeFunction() async {
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

    await getAllStateFunction();
  }

// state Type ID find
  void stateTypeIdFindFunction() {
    for (int i = 0; i < stateListDropDown.length; i++) {
      if (stateTypeSelect.value == stateListDropDown[i].stateName) {
        stateTypeSelect.value = stateListDropDown[i].stateName;
        stateTypeId.value = stateListDropDown[i].stateId.toString();
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
        // isLoading(false);
        stateListDropDown.addAll(getAllStateModel.data);
        stateSelectedItem = stateListDropDown[0];

        log('getAllStateFunction Type List   : $stateListDropDown');
        log("getAllStateFunction stateSelectedItem $stateSelectedItem");
        // isLoading(false);
      }
    } catch (e) {
      log("getAllStateFunction catch $e");
    }

    if (addressOption == AddressOption.update) {
      await cityGetByIdFunction(stateId: stateSelectedItem!.stateId.toString());
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
        cityTypeId.value = cityListDropDown[i].cityId.toString();
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
  Future<void> cityGetByIdFunction(
      {required String stateId, bool isDropdownSelect = false}) async {
    String url = '${ApiUrl.cityGetById}?stateId=$stateId';
    log("cityGetByIdFunction stateTypeId $stateId:");

    log("cityGetByIdFunction url $url");

    try {
      log("cityGetByIdFunction try");
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log("cityGetByIdFunction response $response");
      CityGetByIdListModel cityGetByIdListModel =
          CityGetByIdListModel.fromJson(response.data);
      isSuccessStatusCode.value = cityGetByIdListModel.statusCode;
      if (isSuccessStatusCode.value == 200) {
        cityListDropDown.clear();
        cityTypeSelect.value = "Select city type";
        cityListDropDown.addAll(cityGetByIdListModel.data);
        citySelectedItem = cityListDropDown[0];

        /*for (var element in cityListDropDown) {
          log("element");
          if (element.stateId == stateTypeId.value) {
            log("element 111");
            log("element.stateId ${element.stateId} stateSelectedItem!.stateId ${stateTypeId.value}");
            citySelectedItem = element;
            log('getAllStateWiseCityFunction cityListDropDown : ${citySelectedItem!.cityName}');
          }
        }*/
      }
    } catch (e) {
      log("citygetByIdFunction catch $e");
    }

    if (addressOption == AddressOption.update) {
      if (isDropdownSelect == false) {
        await getByIdAddressFunction();
      } else {
        isLoading(false);
      }
    } else {
      isLoading(true);
      isLoading(false);
    }
    // finally {

    // }
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
      "IsActive": isAddressStatus.value,
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

//Get by id address api function
  Future<void> getByIdAddressFunction() async {
    log("addressId addressId $addressId");
    log("getByIdAddressFunction");
    isLoading(true);
    String url = "${ApiUrl.companyGetByIdAddressApi}?addressId=$addressId";
    log("getByIdAddressFunction api url: $url");
    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log("getByIdAddressFunction response: $response");
      UpdateAddressModel updateAddressModel =
          UpdateAddressModel.fromJson(response.data);
      isSuccessStatusCode.value = updateAddressModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        addressId = updateAddressModel.data.addressId.toString();
        addressTypeSelect.value =
            updateAddressModel.data.addressType.addressTypes.toString();
        addressTypeId.value =
            updateAddressModel.data.addressType.addressTypeId.toString();

        addressOneFieldController.text = updateAddressModel.data.address1;
        addressTwoFieldController.text = updateAddressModel.data.address2;
        zipCodeFieldController.text = updateAddressModel.data.zip;
        stateTypeSelect.value =
            updateAddressModel.data.state.stateName.toString();
        stateTypeId.value = updateAddressModel.data.state.stateId.toString();
        cityTypeSelect.value = updateAddressModel.data.city.cityName.toString();
        cityTypeId.value = updateAddressModel.data.city.cityId.toString();

        isAddressStatus.value = updateAddressModel.data.isActive;
      }
    } catch (e) {
      log("getByIdAddressFunction error : $e");
    }
    isLoading(false);
  }

// update address function
  Future<void> updateAddressDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.companyUpdateAddressApi;
    log("updateAddressDetails api url $url");
    Map<String, dynamic> updateData = {
      "AddressId": addressId,
      "AddressTypeId": addressTypeId.value,
      "CompanyID": companyId,
      "Address1": addressOneFieldController.text,
      "Address2": addressTwoFieldController.text,
      "StateID": stateTypeId.value,
      "Zip": zipCodeFieldController.text,
      "type": "company",
      "IsActive": isAddressStatus.value,
    };
    log("updateAddressDetails updateData $updateData");
    try {
      final response = await dioRequest.put(url,
          data: updateData,
          options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"},
          ));

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      log("updateAddressDetails  : ${successModel.statusCode}");

      if (successModel.statusCode == 200) {
        Get.back();
        Fluttertoast.showToast(msg: successModel.message);
        // isLoading(false);
      } else {
        log("Update Company : ${successModel.message}");
        Fluttertoast.showToast(msg: successModel.message);
        // isLoading(false);
      }
    } catch (e) {
      log("updateAddressDetails error $e");
    }
    isLoading(false);
  }

  Future<void> initMethod() async {
    bool isCreate = addressOption == AddressOption.create ? true : false;
    appBarHeader.value =
        isCreate == true ? AppMessage.addAddress : AppMessage.updateAddress;
    log("appBarHeader.value ${appBarHeader.value}");

    appTitleText.value = isCreate == true ? AppMessage.add : AppMessage.update;
    log("appBarHeader.value ${appBarHeader.value}");
    // appBarHeader.value = notesOption == NotesOption.create ? AppMessage.addNotes : AppMessage.notesDetails;
    // appBarHeader.value = "";

    // if (addressOption == AddressOption.create) {
    await getAllAddressTypeFunction();
    // }

    //  else if (addressOption == AddressOption.update) {
    //   log("AddressOption.update");
    //   await getByIdAddressFunction();
    // }
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
