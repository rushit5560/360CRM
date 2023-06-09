import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/models/activity_manage_screen_models/get_activity_details_model.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../models/activity_manage_screen_models/activity_status_list_model.dart';
import '../../models/activity_manage_screen_models/activity_type_list_model.dart';
import '../../models/activity_manage_screen_models/priority_list_model.dart';
import '../../utils/common_functions.dart';
import '../../utils/messaging.dart';

class ActivityManageScreenController extends GetxController {
  ActivityOption activityOption = Get.arguments[0];
  String activityId = Get.arguments[1];
  String activityName = Get.arguments[2];

  RxInt isSuccessStatusCode = 0.obs;

  final dioRequest = dio.Dio();

  GlobalKey<FormState> activityManageKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  final titleTextFieldController = TextEditingController();

  //Activity Type
  List<ActivityTypeListData> activityTypeListDropDown = [];
  ActivityTypeListData activityTypeListValue = ActivityTypeListData();

  // Priority
  List<PriorityListData> priorityListDropDown = [];
  PriorityListData priorityListValue = PriorityListData();

  // Activity Status
  List<ActivityStatusListData> activityStatusListDropDown = [];
  ActivityStatusListData activityStatusListValue = ActivityStatusListData();

  ActivityManageDate selectedDateType = ActivityManageDate.startDate;

//Start Date
  DateTime selectedStartDate = DateTime.now();
  final showSelectedStartDate = TextEditingController();
  final startDateTextEditingController = TextEditingController();

  //Due Date
  DateTime selectedDueDate = DateTime.now();
  final showSelectedDueDate = TextEditingController();

  //Completed Date
  DateTime selectedCompletedDate = DateTime.now();
  RxString showSelectedCompletedDate = "".obs;

  RxBool reminderStatus = true.obs;

//Reminder Date
  DateTime selectedReminderDate = DateTime.now();
  RxString showSelectedReminderDate = "".obs;

//Reminder Time
  TimeOfDay? selectedReminderTime;
  RxString showSelectedReminderTime = ''.obs;
  final reminderNoteTextFieldController = TextEditingController();
  final notesTextFieldController = TextEditingController();

//update Time Need
  // Select Date Module
  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (picked != null /*&& picked != selectedDate*/) {
      if (ActivityManageDate.startDate == selectedDateType) {
        selectedStartDate = picked;
        showSelectedStartDate.text =
            DateFormatChanger().dateFormat(selectedStartDate);
        log('Selected Date: $selectedStartDate');
        log('Date Type : ${selectedDateType.name}');
      } else if (ActivityManageDate.dueDate == selectedDateType) {
        selectedDueDate = picked;
        showSelectedDueDate.text =
            DateFormatChanger().dateFormat(selectedDueDate);
        log('Project Start Date: $selectedDueDate');
        log('Date Type : ${selectedDateType.name}');
      } else if (ActivityManageDate.completeDate == selectedDateType) {
        selectedCompletedDate = picked;
        showSelectedCompletedDate.value =
            DateFormatChanger().dateFormat(selectedCompletedDate);
        log('Project Start Date: $selectedCompletedDate');
        log('Date Type : ${selectedDateType.name}');
      } else if (ActivityManageDate.reminderDate == selectedDateType) {
        selectedReminderDate = picked;
        showSelectedReminderDate.value =
            DateFormatChanger().dateFormat(selectedReminderDate);
        log('Project Start Date: $selectedReminderDate');
        log('Date Type : ${selectedDateType.name}');
      } else {
        log('Something Went Wrong');
      }
      loadUI();
    }
  }

  //Reminder Time Pick
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

      // use24HourFormat: true, // Set this to true for 24-hour format
    );

    if (selectedTime != null) {
      // Handle the selected time
      final int hour = selectedTime.hour;
      final int minute = selectedTime.minute;
      selectedReminderTime = selectedTime;
      showSelectedReminderTime.value = "$hour:$minute";
      log('Selected Time: $hour:$minute');
      log('Selected Time: $selectedReminderTime');
    }
  }

//Get Activity Type List
  Future<void> getActivityTypeListFunction() async {
    final url =
        "${ApiUrl.activityTypeListApi}?CustomerId=${AppMessage.customerId}";
    log("get Activity Type List URL : $url");
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      // log("get Activity type List response : $response");
      ActivityTypeListModel activityTypeListModel =
          ActivityTypeListModel.fromJson(response.data);
      isSuccessStatusCode.value = activityTypeListModel.statusCode;
      if (isSuccessStatusCode.value == 200) {
        activityTypeListDropDown.clear();
        activityTypeListDropDown
            .add(ActivityTypeListData(type: AppMessage.selectActivityType));
        activityTypeListValue = activityTypeListDropDown[0];
        activityTypeListDropDown.addAll(activityTypeListModel.data);
        log("get activity type List status Code : ${activityTypeListModel.statusCode}");
      } else {
        log("else get activity type List status Code : ${activityTypeListModel.statusCode}");
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
    await getPriorityListFunction();
  }

//Get Priority List
  Future<void> getPriorityListFunction() async {
    final url =
        "${ApiUrl.activityPriorityListApi}?CustomerId=${AppMessage.customerId}";
    log("get Priority List URL: $url");

    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      // log("get priority list response: $response");
      ActivityPriorityListModel activityPriorityListModel =
          ActivityPriorityListModel.fromJson(response.data);
      isSuccessStatusCode.value = activityPriorityListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        priorityListDropDown.clear();
        priorityListDropDown
            .add(PriorityListData(prioritys: AppMessage.selectPriority));
        priorityListValue = priorityListDropDown[0];
        priorityListDropDown.addAll(activityPriorityListModel.data);
        log("get activity type List status Code : ${activityPriorityListModel.statusCode}");
      } else {
        log("else get activity type List status Code : ${activityPriorityListModel.statusCode}");
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

    await getActivityStatusListFunction();
  }

//Get Activity Status List
  Future<void> getActivityStatusListFunction() async {
    final url =
        "${ApiUrl.activityStatusListApi}?CustomerId=${AppMessage.customerId}";
    log("gte Activity status List URL: $url");
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      // log("get activity Status list response: $response");

      ActivityStatusListModel activityStatusListModel =
          ActivityStatusListModel.fromJson(response.data);
      isSuccessStatusCode.value = activityStatusListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        activityStatusListDropDown.clear();
        activityStatusListDropDown.add(
            ActivityStatusListData(status: AppMessage.selectActivityStatus));
        activityStatusListValue = activityStatusListDropDown[0];
        activityStatusListDropDown.addAll(activityStatusListModel.data);
        log("get activity type List status Code : ${activityStatusListModel.statusCode}");
      } else {
        log("else get activity type List status Code : ${activityStatusListModel.statusCode}");
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

    if (ActivityOption.update == activityOption) {
      await getActivityDetailsFunction();
    }
    isLoading(false);
  }

//get Activity Details
  Future<void> getActivityDetailsFunction() async {
    final url = "${ApiUrl.getActivityDetailsApi}?activityId=$activityId";
    log("get activity details URL: $url");
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      // log("get activity Details response: $response");

      GetActivityDetailsListModel activityDetailsListModel =
          GetActivityDetailsListModel.fromJson(response.data);
      isSuccessStatusCode.value = activityDetailsListModel.statusCode;

      if (isSuccessStatusCode.value == 200) {
        titleTextFieldController.text = activityDetailsListModel.data.title;
        showSelectedStartDate.text = DateFormatChanger()
            .dateFormat(activityDetailsListModel.data.startDate);
//Activity Type
        for (int i = 0; i < activityTypeListDropDown.length; i++) {
          log("Activity Type");
          if (activityTypeListDropDown[i].activityTypeId ==
              activityDetailsListModel.data.activityTypeId) {
            activityTypeListValue = activityTypeListDropDown[i];
            log('Activity Type Name >>>> ${activityTypeListValue.type}');
          }
        }
//Priority
        for (int i = 0; i < priorityListDropDown.length; i++) {
          log("Priority");
          if (priorityListDropDown[i].priorityId ==
              activityDetailsListModel.data.priorityId) {
            priorityListValue = priorityListDropDown[i];
            log('priority ${priorityListValue.prioritys}');
          }
        }
//Activity Status
        for (int i = 0; i < activityStatusListDropDown.length; i++) {
          log("Activity Status");
          if (activityStatusListDropDown[i].activityStatusId ==
              activityDetailsListModel.data.activityStatusId) {
            activityStatusListValue = activityStatusListDropDown[i];
            log('Activity Status  ${activityStatusListValue.status}');
          }
        }

        showSelectedDueDate.text = DateFormatChanger()
            .dateFormat(activityDetailsListModel.data.dueDate);
        log(">>>>>>>>>>>>>>>>> ${showSelectedDueDate.text}");
        showSelectedCompletedDate.value = DateFormatChanger()
            .dateFormat(activityDetailsListModel.data.completedDate);
        reminderStatus.value = activityDetailsListModel.data.reminder;
        showSelectedReminderDate.value = DateFormatChanger()
            .dateFormat(activityDetailsListModel.data.reminderDate);
        showSelectedReminderTime.value =
            activityDetailsListModel.data.reminderTime;
        reminderNoteTextFieldController.text =
            activityDetailsListModel.data.reminderNote;
        notesTextFieldController.text = activityDetailsListModel.data.notes;

        log("get activity Details Code : ${activityDetailsListModel.statusCode}");
      } else {
        log("else get activity Details Code : ${activityDetailsListModel.statusCode}");
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

  //update Activity
  Future<void> updateActivityFunction() async {
    final url = ApiUrl.updateActivityApi;
    log("Update Activity URL: $url");
    try {
      Map<String, dynamic> updateData = {
        "ActivityTypeId": activityTypeListValue.activityTypeId,
        "ActivityStatusId": activityStatusListValue.activityStatusId,
        "CustomerId": AppMessage.customerId,
        "Title": titleTextFieldController.text,
        "StartDate": DateFormatChangerYMD().dateFormat(selectedStartDate), //"2022-06-18",
        "DueDate": DateFormatChangerYMD().dateFormat(selectedDueDate), //"2022-06-18",
        "CompletedDate": DateFormatChangerYMD().dateFormat(selectedCompletedDate), //"2022-06-18",
        "Notes": notesTextFieldController.text,
        "Reminder": reminderStatus.value,
        "ReminderDate": DateFormatChangerYMD().dateFormat(selectedReminderDate), //"2022-06-18",
        "ReminderTime": showSelectedReminderTime.value,
        "ReminderNote": reminderNoteTextFieldController.text,
        "Holding": true,
        "Interval": "",
        "DepActivityID": "",
        "IsActive": true,
        "ActivityID": activityId
      };

      final response = await dioRequest.put(url,
          data: updateData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log("$response");
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
  }

  //add Activity
  Future<void> addActivityFunction() async {
    final url = ApiUrl.addActivityApi;
    log("Update Activity URL: $url");
    try {
      Map<String,dynamic>addData={
          "ActivityTypeId": activityTypeListValue.activityTypeId,
          "ActivityStatusId": activityStatusListValue.activityStatusId,
          "CustomerId" : AppMessage.customerId,
          "Title" : titleTextFieldController.text,
          "StartDate" : DateFormatChangerYMD().dateFormat(selectedStartDate),//"2023-05-18",
          "DueDate" : DateFormatChangerYMD().dateFormat(selectedDueDate),//"2023-06-18",
          "CompletedDate": DateFormatChangerYMD().dateFormat(selectedCompletedDate),//"2023-06-18",
          "Notes" : notesTextFieldController.text,
          "Reminder" : reminderStatus.value,
          "ReminderDate" : DateFormatChangerYMD().dateFormat(selectedReminderDate),//"2023-06-18",
          "ReminderTime" : showSelectedReminderTime.value,//"15:00",
          "ReminderNote" : reminderNoteTextFieldController.text,
          // "Holding" : true,
          // "Interval" : 1,
          "IsActive" : true,
          // "Id" : 27,
          "Type" : "PropertyManagement"
      };

      final response = await dioRequest.put(url,
          data: addData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log("$response");
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
  }

  @override
  void onInit() {
    log("activityOption : $activityOption");
    log("activityId : $activityId");
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    isLoading(true);
    showSelectedStartDate.text =
        DateFormatChanger().dateFormat(selectedStartDate);
    showSelectedDueDate.text = DateFormatChanger().dateFormat(selectedDueDate);
    await getActivityTypeListFunction();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
