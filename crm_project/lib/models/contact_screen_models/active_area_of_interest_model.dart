// To parse this JSON data, do
//
//     final getAllActiveAreaOfInterestModel = getAllActiveAreaOfInterestModelFromJson(jsonString);

import 'dart:convert';

GetAllActiveAreaOfInterestModel getAllActiveAreaOfInterestModelFromJson(
        String str) =>
    GetAllActiveAreaOfInterestModel.fromJson(json.decode(str));

class GetAllActiveAreaOfInterestModel {
  int statusCode;
  List<ActiveAreaOfInterestData> data;

  GetAllActiveAreaOfInterestModel({
    required this.statusCode,
    required this.data,
  });

  factory GetAllActiveAreaOfInterestModel.fromJson(Map<String, dynamic> json) =>
      GetAllActiveAreaOfInterestModel(
        statusCode: json["statusCode"] ?? 0,
        data:
            List<ActiveAreaOfInterestData>.from(json["data"].map((x) => ActiveAreaOfInterestData.fromJson(x)) ?? []),
      );
}

class ActiveAreaOfInterestData {
  int? areaOfInterestId;
  String? type;
  // int customerId;
  // dynamic customer;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  ActiveAreaOfInterestData({
     this.areaOfInterestId,
     this.type,
    // required this.customerId,
    // this.customer,
    // required this.pageNumber,
    // required this.pageSize,
    // required this.totalRecords,
    // required this.createdBy,
    // required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    // required this.isActive,
    // required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory ActiveAreaOfInterestData.fromJson(Map<String, dynamic> json) => ActiveAreaOfInterestData(
        areaOfInterestId: json["areaOfInterestId"] ?? 0,
        type: json["type"] ?? "",
        // customerId: json["customerId"],
        // customer: json["customer"],
        // pageNumber: json["pageNumber"],
        // pageSize: json["pageSize"],
        // totalRecords: json["totalRecords"],
        // createdBy: json["createdBy"],
        // createdOn: DateTime.parse(json["createdOn"]),
        // modifiedBy: json["modifiedBy"],
        // modifiedOn: json["modifiedOn"],
        // isActive: json["isActive"],
        // isDeleted: json["isDeleted"],
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
      );
}
