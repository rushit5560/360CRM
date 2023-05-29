import 'dart:convert';
import 'dart:developer';

import 'package:crm_project/models/ledger_screen_model/active_company_list_model.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../constants/api_url.dart';
import '../../models/contact_screen_models/active_Contact_category_model.dart';
import '../../models/contact_screen_models/active_area_of_interest_model.dart';
import '../../models/contact_screen_models/active_contact_type_model.dart';
import '../../models/contact_screen_models/get_contact_role_model.dart';
import '../../utils/messaging.dart';

class ContactManageScreenController extends GetxController {
  ContactOption contactOption = Get.arguments[0];
  String companyId = Get.arguments[1].toString();
  RxBool isLoading = false.obs;
  final dioRequest = dio.Dio();
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  TextEditingController phoneTwoTextEditingController = TextEditingController();
  RxInt isSuccessStatusCode = 0.obs;
  GlobalKey<FormState> contactGlobalKey = GlobalKey<FormState>();

  List<ContactRoleData> contactRoleList = [];
  ContactRoleData contactRoleDataValue = ContactRoleData();

  List<ContactCategoryData> contactCategoryTypeList = [];
  ContactCategoryData contactDataCategoryTypeValue = ContactCategoryData();

  List<CompanyData> companyList = [];
  CompanyData companyDataValue = CompanyData();

  List<ContactDataType> contactTypeList = [];
  ContactDataType contactDataTypeValue = ContactDataType();

  List<ActiveAreaOfInterestData> activeAreaOfInterestList = [];
  ActiveAreaOfInterestData activeAreaOfInterestDataValue =
      ActiveAreaOfInterestData();

  RxString appBarHeader = "".obs;

  /// Get All contct role Function
  Future<void> getAllContactRoleFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.contactRoleGetAllApi}?customerId=${AppMessage.customerId}";
    log('getAllContactRoleFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log('getAllContactRoleFunction Response :${jsonEncode(response.data)}');

      GetContactRoleModel getContactRoleModel =
          GetContactRoleModel.fromJson(response.data);
      isSuccessStatusCode.value = getContactRoleModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        contactRoleList.clear();
        contactRoleList.add(ContactRoleData(name: "Select Role"));
        contactRoleDataValue = contactRoleList[0];
        contactRoleList.addAll(getContactRoleModel.data);
      } else {
        log('getAllContactRoleFunction Else');
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

    // isLoading(false);
    await getAllActiveContactCategoryTypeFunction();
  }

  /// Get All Active Contact Category Function
  Future<void> getAllActiveContactCategoryTypeFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeContactCategoryGetAllApi}?customerId=${AppMessage.customerId}";
    log('getAllActiveContactCategoryTypeFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log('getAllActiveContactCategoryTypeFunction Response :${jsonEncode(response.data)}');

      ActiveContactCategoryModel activeContactCategoryModel =
          ActiveContactCategoryModel.fromJson(response.data);
      isSuccessStatusCode.value = activeContactCategoryModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        contactCategoryTypeList.clear();
        contactCategoryTypeList.add(
            ContactCategoryData(contactCategorys: "Select Contact Category"));
        contactDataCategoryTypeValue = contactCategoryTypeList[0];
        contactCategoryTypeList.addAll(activeContactCategoryModel.data);
      } else {
        log('getAllActiveContactCategoryTypeFunction Else');
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

    // isLoading(false);
    await getAllActiveCompanyFunction();
  }

  /// Get All Active Company Function
  Future<void> getAllActiveCompanyFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeCompanyGetAllApi}?customerId=${AppMessage.customerId}";
    log('getAllActiveCompanyFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Company Response :${jsonEncode(response.data)}');

      ActiveCompanyListModel activeCompanyListModel =
          ActiveCompanyListModel.fromJson(response.data);
      isSuccessStatusCode.value = activeCompanyListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        companyList.clear();
        companyList.addAll(activeCompanyListModel.data);

        for (var element in companyList) {
          if (companyId == element.companyId.toString()) {
            companyDataValue = element;
          }
        }
        // log('companyDataValue companyId: ${companyDataValue.companyId}');
        // log('companyDataValue companyName: ${companyDataValue.companyName}');
      } else {
        log('getAllActiveCompanyFunction Else');
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

    // isLoading(false);
    await getAllActiveContactTypeFunction();
  }

  /// Get All Active Contact Function
  Future<void> getAllActiveContactTypeFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeContactTypeGetAllApi}?customerId=${AppMessage.customerId}";
    log('getAllActiveContactTypeFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('getAllActiveContactTypeFunction Response :${jsonEncode(response.data)}');

      ActiveContactTypeModel activeContactTypeModel =
          ActiveContactTypeModel.fromJson(response.data);
      isSuccessStatusCode.value = activeContactTypeModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        contactTypeList.clear();
        contactTypeList.add(ContactDataType(contactTypes: "Select Contact"));
        contactDataTypeValue = contactTypeList[0];
        contactTypeList.addAll(activeContactTypeModel.data);
      } else {
        log('getAllActiveContactTypeFunction Else');
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

    // isLoading(false);
    await getAllActiveAreaOfIntrestFunction();
  }

  /// Get All Active area of intrest  Function
  Future<void> getAllActiveAreaOfIntrestFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeAreaOfintrestGetAllApi}?customerId=${AppMessage.customerId}";
    log('getAllActiveAreaOfIntrestFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log('getAllActiveAreaOfIntrestFunction Response :${jsonEncode(response.data)}');

      GetAllActiveAreaOfInterestModel getAllActiveAreaOfInterestModel =
          GetAllActiveAreaOfInterestModel.fromJson(response.data);
      isSuccessStatusCode.value = getAllActiveAreaOfInterestModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        activeAreaOfInterestList.clear();
        activeAreaOfInterestList
            .add(ActiveAreaOfInterestData(type: "Select Area of Interest"));
        activeAreaOfInterestDataValue = activeAreaOfInterestList[0];
        activeAreaOfInterestList.addAll(getAllActiveAreaOfInterestModel.data);
      } else {
        log('getAllActiveAreaOfIntrestFunction Else');
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
    // await getAllActiveCompanyFunction();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  Future<void> initMethod() async {
    bool isCreate = contactOption == LedgerOption.create ? true : false;
    appBarHeader.value =
        isCreate == true ? AppMessage.addContact : AppMessage.contactDetails;

    // showSelectedDate.value = DateFormatChanger().dateFormat(selectedDate);

    await getAllContactRoleFunction();
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
