import 'dart:developer';
import 'package:crm_project/models/success_model/success_model.dart';
import 'package:crm_project/models/work_order_screen_models/details_work_order_screen_models/work_order_company_list_model.dart';
import 'package:crm_project/models/work_order_screen_models/details_work_order_screen_models/work_order_details_model.dart';
import 'package:crm_project/models/work_order_screen_models/details_work_order_screen_models/work_order_property_list_model.dart';
import 'package:crm_project/models/work_order_screen_models/details_work_order_screen_models/work_order_status_list_model.dart';
import 'package:crm_project/models/work_order_screen_models/details_work_order_screen_models/work_order_type_list_model.dart';
import 'package:crm_project/models/work_order_screen_models/work_order_list_model.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../common_modules/common_toast_module.dart';
import '../../../constants/api_url.dart';
import '../../../constants/colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/messaging.dart';

class DetailWorkOrderScreenController extends GetxController {
  String workOrderID = Get.arguments[0];
  RxBool isLoading = false.obs;
  WorkOrderDetailsDate selectedDateType = WorkOrderDetailsDate.date;
  GlobalKey<FormState> detailWorkOrderKey = GlobalKey<FormState>();
  final dioRequest = dio.Dio();
  RxInt isSuccessStatusCode = 0.obs;

  //type
  List<WorkOrderTypeData> workOrderTypeListDropDown = [];
  WorkOrderTypeData workOrderTypeListValue = WorkOrderTypeData();

  // status
  List<WorkOrderStatusData> workOrderStatusListDropDown = [];
  WorkOrderStatusData workOrderStatusListValue = WorkOrderStatusData();

  // property
  List<WorkOrderPropertyData> workOrderPropertyListDropDown = [];
  WorkOrderPropertyData workOrderPropertyListValue = WorkOrderPropertyData();

  // Work List DropDown Value
  List<WorkOrderCompanyData> workOrderCompanyListDropDown = [];
  WorkOrderCompanyData workOrderCompanyListValue = WorkOrderCompanyData();

  //Details TextEditingController
  final detailsTextFieldController = TextEditingController();

  //unit TextEditingController
  final unitTextFieldController = TextEditingController();

  //budget TextEditingController
  final budgetTextFieldController = TextEditingController();

  //perDiemBonus TextEditingController
  final perDiemBonusTextFieldController = TextEditingController();

  // percentageOfBudget TextEditingController
  final percentageOfBudgetTextFieldController = TextEditingController();

  //perDiemPenalty TextEditingController
  final perDiemPenaltyTextFieldController = TextEditingController();

  //actualCost TextEditingController
  final actualCostTextFieldController = TextEditingController();

  //projectedCost TextEditingController
  final projectedCostTextFieldController = TextEditingController();

//costOverRuns TextEditingController
  final costOverRunsTextFieldController = TextEditingController();

//specialTerms TextEditingController
  final specialTermsTextFieldController = TextEditingController();

  //Date
  DateTime selectedDate = DateTime.now();
  RxString showSelectedDate = "".obs;

  //project Date
  DateTime selectedProjectStartDate = DateTime.now();
  RxString showSelectedProjectStartDate = "".obs;

  //Due Date
  DateTime selectedDueDate = DateTime.now();
  RxString showSelectedDueDate = "".obs;

  //complete Date
  DateTime selectedCompleteDate = DateTime.now();
  RxString showSelectedCompleteDate = "".obs;

  RxBool workOrderIsActive = true.obs;

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
      } else if (WorkOrderDetailsDate.projectStartDate == selectedDateType) {
        selectedProjectStartDate = picked;
        showSelectedProjectStartDate.value =
            DateFormatChanger().dateFormat(selectedProjectStartDate);
        log('Project Start Date: $selectedProjectStartDate');
        log('Date Type : ${selectedDateType.name}');
      } else if (WorkOrderDetailsDate.dueDate == selectedDateType) {
        selectedDueDate = picked;
        showSelectedDueDate.value =
            DateFormatChanger().dateFormat(selectedDueDate);
        log('Due Date: $selectedDueDate');
        log('Date Type : ${selectedDateType.name}');
      } else if (WorkOrderDetailsDate.completeDate == selectedDateType) {
        selectedCompleteDate = picked;
        showSelectedCompleteDate.value =
            DateFormatChanger().dateFormat(selectedCompleteDate);
        log('completed Date: $selectedCompleteDate');
        log('Date Type : ${selectedDateType.name}');
      } else {
        log('Something Went Wrong');
      }
    }
  }

//get All Details
  Future<void> getAllDetailsFunction() async {
    final url = "${ApiUrl.workOrderDetailsApi}?workOrderId=$workOrderID";
    log('Work Order Details URL: $url');
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      // log("Work order details response : $response");
      WorkOrderDetailsModel workOrderDetailsModel =
          WorkOrderDetailsModel.fromJson(response.data);
      isSuccessStatusCode.value = workOrderDetailsModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
//type
        for (int i = 0; i < workOrderTypeListDropDown.length; i++) {
          if (workOrderTypeListDropDown[i].workOrderTypeId ==
              workOrderDetailsModel.data.workOrderTypeId) {
            workOrderTypeListValue = workOrderTypeListDropDown[i];
            log('Work Order Type Id >>>> ${workOrderTypeListValue.type}');
          }
        }
        showSelectedDate.value = DateFormatChanger().dateFormat(workOrderDetailsModel.data.workOrderDate);
        selectedDate = workOrderDetailsModel.data.workOrderDate;
        log('Selected Date: $selectedDate');
//status
        for (int i = 0; i < workOrderStatusListDropDown.length; i++) {
          if (workOrderStatusListDropDown[i].workOrderStatusId ==
              workOrderDetailsModel.data.workOrderStatusId) {
            workOrderStatusListValue = workOrderStatusListDropDown[i];
            log('Work Order Status name >>>> ${workOrderStatusListValue.name}');
          }
        }
        showSelectedProjectStartDate.value = DateFormatChanger().dateFormat(workOrderDetailsModel.data.projectStartDate);
        selectedProjectStartDate = workOrderDetailsModel.data.projectStartDate;
        log('Project Start Date: $selectedProjectStartDate');
//property
        for (int i = 0; i < workOrderPropertyListDropDown.length; i++) {
          if (workOrderPropertyListDropDown[i].propertyId ==
              workOrderDetailsModel.data.propertyId) {
            workOrderPropertyListValue = workOrderPropertyListDropDown[i];
            log('Work Order Property Id >>>> ${workOrderPropertyListValue.propertyName}');
          }
        }
        detailsTextFieldController.text =
            workOrderDetailsModel.data.workOrderDetails.toString();
        unitTextFieldController.text =
            workOrderDetailsModel.data.unit.toString();

//company
        for (int i = 0; i < workOrderCompanyListDropDown.length; i++) {
          if (workOrderCompanyListDropDown[i].companyId ==
              workOrderDetailsModel.data.companyId) {
            workOrderCompanyListValue = workOrderCompanyListDropDown[i];
            log('Work Order Company Id >>>> ${workOrderCompanyListValue.companyName}');
          }
        }
        budgetTextFieldController.text =
            workOrderDetailsModel.data.budget.toString();
        perDiemBonusTextFieldController.text =
            workOrderDetailsModel.data.perDiemBonus.toString();
        percentageOfBudgetTextFieldController.text =
            workOrderDetailsModel.data.percentOfBudget.toString();
        showSelectedDueDate.value = DateFormatChanger().dateFormat(workOrderDetailsModel.data.projectDueDate);
        selectedDueDate = workOrderDetailsModel.data.projectDueDate;
        log('Due Date: $selectedDueDate');
        showSelectedCompleteDate.value = DateFormatChanger().dateFormat(workOrderDetailsModel.data.completeDate);
        selectedCompleteDate = workOrderDetailsModel.data.completeDate;
        log('completed Date: $selectedCompleteDate');
        perDiemPenaltyTextFieldController.text =
            workOrderDetailsModel.data.perDiemPenalty.toString();
        actualCostTextFieldController.text =
            workOrderDetailsModel.data.actualCost.toString();
        projectedCostTextFieldController.text =
            workOrderDetailsModel.data.projectedCost.toString();
        costOverRunsTextFieldController.text =
            workOrderDetailsModel.data.costOverRuns.toString();
        specialTermsTextFieldController.text =
            workOrderDetailsModel.data.specialTerms.toString();

        log("Work order details response : ${workOrderDetailsModel.statusCode}");
      } else {
        log("else Work order details response : ${workOrderDetailsModel.statusCode}");
      }
    } catch (e) {
      if (e is dio.DioError && e.response != null) {
        final response = e.response;
        final statusCode = response!.statusCode;
        if (statusCode == 400) {
          // CommonToastModule(msg: "Record Already Exist");
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

//get Type List
  Future<void> getWorkOrderTypeListFunction() async {
    final url =
        '${ApiUrl.workOrderTypeApi}?CustomerId=${AppMessage.customerId}';
    log("get work order type list : $url");
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      // log('get work order type list response : $response');
      WorkOrderTypeListModel workOrderTypeListModel =
          WorkOrderTypeListModel.fromJson(response.data);
      isSuccessStatusCode.value = workOrderTypeListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        workOrderTypeListDropDown.clear();
        workOrderTypeListDropDown
            .add(WorkOrderTypeData(type: AppMessage.selectWorkOrderType));
        workOrderTypeListValue = workOrderTypeListDropDown[0];
        workOrderTypeListDropDown.addAll(workOrderTypeListModel.data);
        log('get work order type list response: ${workOrderTypeListModel.statusCode}');
      } else {
        log('else get work order type list response : ${workOrderTypeListModel.statusCode}');
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
    await getWorkOrderStatusListFunction();
  }

//status list
  Future<void> getWorkOrderStatusListFunction() async {
    final url =
        "${ApiUrl.workOrderStatusApi}?CustomerId=${AppMessage.customerId}";
    log('get status list URL : $url');
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      // log('get status list Response : $response');
      WorkOrderStatusListModel workOrderStatusListModel =
          WorkOrderStatusListModel.fromJson(response.data);
      isSuccessStatusCode.value = workOrderStatusListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        workOrderStatusListDropDown.clear();
        workOrderStatusListDropDown
            .add(WorkOrderStatusData(name: AppMessage.selectWorkOrderStatus));
        workOrderStatusListValue = workOrderStatusListDropDown[0];
        workOrderStatusListDropDown.addAll(workOrderStatusListModel.data);
        log('get status list Response : ${workOrderStatusListModel.statusCode}');
      } else {
        log('else get status list Response : ${workOrderStatusListModel.statusCode}');
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

    await gatPropertyListFunction();
  }

// property list
  Future<void> gatPropertyListFunction() async {
    final url =
        "${ApiUrl.workOrderPropertyApi}?CustomerId=${AppMessage.customerId}";
    log(" Work Order Property URL: $url");

    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      // log(">>> >>> >>> Work Order Property Response : ${response.data}");
      WorkOrderPropertyListModel workOrderPropertyListModel =
          WorkOrderPropertyListModel.fromJson(response.data);
      isSuccessStatusCode.value = workOrderPropertyListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        workOrderPropertyListDropDown.clear();
        workOrderPropertyListDropDown.add(WorkOrderPropertyData(
            propertyName: AppMessage.selectWorkOrderProperty));
        workOrderPropertyListValue = workOrderPropertyListDropDown[0];
        workOrderPropertyListDropDown.addAll(workOrderPropertyListModel.data);

        log("Work Order Property data : ${workOrderPropertyListDropDown.length}");
        log("Work Order Property StatusCode : ${workOrderPropertyListModel.statusCode}");
      } else {
        log("else Work Order Property StatusCode : ${workOrderPropertyListModel.statusCode}");
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
    await gatCompanyListFunction();
  }

//company list
  Future<void> gatCompanyListFunction() async {
    final url =
        "${ApiUrl.workOrderCompanyApi}?CustomerId=${AppMessage.customerId}";
    log(" Work Order Company URL: $url");

    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      // log("Work Order Company Response : ${response.data}");
      WorkOrderCompanyListModel workOrderCompanyListModel =
          WorkOrderCompanyListModel.fromJson(response.data);
      isSuccessStatusCode.value = workOrderCompanyListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        workOrderCompanyListDropDown.clear();
        workOrderCompanyListDropDown.add(WorkOrderCompanyData(
            companyName: AppMessage.selectWorkOrderCompany));
        workOrderCompanyListValue = workOrderCompanyListDropDown[0];
        workOrderCompanyListDropDown.addAll(workOrderCompanyListModel.data);

        log("Work Order company data : ${workOrderCompanyListDropDown.length}");
        log("Work Order Company Status Code : ${workOrderCompanyListModel.statusCode}");
      } else {
        log("else Work Order Company Status Code : ${workOrderCompanyListModel.statusCode}");
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
    await getAllDetailsFunction();
  }

//Update Function
  Future<void> updateWorkOrderFunction() async {
    final url = ApiUrl.workOrderUpdateApi;
    try {
      Map<String,dynamic>updateData={
          "workOrderID": workOrderID,
          "workOrderStatusID": workOrderStatusListValue.workOrderStatusId,
          "actualCost": actualCostTextFieldController.text.toString(),
          "budget": budgetTextFieldController.text.toString(),
          "workOrderDetails": detailsTextFieldController.text.toString(),
          "propertyId": workOrderPropertyListValue.propertyId,
          "companyId": workOrderCompanyListValue.companyId,
          "unit": unitTextFieldController.text.toString(),
          "perDiemBonus": perDiemBonusTextFieldController.text.toString(),
          "perDiemPenalty": perDiemPenaltyTextFieldController.text.toString(),
          "percentOfBudget": percentageOfBudgetTextFieldController.text.toString(),
          "projectedCost": projectedCostTextFieldController.text.toString(),
          "costOverRuns": costOverRunsTextFieldController.text.toString(),
          "specialTerms": specialTermsTextFieldController.text.toString(),
          "workOrderTypeID": workOrderTypeListValue.workOrderTypeId,
          "customerId": AppMessage.customerId,
          "isActive": workOrderIsActive.value,
          "WorkOrderDate": DateFormatChangerYMD().dateFormat(selectedDate),
          "ProjectStartDate":  DateFormatChangerYMD().dateFormat(selectedProjectStartDate),
          "ProjectDueDate": DateFormatChangerYMD().dateFormat(selectedDueDate),
          "CompleteDate": DateFormatChangerYMD().dateFormat(selectedCompleteDate),
          "SpecialTerms": specialTermsTextFieldController.text.toString(),
          "ContractorVerification": false,
          "type": "company"

      };
      final response = await dioRequest.put(url, data: updateData,options: dio.Options(
          headers: {"Authorization": "Bearer ${AppMessage.token}"}
      ));
      log('Update Response : ${response.data}');
      SuccessModel successModel=SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;

      if(isSuccessStatusCode.value ==200){
        Get.back();
        CommonToastModule(
            msg: response.data['message'].toString(),
            backgroundColor: AppColors.greenColor);

      }else{
        CommonToastModule(
            msg: response.data['message'].toString(),
            backgroundColor: AppColors.greenColor);
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
  }

  @override
  void onInit() {
    log('Work Order Id : $workOrderID');
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    isLoading(true);
    await getWorkOrderTypeListFunction();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
