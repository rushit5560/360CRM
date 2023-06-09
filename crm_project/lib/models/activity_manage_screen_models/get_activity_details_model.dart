// To parse this JSON data, do
//
//     final getActivityDetailsListModel = getActivityDetailsListModelFromJson(jsonString);

import 'dart:convert';

GetActivityDetailsListModel getActivityDetailsListModelFromJson(String str) => GetActivityDetailsListModel.fromJson(json.decode(str));

String getActivityDetailsListModelToJson(GetActivityDetailsListModel data) => json.encode(data.toJson());

class GetActivityDetailsListModel {
  int statusCode;
  Data data;

  GetActivityDetailsListModel({
    required this.statusCode,
    required this.data,
  });

  factory GetActivityDetailsListModel.fromJson(Map<String, dynamic> json) => GetActivityDetailsListModel(
    statusCode: json["statusCode"]??0,
    data: Data.fromJson(json["data"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data.toJson(),
  };
}

class Data {
  int activityId;
  int activityTypeId;
  ActivityStatus activityType;
  int priorityId;
  ActivityStatus priority;
  int activityStatusId;
  ActivityStatus activityStatus;
  // dynamic contactId;
  // dynamic contact;
  int customerId;
  // dynamic customer;
  String title;
  DateTime startDate;
  DateTime dueDate;
  DateTime completedDate;
  String notes;
  bool reminder;
  DateTime reminderDate;
  String reminderTime;
  String reminderNote;
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
  String createdBy;
  DateTime createdOn;
  // dynamic modifiedBy;
  DateTime modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  Data({
    required this.activityId,
    required this.activityTypeId,
    required this.activityType,
    required this.priorityId,
    required this.priority,
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
    required this.reminder,
    required this.reminderDate,
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
    required this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    required this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    activityId: json["activityID"]??0,
    activityTypeId: json["activityTypeId"]??0,
    activityType: ActivityStatus.fromJson(json["activityType"]??{}),
    priorityId: json["priorityId"]??0,
    priority: ActivityStatus.fromJson(json["priority"]??{}),
    activityStatusId: json["activityStatusId"]??0,
    activityStatus: ActivityStatus.fromJson(json["activityStatus"]??{}),
    // contactId: json["contactID"],
    // contact: json["contact"],
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    title: json["title"]??'',
    startDate: DateTime.parse(json["startDate"]??DateTime.now().toString()),
    dueDate: DateTime.parse(json["dueDate"]??DateTime.now().toString()),
    completedDate: DateTime.parse(json["completedDate"]??DateTime.now().toString()),
    notes: json["notes"]??'',
    reminder: json["reminder"]??false,
    reminderDate: DateTime.parse(json["reminderDate"]??DateTime.now().toString()),
    reminderTime: json["reminderTime"]??'',
    reminderNote: json["reminderNote"]??'',
    // holding: json["holding"],
    // interval: json["interval"],
    depActivityId: json["depActivityID"]??'',
    // mortgageId: json["mortgageId"],
    // mortgage: json["mortgage"],
    // type: json["type"],
    // id: json["id"],
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"] ??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now().toString()),
    // modifiedBy: json["modifiedBy"],
    modifiedOn: DateTime.parse(json["modifiedOn"]??DateTime.now().toString()),
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "activityID": activityId,
    "activityTypeId": activityTypeId,
    "activityType": activityType.toJson(),
    "priorityId": priorityId,
    "priority": priority.toJson(),
    "activityStatusId": activityStatusId,
    "activityStatus": activityStatus.toJson(),
    // "contactID": contactId,
    // "contact": contact,
    "customerId": customerId,
    // "customer": customer,
    "title": title,
    "startDate": startDate.toIso8601String(),
    "dueDate": dueDate.toIso8601String(),
    "completedDate": completedDate.toIso8601String(),
    "notes": notes,
    "reminder": reminder,
    "reminderDate": reminderDate.toIso8601String(),
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

class ActivityStatus {
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
  int? priorityId;
  String? prioritys;

  ActivityStatus({
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
    this.priorityId,
    this.prioritys,
  });

  factory ActivityStatus.fromJson(Map<String, dynamic> json) => ActivityStatus(
    activityStatusId: json["activityStatusId"]??0,
    status: json["status"]??'',
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now().toString()),
    // modifiedBy: json["modifiedBy"],
    modifiedOn: DateTime.parse(json["modifiedOn"]??DateTime.now().toString()),
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
    activityTypeId: json["activityTypeId"]??0,
    type: json["type"]??'',
    priorityId: json["priorityId"]??0,
    prioritys: json["prioritys"]??'',
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
    "createdOn": createdOn,
    // "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "isActive": isActive,
    "isDeleted": isDeleted,
    // "createdUser": createdUser,
    // "modifiedUser": modifiedUser,
    "activityTypeId": activityTypeId,
    "type": type,
    "priorityId": priorityId,
    "prioritys": prioritys,
  };
}
