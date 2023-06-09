// To parse this JSON data, do
//
//     final activityPriorityListModel = activityPriorityListModelFromJson(jsonString);

import 'dart:convert';

ActivityPriorityListModel activityPriorityListModelFromJson(String str) => ActivityPriorityListModel.fromJson(json.decode(str));

String activityPriorityListModelToJson(ActivityPriorityListModel data) => json.encode(data.toJson());

class ActivityPriorityListModel {
  int statusCode;
  List<PriorityListData> data;

  ActivityPriorityListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActivityPriorityListModel.fromJson(Map<String, dynamic> json) => ActivityPriorityListModel(
    statusCode: json["statusCode"]??0,
    data: List<PriorityListData>.from((json["data"]??[]).map((x) => PriorityListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PriorityListData {
  int? priorityId;
  String? prioritys;
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

  PriorityListData({
    this.priorityId,
    this.prioritys,
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

  factory PriorityListData.fromJson(Map<String, dynamic> json) => PriorityListData(
    priorityId: json["priorityId"]??0,
    prioritys: json["prioritys"]??'',
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now()),
    modifiedBy: json["modifiedBy"]??'',
    modifiedOn: DateTime.parse(json["modifiedOn"]??DateTime.now().toString()),
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "priorityId": priorityId,
    "prioritys": prioritys,
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
