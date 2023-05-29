import 'dart:convert';
import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/models/success_model/success_model.dart';
import 'package:crm_project/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../models/ledger_screen_model/active_category_type_list_model.dart';
import '../../models/ledger_screen_model/active_company_list_model.dart';
import '../../models/ledger_screen_model/active_contact_model.dart';
import '../../models/ledger_screen_model/active_lease_model.dart';
import '../../models/ledger_screen_model/active_marketing_model.dart';
import '../../models/ledger_screen_model/active_mortgage_model.dart';
import '../../models/ledger_screen_model/active_property_model.dart';
import '../../models/ledger_screen_model/active_prospect_screen_model.dart';
import '../../models/ledger_screen_model/active_work_order_list_model.dart';
import '../../models/ledger_screen_model/ledger_details_model.dart';
import '../../utils/enums.dart';
import '../../utils/messaging.dart';
import '../../models/ledger_screen_model/active_property_management_screen_model.dart';

class LedgerManageScreenController extends GetxController {
  LedgerOption ledgerOption = Get.arguments[0];
  String ledgerId = Get.arguments[1];
  String companyId = Get.arguments[2];

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  GlobalKey<FormState> ledgerGlobalKey = GlobalKey<FormState>();


  final dioRequest = dio.Dio();

  RxString appBarHeader = "".obs;

  TextEditingController notesFieldController = TextEditingController();
  RxBool isStatusSelected = true.obs;
  RxBool isLedgerStatus = true.obs;

  DateTime selectedDate = DateTime.now();
  RxString showSelectedDate = "".obs;
  final amountFieldController = TextEditingController();
  final referenceFieldController = TextEditingController();
  final detailsFieldController = TextEditingController();

  List<String> typeList = [
    "Select Ledger Type",
    "Capital Expense",
    "Operating Expense",
    "Expense",
    "Income",
    "Deposit"
  ];
  RxString selectedTypeValue = "Select Ledger Type".obs;

  List<CategoryTypeData> categoryTypeList = [];
  CategoryTypeData categoryTypeDataValue = CategoryTypeData();

  RxString categoryTypeSelect = 'Select Category type'.obs;
  RxString categoryTypeId = ''.obs;

  List<PropertyData> propertyList = [];
  PropertyData propertyDataValue = PropertyData();

  List<CompanyData> companyList = [];
  CompanyData companyDataValue = CompanyData();

  List<WorkOrderData> workOrderList = [];
  WorkOrderData workOrderDataValue = WorkOrderData();

  List<MarketingData> marketingList = [];
  MarketingData marketingDataValue = MarketingData();

  List<ContactData> contactList = [];
  ContactData contactDataValue = ContactData();

  List<MortgageData> mortgageList = [];
  MortgageData mortgageDataValue = MortgageData();

  List<LeaseData> leaseList = [];
  LeaseData leaseDataValue = LeaseData();

  List<PropertyManagementData> propertyManagementList = [];
  PropertyManagementData propertyManagementDataValue = PropertyManagementData();

  List<ProspectManageData> prospectManageList = [];
  ProspectManageData prospectManageDataValue = ProspectManageData();



  /// Add Ledger Function
  Future<void> addLedgerFunction() async {
    // isLoading(true);
    String url = ApiUrl.companyLedgerAddApi;
    log('addLedgerFunction Api Url :$url');

    String amount = amountFieldController.text.trim();
    String type = "company";
    String accountCategoryId = categoryTypeDataValue.category == "Select Account Category" ? "" : categoryTypeDataValue.accountCategoryId.toString();
    String reference = referenceFieldController.text.trim();
    String details = detailsFieldController.text.trim();
    String propertyId = propertyDataValue.propertyName == "Select Property" ? "" : propertyDataValue.propertyId.toString();
    String companyId = companyDataValue.companyId.toString();
    String workOrderId = workOrderDataValue.workOrderDetails == "Select Work Order" ? "" : workOrderDataValue.workOrderId.toString() ;
    String marketingId = marketingDataValue.campaignName == "Select Marketing" ? "" : marketingDataValue.campaignId.toString();
    String contactId = contactDataValue.firstName == "Select" ? "" : contactDataValue.contactId.toString();
    String mortgageId = mortgageDataValue.mortgageName == "Select Mortgage" ? "" : mortgageDataValue.mortgageId.toString();
    String leaseId = leaseDataValue.gracePeriod == "Select Lease" ? "" : leaseDataValue.leaseId.toString();
    String propertyManagementId = propertyManagementDataValue.terminationTerms == "Select Property Management" ? "" : propertyManagementDataValue.propertyManagementId.toString();
    String prospectId = prospectManageDataValue.propertyAddress == "Select Prospect" ? "" : prospectManageDataValue.prospectId.toString();
    String ledgerType = selectedTypeValue.value == "Select Category type" ? "" : selectedTypeValue.value;


    try {
      Map<String, dynamic> bodyData = {
        "LedgerDate" : selectedDate.toString().split(" ")[0],
        "Amount": amount,
        "type": type,
        "AccountCategoryID": accountCategoryId,
        "Reference": reference,
        "Details": details,
        "propertyID": propertyId,
        "CompanyID": companyId,
        "workOrderID": workOrderId,
        "marketingID": marketingId,
        "contactID": contactId,
        "mortgageID": mortgageId,
        "leaseID": leaseId,
        "propertymanagementID": propertyManagementId,
        "prospectID": prospectId,
        "LedgerType": ledgerType,
        "IsActive": isLedgerStatus.value
      };
      log('bodyData : ${jsonEncode(bodyData)}');
      // log('BodyData : $bodyData');

      final response = await dioRequest.post(
        url,
        data: bodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value == successModel.statusCode;

      if(isSuccessStatusCode.value == 200) {
        Fluttertoast.showToast(msg: successModel.message);
        Get.back();
      } else {
        log('addLedgerFunction Else');
      }

    }catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }
  }

  /// Update Ledger Function
  Future<void> updateLedgerFunction() async {
    isLoading(true);
    String url = ApiUrl.companyLedgerUpdateApi;
    log("updateLedgerFunction Api Url :$url");

    String amount = amountFieldController.text.trim();
    String type = "company";
    String accountCategoryId = categoryTypeDataValue.category == "Select Account Category" ? "" : categoryTypeDataValue.accountCategoryId.toString();
    String reference = referenceFieldController.text.trim();
    String details = detailsFieldController.text.trim();
    String propertyId = propertyDataValue.propertyName == "Select Property" ? "" : propertyDataValue.propertyId.toString();
    String companyId = companyDataValue.companyId.toString();
    String workOrderId = workOrderDataValue.workOrderDetails == "Select Work Order" ? "" : workOrderDataValue.workOrderId.toString() ;
    String marketingId = marketingDataValue.campaignName == "Select Marketing" ? "" : marketingDataValue.campaignId.toString();
    String contactId = contactDataValue.firstName == "Select" ? "" : contactDataValue.contactId.toString();
    String mortgageId = mortgageDataValue.mortgageName == "Select Mortgage" ? "" : mortgageDataValue.mortgageId.toString();
    String leaseId = leaseDataValue.gracePeriod == "Select Lease" ? "" : leaseDataValue.leaseId.toString();
    String propertyManagementId = propertyManagementDataValue.terminationTerms == "Select Property Management" ? "" : propertyManagementDataValue.propertyManagementId.toString();
    String prospectId = prospectManageDataValue.propertyAddress == "Select Prospect" ? "" : prospectManageDataValue.prospectId.toString();
    String ledgerType = selectedTypeValue.value == "Select Category type" ? "" : selectedTypeValue.value;

    try {
      Map<String, dynamic> bodyData = {
        "AccountLedgerID": ledgerId,
        "LedgerDate" : selectedDate.toString().split(" ")[0],
        "Amount": amount,
        "type": type,
        "AccountCategoryID": accountCategoryId,
        "Reference": reference,
        "Details": details,
        "propertyID": propertyId,
        "CompanyID": companyId,
        "workOrderID": workOrderId,
        "marketingID": marketingId,
        "contactID": contactId,
        "mortgageID": mortgageId,
        "leaseID": leaseId,
        "propertymanagementID": propertyManagementId,
        "prospectID": prospectId,
        "LedgerType": ledgerType,
        "IsActive": isLedgerStatus.value
      };

      final response = await dioRequest.put(
        url,
        data: bodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );

      log('response :${jsonEncode(response.data)}');

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value == successModel.statusCode;

      if(isSuccessStatusCode.value == 200) {
        Fluttertoast.showToast(msg: successModel.message);
        Get.back();
      } else {
        log('addLedgerFunction Else');
      }


    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

  }

  /// Get Ledger Details Get By Id Function
  Future<void> getLedgerDetailsFunction() async {
    isLoading(true);
    String url = "${ApiUrl.companyLedgerGetByIdApi}?accountLedgerId=$ledgerId";
    log('getLedgerDetailsFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log('getLedgerDetailsFunction Response :${jsonEncode(response.data)}');

      LedgerDetailsGetByIdModel ledgerDetailsGetByIdModel = LedgerDetailsGetByIdModel.fromJson(response.data);
      isSuccessStatusCode.value = ledgerDetailsGetByIdModel.statusCode;

      if(isSuccessStatusCode.value == 200) {
        amountFieldController.text = ledgerDetailsGetByIdModel.data.amount.toString();
        referenceFieldController.text = ledgerDetailsGetByIdModel.data.reference;
        detailsFieldController.text = ledgerDetailsGetByIdModel.data.details;

        isStatusSelected.value = ledgerDetailsGetByIdModel.data.isActive;

        // Set Date in local variable
        DateTime date = ledgerDetailsGetByIdModel.data.ledgerDate;
        selectedDate = date;
        showSelectedDate.value = DateFormatChanger().dateFormat(selectedDate);

        // Set type Object value
        for (var element in typeList) {
          if (ledgerDetailsGetByIdModel.data.ledgerType == element) {
            selectedTypeValue.value = element;
          }
        }

        // Set category object value
        for (var element in categoryTypeList) {
          if (element.accountCategoryId ==
              ledgerDetailsGetByIdModel
                  .data.accountCategory.accountCategoryId) {
            categoryTypeDataValue = element;
          }
        }

        // Set property object value
        for (var element in propertyList) {
          if (element.propertyId ==
              ledgerDetailsGetByIdModel.data.property.propertyId) {
            propertyDataValue = element;
          }
        }

        // Set workOrder object value
        for (var element in workOrderList) {
          if (element.workOrderId ==
              ledgerDetailsGetByIdModel.data.workOrder.workOrderId) {
            workOrderDataValue = element;
          }
        }

        // Set Marketing object value
        for (var element in marketingList) {
          if (element.campaignId.toString() == ledgerDetailsGetByIdModel.data.campaignId) {
            marketingDataValue = element;
          }
        }

        // Set Contact object value
        for (var element in contactList) {
          if (element.contactId.toString() == ledgerDetailsGetByIdModel.data.contactId) {
            contactDataValue = element;
          }
        }

        // Set Mortgage object value
        for (var element in mortgageList) {
          if (element.mortgageId.toString() == ledgerDetailsGetByIdModel.data.mortgageId) {
            mortgageDataValue = element;
          }
        }

        // Set Lease object value
        for (var element in leaseList) {
          if (element.leaseId.toString() == ledgerDetailsGetByIdModel.data.leaseId) {
            leaseDataValue = element;
          }
        }

        // Set Property management object value
        for (var element in propertyManagementList) {
          if (element.propertyManagementId.toString() == ledgerDetailsGetByIdModel.data.propertyManagementId) {
            propertyManagementDataValue = element;
          }
        }

        // Set prospect object value
        for (var element in prospectManageList) {
          if (element.prospectId.toString() == ledgerDetailsGetByIdModel.data.prospectId) {
            prospectManageDataValue = element;
          }
        }



      } else {
        log('getLedgerDetailsFunction Else');
      }


    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }


    isLoading(false);
  }

  /// Select Date Module
  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (picked != null /*&& picked != selectedDate*/) {
        selectedDate = picked;
        showSelectedDate.value = DateFormatChanger().dateFormat(selectedDate);

    }
  }

  /// Category Type ID find
  void categoryTypeIdFindFunction() {
    for (int i = 0; i < categoryTypeList.length; i++) {
      if (categoryTypeSelect.value == categoryTypeList[i].category) {
        categoryTypeSelect.value = categoryTypeList[i].category!;
        categoryTypeId.value = categoryTypeList[i].accountCategoryId.toString();
        log('loop ');
        log('Company Type: $categoryTypeSelect ');
        log('Company ID:  $categoryTypeId');
        break; // Stop the loop when a match is found
      } else {
        log('Match not found! Stopping the loop.');
      }
    }
  }

  /// Get All Active Category Function
  Future<void> getAllActiveCategoryFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeAccountCategoryGetAllApi}?customerId=${AppMessage.customerId}";
    log('Get All Active Account Category Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Category Response :${response.data}');

      ActiveCategoryTypeListModel activeCategoryTypeListModel =
          ActiveCategoryTypeListModel.fromJson(response.data);
      isSuccessStatusCode.value = activeCategoryTypeListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        categoryTypeList.clear();
        categoryTypeList
            .add(CategoryTypeData(category: "Select Account Category"));
        categoryTypeDataValue = categoryTypeList[0];
        categoryTypeList.addAll(activeCategoryTypeListModel.data);
      } else {
        log('getAllActiveCategoryFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    // isLoading(false);
    await getAllActivePropertyFunction();
  }

  /// Get All Active Property Function
  Future<void> getAllActivePropertyFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activePropertyGetAllApi}?customerId=${AppMessage.customerId}";
    log('Get All Active Property Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Property Response :${response.data}');

      ActivePropertyListModel activePropertyListModel =
          ActivePropertyListModel.fromJson(response.data);
      isSuccessStatusCode.value = activePropertyListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        propertyList.clear();
        propertyList.add(PropertyData(propertyName: "Select Property"));
        propertyDataValue = propertyList[0];
        propertyList.addAll(activePropertyListModel.data);
      } else {
        log('getAllActivePropertyFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
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
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    // isLoading(false);
    await getAllActiveWorkOrderFunction();
  }

  /// Get All Active Work Order Function
  Future<void> getAllActiveWorkOrderFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeWorkOrderGetAllApi}?customerId=${AppMessage.customerId}";
    log('getAllActiveWorkOrderFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Company Response :${jsonEncode(response.data)}');

      ActiveWorkOrderListModel activeWorkOrderListModel =
          ActiveWorkOrderListModel.fromJson(response.data);
      isSuccessStatusCode.value = activeWorkOrderListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        workOrderList.clear();
        workOrderList.add(WorkOrderData(workOrderDetails: "Select Work Order"));
        workOrderDataValue = workOrderList[0];
        workOrderList.addAll(activeWorkOrderListModel.data);
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
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    // isLoading(false);
    await getAllActiveMarketingFunction();
  }

  /// Get All Active Marketing Function
  Future<void> getAllActiveMarketingFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeCampaignGetAllApi}?customerId=${AppMessage.customerId}";
    log('getAllActiveMarketingFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Marketing Response :${jsonEncode(response.data)}');

      ActiveMarketingListModel activeMarketingListModel =
          ActiveMarketingListModel.fromJson(response.data);
      isSuccessStatusCode.value = activeMarketingListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        marketingList.clear();
        marketingList.add(MarketingData(campaignName: "Select Marketing"));
        marketingDataValue = marketingList[0];
        marketingList.addAll(activeMarketingListModel.data);
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
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    // isLoading(false);
    await getAllActiveContactFunction();
  }

  /// Get All Active Contact Function
  Future<void> getAllActiveContactFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeContactGetAllApi}?customerId=${AppMessage.customerId}";
    log('getAllActiveContactFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Contact Response :${jsonEncode(response.data)}');

      ActiveContactListModel activeContactListModel =
          ActiveContactListModel.fromJson(response.data);
      isSuccessStatusCode.value = activeContactListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        contactList.clear();
        contactList.add(ContactData(firstName: "Select", lastName: "Contact"));
        contactDataValue = contactList[0];
        contactList.addAll(activeContactListModel.data);
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
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    // isLoading(false);
    await getAllActiveMortgageFunction();
  }

  /// Get All Mortgage Function
  Future<void> getAllActiveMortgageFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeMortgageGetAllApi}?customerId=${AppMessage.customerId}";
    log('getAllActiveContactFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Mortgage Response :${jsonEncode(response.data)}');

      ActiveMortgageListModel activeMortgageListModel =
          ActiveMortgageListModel.fromJson(response.data);
      isSuccessStatusCode.value = activeMortgageListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        mortgageList.clear();
        mortgageList.add(MortgageData(mortgageName: "Select Mortgage"));
        mortgageDataValue = mortgageList[0];
        mortgageList.addAll(activeMortgageListModel.data);
        // log("mortgageList ${mortgageList.length}");
      } else {
        log('getAllActiveMortgageFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    // isLoading(false);
    await getAllActiveLeaseFunction();
  }

  /// Get All Active Lease Function
  Future<void> getAllActiveLeaseFunction() async {
    isLoading(true);
    String url = ApiUrl.activeLeaseGetAllApi;
    log('getAllActiveLeaseFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Lease Response :${jsonEncode(response.data)}');

      ActiveLeaseListModel activeLeaseListModel =
          ActiveLeaseListModel.fromJson(response.data);
      isSuccessStatusCode.value = activeLeaseListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        // log("getAllActiveLeaseFunction isSuccessStatusCode.value ${isSuccessStatusCode.value}");
        leaseList.clear();
        leaseList.add(LeaseData(gracePeriod: "Select Lease"));

        leaseDataValue = leaseList[0];
        leaseList.addAll(activeLeaseListModel.data);
        // log("activeLeaseListModel.data ${activeLeaseListModel.data}");
        // log("leaseList.length ${leaseList.length}");
      } else {
        log('getAllActiveLeaseFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    // isLoading(false);

    await getAllPropertyManagementFunction();
  }

  /// Get All Property Management function
  Future<void> getAllPropertyManagementFunction() async {
    isLoading(true);
    String url = ApiUrl.activePropertyManagementGetAllApi;
    log('getAllPropertyManagementFunction Api Url 11 :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Property Management Response :${jsonEncode(response.data)}');

      ActivePropertyManagementListModel activePropertyManagementListModel =
          ActivePropertyManagementListModel.fromJson(response.data);
      isSuccessStatusCode.value = activePropertyManagementListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        propertyManagementList.clear();
        propertyManagementList.add(PropertyManagementData(
            terminationTerms: "Select Property Management"));
        propertyManagementDataValue = propertyManagementList[0];
        propertyManagementList.addAll(activePropertyManagementListModel.data);
        // log("propertyManagementList ${propertyManagementList.length}");
      } else {
        log('getAllPropertyManagementFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    // isLoading(false);
    await getAllProspectFunction();
  }

  /// Get All Prospect function
  Future<void> getAllProspectFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.activeProspectsManagementGetAllApi}?customerId=${AppMessage.customerId}";
    // log('getAllActiveContactFunction Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Prospect Response :${jsonEncode(response.data)}');

      ActiveProspectManageListModel activeProspectManageListModel =
          ActiveProspectManageListModel.fromJson(response.data);
      isSuccessStatusCode.value = activeProspectManageListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        prospectManageList.clear();
        prospectManageList.add(ProspectManageData(propertyAddress: "Select Prospect"));
        prospectManageDataValue = prospectManageList[0];
        prospectManageList.addAll(activeProspectManageListModel.data);
        // log("getAllProspectFunction.length ${prospectManageList.length}");
      } else {
        log('getAllProspectFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    isLoading(false);

    if(ledgerOption == LedgerOption.update) {
      await getLedgerDetailsFunction();
    }
    else if(ledgerOption == LedgerOption.create) {
      isLoading(false);
    }

    // await getAllActiveLeaseFunction();
  }


  // Change Ledger Label
  changeStatusFunction() {
    isStatusSelected.value = !isStatusSelected.value;
    loadUI();
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

  Future<void> initMethod() async {
    log('ledgerId :$ledgerId');
    bool isCreate = ledgerOption == LedgerOption.create ? true : false;
    appBarHeader.value =
        isCreate == true ? AppMessage.addLedger : AppMessage.ledgerDetails;

    showSelectedDate.value = DateFormatChanger().dateFormat(selectedDate);

    await getAllActiveCategoryFunction();
  }
}
