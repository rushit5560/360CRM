// To parse this JSON data, do
//
//     final workOrderTypeListModel = workOrderTypeListModelFromJson(jsonString);

import 'dart:convert';

WorkOrderTypeListModel workOrderTypeListModelFromJson(String str) =>
    WorkOrderTypeListModel.fromJson(json.decode(str));

String workOrderTypeListModelToJson(WorkOrderTypeListModel data) =>
    json.encode(data.toJson());

class WorkOrderTypeListModel {
  int statusCode;
  List<WorkOrderTypeData> data;

  WorkOrderTypeListModel({
    required this.statusCode,
    required this.data,
  });

  factory WorkOrderTypeListModel.fromJson(Map<String, dynamic> json) =>
      WorkOrderTypeListModel(
        statusCode: json["statusCode"]??0,
        data: List<WorkOrderTypeData>.from((json["data"]??{}).map((x) => WorkOrderTypeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WorkOrderTypeData {
  int? workOrderTypeId;
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

  WorkOrderTypeData({
     this.workOrderTypeId,
     this.type,
     this.customerId,
    // required this.customer,
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

  factory WorkOrderTypeData.fromJson(Map<String, dynamic> json) => WorkOrderTypeData(
        workOrderTypeId: json["workOrderTypeId"]??0,
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
        "workOrderTypeId": workOrderTypeId,
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
