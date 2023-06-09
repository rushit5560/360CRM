// To parse this JSON data, do
//
//     final activityUsersListModel = activityUsersListModelFromJson(jsonString);

import 'dart:convert';

ActivityUsersListModel activityUsersListModelFromJson(String str) => ActivityUsersListModel.fromJson(json.decode(str));

String activityUsersListModelToJson(ActivityUsersListModel data) => json.encode(data.toJson());

class ActivityUsersListModel {
  int statusCode;
  Data data;

  ActivityUsersListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActivityUsersListModel.fromJson(Map<String, dynamic> json) => ActivityUsersListModel(
    statusCode: json["statusCode"]??0,
    data: Data.fromJson(json["data"]??[]),
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
  List<UserListData> data;
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
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    // firstPage: json["firstPage"],
    // lastPage: json["lastPage"],
    totalPages: json["totalPages"]??0,
    totalRecords: json["totalRecords"]??0,
    // nextPage: json["nextPage"],
    // previousPage: json["previousPage"],
    data: List<UserListData>.from((json["data"]??{}).map((x) => UserListData.fromJson(x))),
    succeeded: json["succeeded"],
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

class UserListData {
  int mtmActivityUserId;
  int activityId;
  Activity activity;
  int systemUserId;
  SystemUser systemUser;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  UserListData({
    required this.mtmActivityUserId,
    required this.activityId,
    required this.activity,
    required this.systemUserId,
    required this.systemUser,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory UserListData.fromJson(Map<String, dynamic> json) => UserListData(
    mtmActivityUserId: json["mtmActivityUserId"]??0,
    activityId: json["activityID"]??0,
    activity: Activity.fromJson(json["activity"]??{}),
    systemUserId: json["systemUserId"]??0,
    systemUser: SystemUser.fromJson(json["systemUser"]??{}),
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now().toString()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "mtmActivityUserId": mtmActivityUserId,
    "activityID": activityId,
    "activity": activity.toJson(),
    "systemUserId": systemUserId,
    "systemUser": systemUser.toJson(),
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "totalRecords": totalRecords,
    "createdBy": createdBy,
    "createdOn": createdOn,
    // "modifiedBy": modifiedBy,
    // "modifiedOn": modifiedOn,
    "isActive": isActive,
    "isDeleted": isDeleted,
    // "createdUser": createdUser,
    // "modifiedUser": modifiedUser,
  };
}

class Activity {
  int activityId;
  int activityTypeId;
  // dynamic activityType;
  // dynamic priorityId;
  // dynamic priority;
  int activityStatusId;
  // dynamic activityStatus;
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

  Activity({
    required this.activityId,
    required this.activityTypeId,
    // this.activityType,
    // this.priorityId,
    // this.priority,
    required this.activityStatusId,
    // this.activityStatus,
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

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    activityId: json["activityID"]??0,
    activityTypeId: json["activityTypeId"]??0,
    // activityType: json["activityType"],
    // priorityId: json["priorityId"],
    // priority: json["priority"],
    activityStatusId: json["activityStatusId"]??0,
    // activityStatus: json["activityStatus"],
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
    totalRecords: json["totalRecords"]??0,
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
    // "activityType": activityType,
    // "priorityId": priorityId,
    // "priority": priority,
    "activityStatusId": activityStatusId,
    // "activityStatus": activityStatus,
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

class SystemUser {
  int systemUserId;
  // dynamic roleId;
  String userName;
  String password;
  String fullName;
  // dynamic active;
  String emailAddress;
  String returnAddress;
  String signature;
  // dynamic popHost;
  // dynamic popPort;
  // dynamic popUserName;
  // dynamic popPassword;
  // dynamic popTimeout;
  // dynamic popSizeLimit;
  String smtpHost;
  String smtpUserName;
  String smtpPassword;
  // dynamic smtpPort;
  bool smtpssl;
  // dynamic registeredUser;
  DateTime lastLoginTime;
  int customerId;
  // dynamic customer;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  SystemUser({
    required this.systemUserId,
    // this.roleId,
    required this.userName,
    required this.password,
    required this.fullName,
    // this.active,
    required this.emailAddress,
    required this.returnAddress,
    required this.signature,
    // this.popHost,
    // this.popPort,
    // this.popUserName,
    // this.popPassword,
    // this.popTimeout,
    // this.popSizeLimit,
    required this.smtpHost,
    required this.smtpUserName,
    required this.smtpPassword,
    // this.smtpPort,
    required this.smtpssl,
    // this.registeredUser,
    required this.lastLoginTime,
    required this.customerId,
    // this.customer,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory SystemUser.fromJson(Map<String, dynamic> json) => SystemUser(
    systemUserId: json["systemUserId"]??0,
    // roleId: json["roleId"],
    userName: json["userName"]??'',
    password: json["password"]??'',
    fullName: json["fullName"]??'',
    // active: json["active"],
    emailAddress: json["emailAddress"]??'',
    returnAddress: json["returnAddress"]??'',
    signature: json["signature"]??'',
    // popHost: json["popHost"],
    // popPort: json["popPort"],
    // popUserName: json["popUserName"],
    // popPassword: json["popPassword"],
    // popTimeout: json["popTimeout"],
    // popSizeLimit: json["popSizeLimit"],
    smtpHost: json["smtpHost"]??'',
    smtpUserName: json["smtpUserName"]??'',
    smtpPassword: json["smtpPassword"]??'',
    // smtpPort: json["smtpPort"],
    smtpssl: json["smtpssl"]??false,
    // registeredUser: json["registeredUser"],
    lastLoginTime: DateTime.parse(json["lastLoginTime"]??DateTime.now().toString()),
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now().toString()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "systemUserId": systemUserId,
    // "roleId": roleId,
    "userName": userName,
    "password": password,
    "fullName": fullName,
    // "active": active,
    "emailAddress": emailAddress,
    "returnAddress": returnAddress,
    "signature": signature,
    // "popHost": popHost,
    // "popPort": popPort,
    // "popUserName": popUserName,
    // "popPassword": popPassword,
    // "popTimeout": popTimeout,
    // "popSizeLimit": popSizeLimit,
    "smtpHost": smtpHost,
    "smtpUserName": smtpUserName,
    "smtpPassword": smtpPassword,
    // "smtpPort": smtpPort,
    "smtpssl": smtpssl,
    // "registeredUser": registeredUser,
    "lastLoginTime": lastLoginTime,
    "customerId": customerId,
    // "customer": customer,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "totalRecords": totalRecords,
    "createdBy": createdBy,
    "createdOn": createdOn,
    // "modifiedBy": modifiedBy,
    // "modifiedOn": modifiedOn,
    "isActive": isActive,
    "isDeleted": isDeleted,
    // "createdUser": createdUser,
    // "modifiedUser": modifiedUser,
  };
}
