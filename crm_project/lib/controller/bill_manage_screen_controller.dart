import 'dart:convert';
import 'dart:developer';

import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/models/success_model/success_model.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../common_modules/common_toast_module.dart';
import '../constants/api_url.dart';
import '../models/bill_screen_model/active_payment_method_list_model.dart';
import '../models/bill_screen_model/active_payment_type_list_model.dart';
import '../models/bill_screen_model/bill_details_model.dart';
import '../models/bill_screen_model/item_list_model.dart';
import '../models/bill_screen_model/payment_list_model.dart';
import '../models/ledger_screen_model/active_category_type_list_model.dart';
import '../models/ledger_screen_model/active_company_list_model.dart';
import '../models/ledger_screen_model/active_property_model.dart';
import '../utils/common_functions.dart';
import '../utils/messaging.dart';

class BillManageScreenController extends GetxController {
  BillOption billOption = Get.arguments[0];
  String billId = Get.arguments[1];
  String companyId = Get.arguments[2];

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  RxString appBarHeader = "".obs;

  final dioRequest = dio.Dio();

  List<CompanyData> companyList = [];
  CompanyData companyDataValue = CompanyData();

  List<PropertyData> propertyList = [];
  PropertyData propertyDataValue = PropertyData();

  List<PaymentTypeData> paymentTypeList = [];
  PaymentTypeData paymentTypeDataValue = PaymentTypeData();

  List<PaymentMethodData> paymentMethodList = [];
  PaymentMethodData paymentMethodDataValue = PaymentMethodData();

  List<CategoryTypeData> categoryTypeList = [];
  CategoryTypeData categoryTypeDataValue = CategoryTypeData();

  List<CategoryTypeData> itemNameList = [];
  CategoryTypeData itemNameDataValue = CategoryTypeData();

  DateTime date = DateTime.now();
  RxString showDate = "".obs;

  DateTime dueDate = DateTime.now();
  RxString showDueDate = "".obs;

  RxBool isItemModuleShow = true.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> itemFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> paymentFormKey = GlobalKey<FormState>();

  List<GlobalKey<FormState>> formKeyList = [];

  TabController? tabController;
  int selectedTabIndex = 0;

  TextEditingController addressFieldController = TextEditingController();
  TextEditingController referenceFieldController = TextEditingController();
  TextEditingController balanceFieldController = TextEditingController();
  TextEditingController totalFieldController = TextEditingController();
  RxBool isPaidValue = false.obs;

  /// Item List Data
  List<ItemDetailsModel> mainItemList = [];
  void setMainItemListFunction() {
    /// List Module Data
    TextEditingController qtyFieldController = TextEditingController();
    TextEditingController descriptionFieldController = TextEditingController();
    TextEditingController unitFieldController = TextEditingController();
    TextEditingController priceFieldController = TextEditingController();
    TextEditingController itemTotalFieldController = TextEditingController();
    bool isActive = false;

    mainItemList.add(
      ItemDetailsModel(
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

  /// Payment List Data
  List<PaymentListModel> mainPaymentList = [];
  void setMainPaymentListFunction() {
    TextEditingController amountFieldController = TextEditingController();
    TextEditingController referenceFieldController = TextEditingController();
    DateTime paymentDate = DateTime.now();

    mainPaymentList.add(
      PaymentListModel(
        amountFieldController: amountFieldController,
        paymentDate: paymentDate,
        paymentTypeDataValue: paymentTypeList[0],
        paymentMethodDataValue: paymentMethodList[0],
        categoryTypeDataValue: categoryTypeList[0],
        referenceFieldController: referenceFieldController,
      ),
    );
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
        paymentTypeList.add(PaymentTypeData(paymentTypes: "Select Payment Type"));
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
    await getAllActivePaymentMethodFunction();
  }

  /// Get All Active Payment Method Function
  Future<void> getAllActivePaymentMethodFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getAllActivePaymentMethodApi}?customerId=${AppMessage.customerId}";
    log('Get All Active Payment Method Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      // log('Get All Active Property Response :${response.data}');

      ActivePaymentMethodListModel activePaymentMethodListModel =
      ActivePaymentMethodListModel.fromJson(response.data);
      isSuccessStatusCode.value = activePaymentMethodListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        paymentMethodList.clear();
        paymentMethodList.add(PaymentMethodData(paymentMethods: "Select Payment Method"));
        paymentMethodDataValue = paymentMethodList[0];
        paymentMethodList.addAll(activePaymentMethodListModel.data);
      } else {
        log('getAllActivePaymentMethodFunction Else');
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
          Fluttertoast.showToast(msg: "Record Already Exist");
          log("Record Already Exist");
          isLoading(false);
        } else if(statusCode == 401) {
          log('Please login again!');
        }
      }
      log('Error :$e');
    }

    if(billOption == BillOption.create) {
      // initializeMainItemListFunction();
      isLoading(false);
    } else if(billOption == BillOption.update) {
      await billDetailsGetByIdFunction();
    }
  }

  /// Get Bill Details Get By Id Function
  Future<void> billDetailsGetByIdFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getAllBillByIdApi}?billId=$billId";
    log('Bill Details Get By Id Api Url : $url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );
      log('Bill Details Get By Id response : ${jsonEncode(response.data)}');
      BillDetailsModel billDetailsModel = BillDetailsModel.fromJson(response.data);
      isSuccessStatusCode.value = billDetailsModel.statusCode;

      if(isSuccessStatusCode.value == 200) {
        date = billDetailsModel.data.billDate;
        showDate.value = DateFormatChanger().dateFormat(date);
        dueDate = billDetailsModel.data.dueDate;
        showDueDate.value = DateFormatChanger().dateFormat(dueDate);

        referenceFieldController.text = billDetailsModel.data.reference;
        balanceFieldController.text = billDetailsModel.data.totalAmount.toString();
        totalFieldController.text = billDetailsModel.data.totalAmount.toString();

        for(var element in propertyList) {
          if(element.propertyId.toString() == billDetailsModel.data.propertyId) {
            propertyDataValue = element;
          }
        }

        /// Set Bill Item List
        if(billDetailsModel.data.billItem.isNotEmpty) {
          for(var element in billDetailsModel.data.billItem.reversed) {
            TextEditingController qtyFieldController = TextEditingController(text: element.qty.toString());
            TextEditingController descriptionFieldController = TextEditingController(text: element.itemDescription.toString());
            TextEditingController unitFieldController = TextEditingController(text: element.unit.toString());
            TextEditingController priceFieldController = TextEditingController(text: element.price.toString());
            TextEditingController itemTotalFieldController = TextEditingController(text: element.itemTotal.toString());
            bool isActive = element.isActive;
            CategoryTypeData categoryTypeData = CategoryTypeData();

            var contain = categoryTypeList.where((element1) => element1.accountCategoryId == element.accountCategoryId);
            categoryTypeData = contain.first;
            log('contain ${contain.first.category}');
            log('contain ${contain.first.accountCategoryId}');

            mainItemList.add(
              ItemDetailsModel(
                itemId: element.billItemId.toString(),
                  qtyFieldController: qtyFieldController,
                  categoryTypeDataValue: categoryTypeData,
                  descriptionFieldController: descriptionFieldController,
                  unitFieldController: unitFieldController,
                  priceFieldController: priceFieldController,
                  itemTotalFieldController: itemTotalFieldController,
                  isActive: isActive),
            );
          }
        } else {
          setMainItemListFunction();
        }

        /// Set Payment Item List
        if(billDetailsModel.data.payments.isNotEmpty) {
          for(var paymentElement in billDetailsModel.data.payments.reversed) {
            TextEditingController amountFieldController = TextEditingController(text: paymentElement.amount);
            DateTime paymentDate = paymentElement.paymentDate;
            PaymentTypeData paymentTypeDataValue = PaymentTypeData();
            PaymentMethodData paymentMethodDataValue = PaymentMethodData();
            CategoryTypeData categoryTypeDataValue = CategoryTypeData();
            TextEditingController referenceFieldController = TextEditingController(text: paymentElement.reference);

            var paymentTypeContain = paymentTypeList.where((element1) => element1.paymentTypeId == paymentElement.paymentTypeId);
            paymentTypeDataValue = paymentTypeContain.first;

            var paymentMethodContain = paymentMethodList.where((element1) => element1.paymentMethodsId == paymentElement.paymentMethodId);
            paymentMethodDataValue = paymentMethodContain.first;

            var categoryTypeContain = categoryTypeList.where((element1) => element1.accountCategoryId == paymentElement.accountCategoryId);
            categoryTypeDataValue = categoryTypeContain.first;

            mainPaymentList.add(
              PaymentListModel(
                paymentId: paymentElement.paymentId.toString(),
                amountFieldController: amountFieldController,
                paymentDate: paymentDate,
                paymentTypeDataValue: paymentTypeDataValue,
                paymentMethodDataValue: paymentMethodDataValue,
                categoryTypeDataValue: categoryTypeDataValue,
                referenceFieldController: referenceFieldController,
              ),
            );


          }
        } else {
          setMainPaymentListFunction();
        }



      } else {
        log('billDetailsGetByIdFunction Else');
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
  Future<void> selectDate({required BuildContext context, required DateTime initialDate, required SelectedDateType selectedDateType}) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      if(selectedDateType == SelectedDateType.date) {
        date = picked;
        showDate.value = DateFormatChanger().dateFormat(date);
      } else if(selectedDateType == SelectedDateType.dueDate) {
        dueDate = picked;
        showDueDate.value = DateFormatChanger().dateFormat(dueDate);
      }

    }
  }

  Future<void> addBillFunction() async {
    // isLoading(true);
    // String url = billOption == BillOption.create ? ApiUrl.addBillApi : ApiUrl.updateBillApi;
    String url = ApiUrl.addBillApi;
    log('Add Bill Api Url :$url');

    try {
      List<Map<String, dynamic>> billItemList = [];
      for(int i =0; i < mainItemList.length; i++) {
        Map<String, dynamic> singleItemData = {
          "Qty": mainItemList[i].qtyFieldController.text.trim(),
          "AccountCategoryId": mainItemList[i].categoryTypeDataValue.accountCategoryId.toString(),
          "ItemDescription": mainItemList[i].descriptionFieldController.text.trim(),
          "Unit": mainItemList[i].unitFieldController.text.trim(),
          "Price": mainItemList[i].priceFieldController.text.trim(),
          "ItemTotal": mainItemList[i].itemTotalFieldController.text.trim(),
          "IsActive": mainItemList[i].isActive
        };
        billItemList.add(singleItemData);
      }

      List<Map<String, dynamic>> paymentList = [];
      for(var element in mainPaymentList) {
        Map<String, dynamic> singleItemData = {
          "Amount": element.amountFieldController.text.trim(),
          "PaymentDate": DateFormatChangerYMD().dateFormat(element.paymentDate),
          "PaymentTypeID": element.paymentTypeDataValue.paymentTypeId,
          "PaymentMethodID": element.paymentMethodDataValue.paymentMethodsId,
          "AccountCategoryId": element.categoryTypeDataValue.accountCategoryId,
          "Reference": element.referenceFieldController.text.trim(),
        };
        paymentList.add(singleItemData);
      }
      // log('billItemList : $billItemList');
      // log('paymentList : $paymentList');

      Map<String, dynamic> mainBodyData = {
        "CompanyID": companyId,
        "Reference": referenceFieldController.text.trim(),
        "BillDate": DateFormatChangerYMD().dateFormat(date),
        "DueDate": DateFormatChangerYMD().dateFormat(dueDate),
        "Address": addressFieldController.text.trim(),
        "TotalAmount": totalFieldController.text.trim(),
        "Paid": isPaidValue.value,
        "IsActive": true,
        "type" : "Company",
        "billItem": billItemList,
        "payments": paymentList
      };

      log('mainBodyData :${jsonEncode(mainBodyData)}');

      final response = await dioRequest.post(
        url,
        data: mainBodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;

      if(isSuccessStatusCode.value == 201) {
        Get.back();
        CommonToastModule(
          msg: successModel.message,
          backgroundColor: AppColors.greenColor,
        );
      } else {
        log('Add Bill Function Else');
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

  Future<void> updateBillFunction() async {
    // isLoading(true);
    // String url = billOption == BillOption.create ? ApiUrl.addBillApi : ApiUrl.updateBillApi;
    String url = ApiUrl.updateBillApi;
    log('Add Bill Api Url :$url');

    try {
      List<Map<String, dynamic>> billItemList = [];
      for(int i =0; i < mainItemList.length; i++) {
        Map<String, dynamic> singleItemData = {
          "BillItemID": mainItemList[i].itemId ?? "",
          "Qty": mainItemList[i].qtyFieldController.text.trim(),
          "AccountCategoryId": mainItemList[i].categoryTypeDataValue.accountCategoryId.toString(),
          "ItemDescription": mainItemList[i].descriptionFieldController.text.trim(),
          "Unit": mainItemList[i].unitFieldController.text.trim(),
          "Price": mainItemList[i].priceFieldController.text.trim(),
          "ItemTotal": mainItemList[i].itemTotalFieldController.text.trim(),
          "IsActive": mainItemList[i].isActive
        };
        billItemList.add(singleItemData);
      }

      List<Map<String, dynamic>> paymentList = [];
      for(var element in mainPaymentList) {
        Map<String, dynamic> singleItemData = {
          "PaymentID": element.paymentId ?? "",
          "Amount": element.amountFieldController.text.trim(),
          "PaymentDate": DateFormatChangerYMD().dateFormat(element.paymentDate),
          "PaymentTypeID": element.paymentTypeDataValue.paymentTypeId,
          "PaymentMethodID": element.paymentMethodDataValue.paymentMethodsId,
          "AccountCategoryId": element.categoryTypeDataValue.accountCategoryId,
          "Reference": element.referenceFieldController.text.trim(),
        };
        paymentList.add(singleItemData);
      }
      // log('billItemList : $billItemList');
      // log('paymentList : $paymentList');

      Map<String, dynamic> mainBodyData = {
        "BillID": billId,
        "CompanyID": companyId,
        "Reference": referenceFieldController.text.trim(),
        "BillDate": DateFormatChangerYMD().dateFormat(date),
        "DueDate": DateFormatChangerYMD().dateFormat(dueDate),
        "Address": addressFieldController.text.trim(),
        "TotalAmount": totalFieldController.text.trim(),
        "Paid": isPaidValue.value,
        "IsActive": true,
        "type" : "Company",
        "billItem": billItemList,
        "payments": paymentList
      };

      log('mainBodyData :${jsonEncode(mainBodyData)}');

      final response = await dioRequest.put(
        url,
        data: mainBodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}),
      );

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;

      if(isSuccessStatusCode.value == 200) {
        Get.back();
        CommonToastModule(
          msg: successModel.message,
          backgroundColor: AppColors.greenColor,
        );
      } else {
        log('Add Bill Function Else');
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
    log('billId :$billId');
    bool isCreate = billOption == BillOption.create ? true : false;
    appBarHeader.value =
    isCreate == true ? AppMessage.addBill : AppMessage.billDetails;

    showDate.value = DateFormatChanger().dateFormat(date);
    showDueDate.value = DateFormatChanger().dateFormat(dueDate);

    await getAllActiveCompanyFunction();

    if(BillOption.create == billOption) {
      setMainItemListFunction();
      setMainPaymentListFunction();
    }

    formKeyList = [itemFormKey, paymentFormKey];

    // showSelectedDate.value = DateFormatChanger().dateFormat(selectedDate);

    // await getAllActiveCategoryFunction();
  }



}