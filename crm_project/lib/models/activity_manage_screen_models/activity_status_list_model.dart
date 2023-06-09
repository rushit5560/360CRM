// To parse this JSON data, do
//
//     final activityStatusListModel = activityStatusListModelFromJson(jsonString);

import 'dart:convert';

ActivityStatusListModel activityStatusListModelFromJson(String str) => ActivityStatusListModel.fromJson(json.decode(str));

String activityStatusListModelToJson(ActivityStatusListModel data) => json.encode(data.toJson());

class ActivityStatusListModel {
  int statusCode;
  List<ActivityStatusListData> data;

  ActivityStatusListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActivityStatusListModel.fromJson(Map<String, dynamic> json) => ActivityStatusListModel(
    statusCode: json["statusCode"],
    data: List<ActivityStatusListData>.from(json["data"].map((x) => ActivityStatusListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ActivityStatusListData {
  int? activityStatusId;
  String? status;
  int? customerId;
  // dynamic customer;
  int? pageNumber;
  int? pageSize;
  int? totalRecords;
  String? createdBy;
  DateTime? createdOn;
  // dynamic modifiedBy;
  DateTime? modifiedOn;
  bool? isActive;
  bool? isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  ActivityStatusListData({
    this.activityStatusId,
    this.status,
    this.customerId,
    // this.customer,
    this.pageNumber,
    this.pageSize,
    this.totalRecords,
    this.createdBy,
    this.createdOn,
    // this.modifiedBy,
    this.modifiedOn,
    this.isActive,
    this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory ActivityStatusListData.fromJson(Map<String, dynamic> json) => ActivityStatusListData(
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
  };
}
