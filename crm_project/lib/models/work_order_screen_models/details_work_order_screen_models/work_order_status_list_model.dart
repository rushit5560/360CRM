// To parse this JSON data, do
//
//     final workOrderStatusListModel = workOrderStatusListModelFromJson(jsonString);

import 'dart:convert';

WorkOrderStatusListModel workOrderStatusListModelFromJson(String str) => WorkOrderStatusListModel.fromJson(json.decode(str));

String workOrderStatusListModelToJson(WorkOrderStatusListModel data) => json.encode(data.toJson());

class WorkOrderStatusListModel {
  int statusCode;
  List<WorkOrderStatusData> data;

  WorkOrderStatusListModel({
   required this.statusCode,
   required this.data,
  });

  factory WorkOrderStatusListModel.fromJson(Map<String, dynamic> json) => WorkOrderStatusListModel(
    statusCode: json["statusCode"],
    data: List<WorkOrderStatusData>.from(json["data"].map((x) => WorkOrderStatusData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class WorkOrderStatusData {
  int? workOrderStatusId;
  String? name;
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

  WorkOrderStatusData({
    this.workOrderStatusId,
    this.name,
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

  factory WorkOrderStatusData.fromJson(Map<String, dynamic> json) => WorkOrderStatusData(
    workOrderStatusId: json["workOrderStatusID"]??0,
    name: json["name"]??'',
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
    "workOrderStatusID": workOrderStatusId,
    "name": name,
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
