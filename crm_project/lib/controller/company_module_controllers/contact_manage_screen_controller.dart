import 'dart:convert';
import 'dart:developer';
import 'package:crm_project/models/contact_screen_models/get_by_id_contact_model.dart';
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
import '../../models/success_model/success_model.dart';
import '../../utils/common_functions.dart';
import '../../utils/messaging.dart';

class ContactManageScreenController extends GetxController {
  ContactOption contactOption = Get.arguments[0];
  String companyId = Get.arguments[1].toString();
  String contactId = Get.arguments[2].toString();

  RxBool isLoading = false.obs;
  final dioRequest = dio.Dio();
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  TextEditingController phoneTwoTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController otherTextEditingController = TextEditingController();
  TextEditingController faxTextEditingController = TextEditingController();
  TextEditingController emailOneTextEditingController = TextEditingController();
  TextEditingController emailTwoTextEditingController = TextEditingController();
  TextEditingController messengerClientTextEditingController =
      TextEditingController();
  TextEditingController messengerIDTextEditingController =
      TextEditingController();

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
  RxString showDueDate = "".obs;
  DateTime date = DateTime.now();
  RxString showDate = "".obs;
  RxBool isEmailOptOutStatus = false.obs;
  RxBool isContactActiveStatus = false.obs;

  RxString appTitleText = "".obs;
  RxString selectedRoleValue = "Select Role".obs;

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
        "${ApiUrl.activeAreaOfInterestGetAllApi}?customerId=${AppMessage.customerId}";
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

    if (contactOption == ContactOption.update) {
      await getByIdContactApiFunction();
    } else {
      log('GetAllAddressTypeFunction nothing');

      isLoading(false);
    }
    // isLoading(false);
    // await getAllActiveCompanyFunction();
  }

// get by id contact api function
  Future<void> getByIdContactApiFunction() async {
    isLoading(true);

    String url = "${ApiUrl.getByIdContactApi}?contactId=$contactId";
    log("getByIdContactApiFunction api url  111: $url");
    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log("getByIdContactApiFunction response: $response");

      GetByIdContactModel getByIdContactModel =
          GetByIdContactModel.fromJson(response.data);
      isSuccessStatusCode.value = getByIdContactModel.statusCode;
      if (isSuccessStatusCode.value == 200) {
        log("isSuccessStatusCode.value");
        firstNameTextEditingController.text =
            getByIdContactModel.data.contact.firstName;
        lastNameTextEditingController.text =
            getByIdContactModel.data.contact.lastName;
        // set role type value
        for (var element in contactRoleList) {
          if (element.contactRoleId ==
              getByIdContactModel.data.contactRole.contactRoleId) {
            // log("getByIdContactModel.data.roleId ${getByIdContactModel.data.contactRole.contactRoleId}");
            contactRoleDataValue = element;
          }
        }
        // set contct caregories
        for (var element in contactCategoryTypeList) {
          if (element.contactCategoryId ==
              getByIdContactModel.data.contact.contactCategoryId) {
            // log("getByIdContactModel.data.contactCategoryId ${getByIdContactModel.data.contactCategoryId}");
            contactDataCategoryTypeValue = element;
          }
        }

        // set companyid
        for (var element in companyList) {
          if (element.companyId == getByIdContactModel.data.companyId) {
            // log("getByIdContactModel.data.companyId ${getByIdContactModel.data.companyId}");
            companyDataValue = element;
          }
        }
        // set contact type
        for (var element in contactTypeList) {
          if (element.contactTypeId ==
              getByIdContactModel.data.contact.contactTypeId) {
            // log("getByIdContactModel.data.contactTypeId ${getByIdContactModel.data.contactTypeId}");
            contactDataTypeValue = element;
          }
        }

        // // Area of intrest
        // for (var element in activeAreaOfInterestList) {
        //   if (element.areaOfInterestId ==
        //       getByIdContactModel.data.contact.areaOfInterestId) {
        //     // log("getByIdContactModel.data.areaOfInterestId ${getByIdContactModel.data.areaOfInterestId}");
        //     activeAreaOfInterestDataValue = element;
        //   }
        // }
        phoneTextEditingController.text =
            getByIdContactModel.data.contact.phone;
        phoneTwoTextEditingController.text =
            getByIdContactModel.data.contact.phone2;
        phoneNumberTextEditingController.text =
            getByIdContactModel.data.contact.mobilePhone;
        faxTextEditingController.text = getByIdContactModel.data.contact.fax;
        otherTextEditingController.text =
            getByIdContactModel.data.contact.otherPhone;
        emailOneTextEditingController.text =
            getByIdContactModel.data.contact.email1;
        emailTwoTextEditingController.text =
            getByIdContactModel.data.contact.email2;
        messengerClientTextEditingController.text =
            getByIdContactModel.data.contact.messengerClient;
        messengerIDTextEditingController.text =
            getByIdContactModel.data.contact.messengerId;
        // set optOutDate
        DateTime dateSet = getByIdContactModel.data.contact.optOutDate;
        date = dateSet;
        showDate.value = DateFormatChanger().dateFormat(date);
        isEmailOptOutStatus.value = getByIdContactModel.data.contact.optOut;
        isContactActiveStatus.value = getByIdContactModel.data.isActive;
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

// add contact function
  Future<void> addContactFunction() async {
    isLoading(true);
    String url = ApiUrl.contactAddApi;
    log("addContactFunction api url: $url");
    String type = "Company";
    String customerId = AppMessage.customerId;
    String companyIdDropDownValue = companyDataValue.companyId.toString();
    String firstName = firstNameTextEditingController.text.trim();
    String lastName = lastNameTextEditingController.text.trim();
    String roleId = contactRoleDataValue.name == "Select Role"
        ? ""
        : contactRoleDataValue.contactRoleId.toString();
    String contactCategoryId = contactDataCategoryTypeValue.contactCategorys ==
            "Select Contact Category"
        ? ""
        : contactDataCategoryTypeValue.contactCategoryId.toString();
    String contactTypeId = contactDataTypeValue.contactTypes == "Select Contact"
        ? ""
        : contactDataTypeValue.contactTypeId.toString();
    String areaOfInterest =
        activeAreaOfInterestDataValue.type == "Select Area of Interest"
            ? ""
            : activeAreaOfInterestDataValue.areaOfInterestId.toString();
    String phone = phoneTextEditingController.text.trim();
    String phoneTwo = phoneTwoTextEditingController.text.trim();
    String mobilePhone = phoneNumberTextEditingController.text.trim();
    String fax = faxTextEditingController.text.trim();
    String otherPhone = otherTextEditingController.text.trim();
    String emailOne = emailOneTextEditingController.text.trim();
    String emailTwo = emailTwoTextEditingController.text.trim();
    String messengerClient = messengerClientTextEditingController.text.trim();
    String messengerId = messengerIDTextEditingController.text.trim();

    Map<String, dynamic> mainBody = {};
    mainBody['Type'] = type;
    mainBody['customerId'] = customerId;
    mainBody['id'] = companyId;
    mainBody['firstName'] = firstName;
    mainBody['lastName'] = lastName;
    // roleId != "" ? mainBody['RoleId'] = roleId : null;
    mainBody['RoleId'] = roleId;
    contactCategoryId != ""
        ? mainBody['contactCategoryId'] = contactCategoryId
        : null;
    companyIdDropDownValue != ""
        ? mainBody['companyid'] = companyIdDropDownValue
        : null;

    contactTypeId != "" ? mainBody['contactTypeId'] = contactTypeId : null;
    areaOfInterest != "" ? mainBody['areaOfInterestId'] = areaOfInterest : null;
    phone != "" ? mainBody['phone'] = phone : null;
    phoneTwo != "" ? mainBody['phone2'] = phoneTwo : null;
    mobilePhone != "" ? mainBody['mobilePhone'] = mobilePhone : null;
    phone != "" ? mainBody['phone'] = phone : null;
    fax != "" ? mainBody['fax'] = fax : null;
    otherPhone != "" ? mainBody['otherPhone'] = otherPhone : null;
    emailOne != "" ? mainBody['email1'] = emailOne : null;
    emailTwo != "" ? mainBody['email2'] = emailTwo : null;
    messengerClient != ""
        ? mainBody['messengerClient'] = messengerClient
        : null;
    messengerId != "" ? mainBody['messengerID'] = messengerId : null;
    mainBody['optOut'] = isEmailOptOutStatus.value;
    mainBody['optOutDate'] = date.toString().split(" ")[0];
    mainBody['isActive'] = isContactActiveStatus.value;

    log("addContactBodyData ${jsonEncode(mainBody)}");
    try {
      log("Add contact try");
      final response = await dioRequest.post(url,
          data: mainBody,
          options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"},
          ));

      log("addContactFunction response ${response.data}");

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      log("addContactFunction address : ${successModel.statusCode}");
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

// update contact function

  Future<void> updateContactFunction() async {
    isLoading(true);
    String url = ApiUrl.contactUpdateApi;
    log("updateContactFunction api url : $url");
    // String type = "Company";
    // String customerId = AppMessage.customerId;
    String companyIdDropDownValue = companyDataValue.companyId.toString();
    String firstName = firstNameTextEditingController.text.trim();
    String lastName = lastNameTextEditingController.text.trim();
    String roleId = contactRoleDataValue.name == "Select Role"
        ? ""
        : contactRoleDataValue.contactRoleId.toString();
    String contactCategoryId = contactDataCategoryTypeValue.contactCategorys ==
            "Select Contact Category"
        ? ""
        : contactDataCategoryTypeValue.contactCategoryId.toString();
    String contactTypeId = contactDataTypeValue.contactTypes == "Select Contact"
        ? ""
        : contactDataTypeValue.contactTypeId.toString();
    String areaOfInterest =
        activeAreaOfInterestDataValue.type == "Select Area of Interest"
            ? ""
            : activeAreaOfInterestDataValue.areaOfInterestId.toString();
    String phone = phoneTextEditingController.text.trim();
    String phoneTwo = phoneTwoTextEditingController.text.trim();
    String mobilePhone = phoneNumberTextEditingController.text.trim();
    String fax = faxTextEditingController.text.trim();
    String otherPhone = otherTextEditingController.text.trim();
    String emailOne = emailOneTextEditingController.text.trim();
    String emailTwo = emailTwoTextEditingController.text.trim();
    String messengerClient = messengerClientTextEditingController.text.trim();
    String messengerId = messengerIDTextEditingController.text.trim();
    Map<String, dynamic> mainBody = {};
    // mainBody['Type'] = type;
    // mainBody['customerId'] = customerId;
    mainBody['ContactID'] = contactId;

    // mainBody['id'] = companyId;
    mainBody['firstName'] = firstName;
    mainBody['lastName'] = lastName;
    roleId != "" ? mainBody['RoleId'] = roleId : null;
    // mainBody['RoleId'] = roleId;
    contactCategoryId != ""
        ? mainBody['contactCategoryId'] = contactCategoryId
        : null;
    companyIdDropDownValue != ""
        ? mainBody['companyid'] = companyIdDropDownValue
        : null;

    contactTypeId != "" ? mainBody['contactTypeId'] = contactTypeId : null;
    areaOfInterest != "" ? mainBody['areaOfInterestId'] = areaOfInterest : null;
    phone != "" ? mainBody['phone'] = phone : null;
    phoneTwo != "" ? mainBody['phone2'] = phoneTwo : null;
    mobilePhone != "" ? mainBody['mobilePhone'] = mobilePhone : null;
    phone != "" ? mainBody['phone'] = phone : null;
    fax != "" ? mainBody['fax'] = fax : null;
    otherPhone != "" ? mainBody['otherPhone'] = otherPhone : null;
    emailOne != "" ? mainBody['email1'] = emailOne : null;
    emailTwo != "" ? mainBody['email2'] = emailTwo : null;
    messengerClient != ""
        ? mainBody['messengerClient'] = messengerClient
        : null;
    messengerId != "" ? mainBody['messengerID'] = messengerId : null;
    mainBody['optOut'] = isEmailOptOutStatus.value;
    mainBody['optOutDate'] = date.toString().split(" ")[0];
    mainBody['isActive'] = isContactActiveStatus.value;

    log("updateContactFunction updateData $mainBody");
    try {
      final response = await dioRequest.put(
        url,
        data: mainBody,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );

      log('response :${jsonEncode(response.data)}');

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value == successModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        Fluttertoast.showToast(msg: successModel.message);
        Get.back();
      } else {
        log('addLedgerFunction Else');
      }
    } catch (e) {
      // if (e is dio.DioError && e.response != null) {
      //   final response = e.response;
      //   final statusCode = response!.statusCode;
      //   if (statusCode == 400) {
      //     Fluttertoast.showToast(msg: "Record Already Exist");
      //     log("Record Already Exist");
      //     isLoading(false);
      //   } else if (statusCode == 401) {
      //     log('Please login again!');
      //   }
      // }
      log('Error :$e');
    }
    isLoading(false);
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  /// Select Date Module
  Future<void> selectDate({
    required BuildContext context,
    required DateTime initialDate,
  }) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      // if (selectedDateType == SelectedDateType.date) {
      date = picked;
      showDate.value = DateFormatChanger().dateFormat(date);
      // }
      // else if(selectedDateType == SelectedDateType.dueDate) {
      //   dueDate = picked;
      //   showDueDate.value = DateFormatChanger().dateFormat(dueDate);
      // }
    }
  }

  Future<void> initMethod() async {
    // ignore: unrelated_type_equality_checks
    bool isCreate = contactOption == ContactOption.create ? true : false;
    appTitleText.value = isCreate == true ? AppMessage.add : AppMessage.update;
    appBarHeader.value =
        isCreate == true ? AppMessage.addContact : AppMessage.contactDetails;

    showDate.value = DateFormatChanger().dateFormat(date);

    await getAllContactRoleFunction();
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
