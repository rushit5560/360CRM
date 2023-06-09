// To parse this JSON data, do
//
//     final activityListModel = activityListModelFromJson(jsonString);

import 'dart:convert';

ActivityListModel activityListModelFromJson(String str) =>
    ActivityListModel.fromJson(json.decode(str));

String activityListModelToJson(ActivityListModel data) =>
    json.encode(data.toJson());

class ActivityListModel {
  int statusCode;
  Data data;

  ActivityListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActivityListModel.fromJson(Map<String, dynamic> json) =>
      ActivityListModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data.toJson(),
      };
}

class Data {
  int pageNumber;
  int pageSize;

  // dynamic firstPage;
  // dynamic lastPage;
  int totalPages;
  int totalRecords;

  // dynamic nextPage;
  // dynamic previousPage;
  List<ActivityListData> data;
  bool succeeded;

  // dynamic errors;
  // dynamic message;

  Data({
    required this.pageNumber,
    required this.pageSize,
    // this.firstPage,
    // this.lastPage,
    required this.totalPages,
    required this.totalRecords,
    // this.nextPage,
    // this.previousPage,
    required this.data,
    required this.succeeded,
    // this.errors,
    // this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        // firstPage: json["firstPage"],
        // lastPage: json["lastPage"],
        totalPages: json["totalPages"] ?? 0,
        totalRecords: json["totalRecords"] ?? 0,
        // nextPage: json["nextPage"],
        // previousPage: json["previousPage"],
        data: List<ActivityListData>.from(
            (json["data"] ?? []).map((x) => ActivityListData.fromJson(x))),
        succeeded: json["succeeded"] ?? false,
        // errors: json["errors"],
        // message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        // "firstPage": firstPage,
        // "lastPage": lastPage,
        "totalPages": totalPages,
        "totalRecords": totalRecords,
        // "nextPage": nextPage,
        // "previousPage": previousPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "succeeded": succeeded,
        // "errors": errors,
        // "message": message,
      };
}

class ActivityListData {
  int activityId;
  int activityTypeId;
  Activity activityType;
  int? priorityId;

  // dynamic priority;
  int activityStatusId;
  Activity activityStatus;

  // dynamic contactId;
  // dynamic contact;
  int customerId;

  // dynamic customer;
  String title;
  DateTime startDate;
  DateTime dueDate;
  DateTime completedDate;
  String notes;
  bool? reminder;
  DateTime? reminderDate;
  String? reminderTime;
  String? reminderNote;

  // dynamic holding;
  // dynamic interval;
  String depActivityId;

  // dynamic mortgageId;
  // dynamic mortgage;
  // dynamic type;
  // dynamic id;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String? createdBy;
  DateTime? createdOn;

  // dynamic modifiedBy;
  DateTime? modifiedOn;
  bool isActive;
  bool isDeleted;

  // dynamic createdUser;
  // dynamic modifiedUser;

  ActivityListData({
    required this.activityId,
    required this.activityTypeId,
    required this.activityType,
    this.priorityId,
    // this.priority,
    required this.activityStatusId,
    required this.activityStatus,
    // this.contactId,
    // this.contact,
    required this.customerId,
    // this.customer,
    required this.title,
    required this.startDate,
    required this.dueDate,
    required this.completedDate,
    required this.notes,
    this.reminder,
    this.reminderDate,
    required this.reminderTime,
    required this.reminderNote,
    // this.holding,
    // this.interval,
    required this.depActivityId,
    // this.mortgageId,
    // this.mortgage,
    // this.type,
    // this.id,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    this.createdBy,
    this.createdOn,
    // this.modifiedBy,
    this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory ActivityListData.fromJson(Map<String, dynamic> json) =>
      ActivityListData(
        activityId: json["activityID"] ?? 0,
        activityTypeId: json["activityTypeId"] ?? 0,
        activityType: Activity.fromJson(json["activityType"] ?? {}),
        priorityId: json["priorityId"] ?? 0,
        // priority: json["priority"],
        activityStatusId: json["activityStatusId"] ?? 0,
        activityStatus: Activity.fromJson(json["activityStatus"] ?? {}),
        // contactId: json["contactID"],
        // contact: json["contact"],
        customerId: json["customerId"] ?? 0,
        // customer: json["customer"],
        title: json["title"] ?? '',
        startDate: DateTime.parse(json["startDate"] ?? DateTime.now().toString()),
        dueDate: DateTime.parse(json["dueDate"] ?? DateTime.now().toString()),
        completedDate: DateTime.parse(json["completedDate"] ?? DateTime.now().toString()),
        notes: json["notes"] ?? '',
        reminder: json["reminder"] ?? false,
        reminderDate: DateTime.parse(json["reminderDate"] ?? DateTime.now().toString()),
        reminderTime: json["reminderTime"] ?? '',
        reminderNote:json["reminderNote"] ?? '',
        // holding: json["holding"],
        // interval: json["interval"],
        depActivityId: json["depActivityID"] ?? '',
        // mortgageId: json["mortgageId"],
        // mortgage: json["mortgage"],
        // type: json["type"],
        // id: json["id"],
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        totalRecords: json["totalRecords"] ?? 0,
        createdBy: json["createdBy"] ?? '',
        createdOn:
            DateTime.parse(json["createdOn"] ?? DateTime.now().toString()),
        // modifiedBy: json["modifiedBy"],
        modifiedOn:
            DateTime.parse(json["modifiedOn"] ?? DateTime.now().toString()),
        isActive: json["isActive"] ?? false,
        isDeleted: json["isDeleted"] ?? false,
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
      );

  Map<String, dynamic> toJson() => {
        "activityID": activityId,
        "activityTypeId": activityTypeId,
        "activityType": activityType.toJson(),
        "priorityId": priorityId,
        // "priority": priority,
        "activityStatusId": activityStatusId,
        "activityStatus": activityStatus.toJson(),
        // "contactID": contactId,
        // "contact": contact,
        "customerId": customerId,
        // "customer": customer,
        "title": title,
        "startDate": startDate,
        "dueDate": dueDate,
        "completedDate": completedDate,
        "notes": notes,
        "reminder": reminder,
        "reminderDate": reminderDate,
        "reminderTime": reminderTime,
        "reminderNote": reminderNote,
        // "holding": holding,
        // "interval": interval,
        "depActivityID": depActivityId,
        // "mortgageId": mortgageId,
        // "mortgage": mortgage,
        // "type": type,
        // "id": id,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalRecords": totalRecords,
        "createdBy": createdBy,
        "createdOn": createdOn,
        // "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn,
        "isActive": isActive,
        "isDeleted": isDeleted,
        // "createdUser": createdUser,
        // "modifiedUser": modifiedUser,
      };
}

class Activity {
  int? activityStatusId;
  String? status;
  int customerId;

  // dynamic customer;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  DateTime createdOn;

  // dynamic modifiedBy;
  DateTime? modifiedOn;
  bool isActive;
  bool isDeleted;

  // dynamic createdUser;
  // dynamic modifiedUser;
  int? activityTypeId;
  String? type;

  Activity({
    this.activityStatusId,
    this.status,
    required this.customerId,
    // this.customer,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
    this.activityTypeId,
    this.type,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        activityStatusId: json["activityStatusId"] ?? 0,
        status: json["status"] ?? '',
        customerId: json["customerId"] ?? 0,
        // customer: json["customer"],
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        totalRecords: json["totalRecords"] ?? 0,
        createdBy: json["createdBy"] ?? '',
        createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now().toString()),
        // modifiedBy: json["modifiedBy"],
        modifiedOn:
            DateTime.parse(json["modifiedOn"] ?? DateTime.now().toString()),
        isActive: json["isActive"] ?? false,
        isDeleted: json["isDeleted"] ?? false,
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
        activityTypeId: json["activityTypeId"]??0,
        type: json["type"]??'',
      );

  Map<String, dynamic> toJson() => {
        "activityStatusId": activityStatusId,
        "status": status,
        "customerId": customerId,
        // "customer": customer,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalRecords": totalRecords,
        "createdBy": createdBy,
        "createdOn": createdOn.toIso8601String(),
        // "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn?.toIso8601String(),
        "isActive": isActive,
        "isDeleted": isDeleted,
        // "createdUser": createdUser,
        // "modifiedUser": modifiedUser,
        "activityTypeId": activityTypeId,
        "type": type,
      };
}
