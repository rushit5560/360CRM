// To parse this JSON data, do
//
//     final getAllActiveRoleModel = getAllActiveRoleModelFromJson(jsonString);

import 'dart:convert';

GetAllActiveRoleModel getAllActiveRoleModelFromJson(String str) => GetAllActiveRoleModel.fromJson(json.decode(str));

String getAllActiveRoleModelToJson(GetAllActiveRoleModel data) => json.encode(data.toJson());

class GetAllActiveRoleModel {
  int statusCode;
  List<ActiveRoleData> data;

  GetAllActiveRoleModel({
    required this.statusCode,
    required this.data,
  });

  factory GetAllActiveRoleModel.fromJson(Map<String, dynamic> json) => GetAllActiveRoleModel(
    statusCode: json["statusCode"]??0,
    data: List<ActiveRoleData>.from((json["data"]??[]).map((x) => ActiveRoleData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ActiveRoleData {
  int? systemUserId;
  // dynamic roleId;
  String? userName;
  String? password;
  String? fullName;
  // dynamic active;
  String? emailAddress;
  String? returnAddress;
  String? signature;
  // dynamic popHost;
  // dynamic popPort;
  // dynamic popUserName;
  // dynamic popPassword;
  // dynamic popTimeout;
  // dynamic popSizeLimit;
  String? smtpHost;
  String? smtpUserName;
  String? smtpPassword;
  int? smtpPort;
  bool? smtpssl;
  // dynamic registeredUser;
  DateTime? lastLoginTime;
  int? customerId;
  // dynamic customer;
  int? pageNumber;
  int? pageSize;
  int? totalRecords;
  String? createdBy;
  DateTime? createdOn;
  String? modifiedBy;
  DateTime? modifiedOn;
  bool? isActive;
  bool? isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  ActiveRoleData({
    this.systemUserId,
    // this.roleId,
    this.userName,
    this.password,
    this.fullName,
    // this.active,
    this.emailAddress,
    this.returnAddress,
    this.signature,
    // this.popHost,
    // this.popPort,
    // this.popUserName,
    // this.popPassword,
    // this.popTimeout,
    // this.popSizeLimit,
    this.smtpHost,
    this.smtpUserName,
    this.smtpPassword,
    this.smtpPort,
    this.smtpssl,
    // this.registeredUser,
    this.lastLoginTime,
    this.customerId,
    // this.customer,
    this.pageNumber,
    this.pageSize,
    this.totalRecords,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.isActive,
    this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory ActiveRoleData.fromJson(Map<String, dynamic> json) => ActiveRoleData(
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
    smtpPort: json["smtpPort"]??0,
    smtpssl: json["smtpssl"]??false,
    // registeredUser: json["registeredUser"],
    lastLoginTime: DateTime.parse(json["lastLoginTime"]??DateTime.now().toString()),
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??"",
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now().toString()),
    modifiedBy: json["modifiedBy"]??'',
    modifiedOn: DateTime.parse(json["modifiedOn"]??DateTime.now().toString()),
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
    "smtpPort": smtpPort,
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
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "isActive": isActive,
    "isDeleted": isDeleted,
    // "createdUser": createdUser,
    // "modifiedUser": modifiedUser,
  };
}
