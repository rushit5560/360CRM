// To parse this JSON data, do
//
//     final activityTypeListModel = activityTypeListModelFromJson(jsonString);

import 'dart:convert';

ActivityTypeListModel activityTypeListModelFromJson(String str) => ActivityTypeListModel.fromJson(json.decode(str));

String activityTypeListModelToJson(ActivityTypeListModel data) => json.encode(data.toJson());

class ActivityTypeListModel {
  int statusCode;
  bool success;
  List<ActivityTypeListData> data;

  ActivityTypeListModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  factory ActivityTypeListModel.fromJson(Map<String, dynamic> json) => ActivityTypeListModel(
    statusCode: json["statusCode"]??0,
    success: json["success"]??false,
    data: List<ActivityTypeListData>.from((json["data"]??[]).map((x) => ActivityTypeListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ActivityTypeListData {
  int? activityTypeId;
  String? type;
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

  ActivityTypeListData({
    this.activityTypeId,
    this.type,
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

  factory ActivityTypeListData.fromJson(Map<String, dynamic> json) => ActivityTypeListData(
    activityTypeId: json["activityTypeId"]??0,
    type: json["type"]??'',
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now().toString()),
    modifiedBy: json["modifiedBy"]??'',
    modifiedOn: DateTime.parse(json["modifiedOn"]??DateTime.now().toString()),
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "activityTypeId": activityTypeId,
    "type": type,
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
