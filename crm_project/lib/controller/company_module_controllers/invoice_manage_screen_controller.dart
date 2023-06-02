import 'dart:developer';

import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../common_modules/common_toast_module.dart';
import '../../constants/api_url.dart';
import '../../models/bill_screen_model/active_payment_type_list_model.dart';
import '../../models/invoice_screen_models/invoice_item_list_model.dart';
import '../../models/invoice_screen_models/invoice_payment_list_model.dart';
import '../../models/ledger_screen_model/active_category_type_list_model.dart';
import '../../models/work_order_screen_models/details_work_order_screen_models/work_order_company_list_model.dart';
import '../../utils/common_functions.dart';
import '../../utils/messaging.dart';

class InvoiceManageScreenController extends GetxController {
  InvoiceOption invoiceManageOption = Get.arguments[0];
  String invoiceId = Get.arguments[1];
  RxBool isLoading = false.obs;

  WorkOrderDetailsDate selectedDateType = WorkOrderDetailsDate.date;

  GlobalKey<FormState> invoiceKey = GlobalKey<FormState>();
  final dioRequest = dio.Dio();
  RxInt isSuccessStatusCode = 0.obs;

//company <WorkOrderTypeData>
  List<WorkOrderCompanyData> billCompanyListDropDown = [];
  WorkOrderCompanyData billCompanyListValue = WorkOrderCompanyData();

//ship Company <WorkOrderTypeData>
  List<WorkOrderCompanyData> shipCompanyListDropDown = [];
  WorkOrderCompanyData shipCompanyListValue = WorkOrderCompanyData();

//bill Address
  final billAddressTextFieldController = TextEditingController();

//ship Address
  final shipAddressTextFieldController = TextEditingController();

//balance
  final balanceTextFieldController = TextEditingController();

//Total
  final totalTextFieldController = TextEditingController();

//paid isActive Status
  RxBool paidIsActive = false.obs;

//paid isActive Status
  RxBool printedIsActive = false.obs;

//Date
  DateTime selectedDate = DateTime.now();
  RxString showSelectedDate = "".obs;

//Date
  DateTime selectedDueDate = DateTime.now();
  RxString showSelectedDueDate = "".obs;

  //
  RxBool isItemModuleShow = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> itemFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> paymentFormKey = GlobalKey<FormState>();

  List<GlobalKey<FormState>> formKeyList = [];

  TabController? tabController;
  int selectedTabIndex = 0;

  List<CategoryTypeData> itemNameList = [];
  CategoryTypeData itemNameDataValue = CategoryTypeData();

  /// Item List Data
  List<InvoiceItemDetailsModel> mainItemList = [];

  void setMainItemListFunction() {
    /// List Module Data
    TextEditingController qtyFieldController = TextEditingController();
    TextEditingController descriptionFieldController = TextEditingController();
    TextEditingController unitFieldController = TextEditingController();
    TextEditingController priceFieldController = TextEditingController();
    TextEditingController itemTotalFieldController = TextEditingController();
    bool isActive = false;

    mainItemList.add(
      InvoiceItemDetailsModel(
          qtyFieldController: qtyFieldController,
          categoryTypeDataValue: itemNameList[0],
          // categoryTypeList: categoryTypeList,
          descriptionFieldController: descriptionFieldController,
          unitFieldController: unitFieldController,
          priceFieldController: priceFieldController,
          itemTotalFieldController: itemTotalFieldController,
          isActive: isActive),
    );
  }

  List<PaymentTypeData> paymentTypeList = [];
  PaymentTypeData paymentTypeDataValue = PaymentTypeData();

  List<CategoryTypeData> categoryTypeList = [];
  CategoryTypeData categoryTypeDataValue = CategoryTypeData();

  // Payment List Data
  List<InvoicePaymentListModel> mainPaymentList = [];

  void setMainPaymentListFunction() {
    TextEditingController amountFieldController = TextEditingController();
    TextEditingController referenceFieldController = TextEditingController();
    DateTime paymentDate = DateTime.now();

    mainPaymentList.add(
      InvoicePaymentListModel(
        amountFieldController: amountFieldController,
        paymentDate: paymentDate,
        paymentTypeDataValue: paymentTypeList[0],
        // paymentMethodDataValue: paymentMethodList[0],
        categoryTypeDataValue: categoryTypeList[0],
        referenceFieldController: referenceFieldController,
      ),
    );
  }

  // Select Date Module
  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (picked != null /*&& picked != selectedDate*/) {
      if (WorkOrderDetailsDate.date == selectedDateType) {
        selectedDate = picked;
        showSelectedDate.value = DateFormatChanger().dateFormat(selectedDate);
        log('Selected Date: $selectedDate');
        log('Date Type : ${selectedDateType.name}');
      } else if (WorkOrderDetailsDate.dueDate == selectedDateType) {
        selectedDueDate = picked;
        showSelectedDueDate.value =
            DateFormatChanger().dateFormat(selectedDueDate);
        log('Due Date: $selectedDueDate');
        log('Date Type : ${selectedDateType.name}');
      } else {
        log('Something Went Wrong');
      }
    }
  }

//company List
  Future<void> getCompanyListFunction() async {
// isLoading(true);
    final url =
        "${ApiUrl.workOrderCompanyApi}?CustomerId=${AppMessage.customerId}";
    log('get company list URL : $url');
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log('get company list response : ${response.data}');
      WorkOrderCompanyListModel workOrderCompanyListModel =
          WorkOrderCompanyListModel.fromJson(response.data);
      isSuccessStatusCode.value = workOrderCompanyListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        //bill company list
        billCompanyListDropDown.clear();
        billCompanyListDropDown.add(
            WorkOrderCompanyData(companyName: AppMessage.selectBillingCompany));
        billCompanyListValue = billCompanyListDropDown[0];
        billCompanyListDropDown.addAll(workOrderCompanyListModel.data);
        //ship company list
        shipCompanyListDropDown.clear();
        shipCompanyListDropDown.add(WorkOrderCompanyData(
            companyName: AppMessage.selectShippingCompany));
        shipCompanyListValue = shipCompanyListDropDown[0];
        shipCompanyListDropDown.addAll(workOrderCompanyListModel.data);
        log('company list Status Code : ${workOrderCompanyListModel.statusCode}');
      } else {
        log('get company list Status Code : ${workOrderCompanyListModel.statusCode}');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          CommonToastModule(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if (statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }
// isLoading(false);
    await getAllActiveCategoryFunction();
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
        categoryTypeList.add(CategoryTypeData(category: "Select Category"));
        categoryTypeDataValue = categoryTypeList[0];
        categoryTypeList.addAll(activeCategoryTypeListModel.data);

        itemNameList.clear();
        itemNameList.add(CategoryTypeData(category: "Select Item Name"));
        itemNameDataValue = itemNameList[0];
        itemNameList.addAll(activeCategoryTypeListModel.data);
      } else {
        log('getAllActiveCategoryFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          CommonToastModule(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if (statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    // if(billOption == BillOption.create) {
    //   // initializeMainItemListFunction();
    //   isLoading(false);
    // } else if(billOption == BillOption.update) {
    //   await billDetailsGetByIdFunction();
    // }
    await getAllActivePaymentTypeFunction();
  }

  /// Get All Active Payment Type Function
  Future<void> getAllActivePaymentTypeFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getAllActivePaymentTypeApi}?customerId=${AppMessage.customerId}";
    log('Get All Active Payment Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Property Response :${response.data}');

      ActivePaymentTypeListModel activePaymentTypeListModel =
          ActivePaymentTypeListModel.fromJson(response.data);
      isSuccessStatusCode.value = activePaymentTypeListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        paymentTypeList.clear();
        paymentTypeList
            .add(PaymentTypeData(paymentTypes: "Select Payment Type"));
        paymentTypeDataValue = paymentTypeList[0];
        paymentTypeList.addAll(activePaymentTypeListModel.data);
      } else {
        log('getAllActivePropertyFunction Else');
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          CommonToastModule(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if (statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }
    // isLoading(false);
    invoiceManageOption == InvoiceOption.update
        ? getInvoiceDetailsFunction()
        : null;
  }

//get Invoice Details
  Future<void> getInvoiceDetailsFunction() async {
    log('Get Invoice Details Function');
  }

// add invoice
  Future<void> addInvoiceFunction() async {
    log('add Invoice Function');
    final url = ApiUrl.addInvoiceApi;
    log('add Invoice URL : $url');

    try {
      List<Map<String, dynamic>> invoiceItemList = [];
      for (int i = 0; i < mainItemList.length; i++) {
        Map<String, dynamic> singleItemData = {
          "Qty": mainItemList[i].qtyFieldController.text.trim(),
          "AccountCategoryId": mainItemList[i]
              .categoryTypeDataValue
              .accountCategoryId
              .toString(),
          "ItemDescription":
              mainItemList[i].descriptionFieldController.text.trim(),
          "Unit": mainItemList[i].unitFieldController.text.trim(),
          "Price": mainItemList[i].priceFieldController.text.trim(),
          "ItemTotal": mainItemList[i].itemTotalFieldController.text.trim(),
          "IsActive": mainItemList[i].isActive
        };
        invoiceItemList.add(singleItemData);
      }

      List<Map<String, dynamic>> paymentList = [];
      for (var element in mainPaymentList) {
        Map<String, dynamic> singleItemData = {
          "type": "Invoice",
          "Amount": element.amountFieldController.text.trim(),
          "PaymentDate": DateFormatChangerYMD().dateFormat(element.paymentDate),
          "PaymentTypeID": element.paymentTypeDataValue.paymentTypeId,
          "AccountCategoryId": element.categoryTypeDataValue.accountCategoryId,
          "Reference": element.referenceFieldController.text.trim(),
        };
        paymentList.add(singleItemData);
      }

      Map<String, dynamic> mainBodyData = {};


    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          CommonToastModule(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if (statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }
  }

// updatw Invoice
  Future<void> updateInvoiceFunction() async {
    log('update Invoice Function');
  }

  @override
  void onInit() {
    log('Invoice Type : ${invoiceManageOption.toString()}');
    log('InvoiceID : ${invoiceId.toString()}');
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    isLoading(true);
    await getCompanyListFunction();
    isLoading(false);
  }

  loadUi() {
    isLoading(true);
    isLoading(false);
  }
}
