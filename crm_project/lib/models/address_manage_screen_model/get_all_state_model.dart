// To parse this JSON data, do
//
//     final getAllStateModel = getAllStateModelFromJson(jsonString);

import 'dart:convert';

GetAllStateModel getAllStateModelFromJson(String str) =>
    GetAllStateModel.fromJson(json.decode(str));

// String getAllStateModelToJson(GetAllStateModel data) => json.encode(data.toJson());

class GetAllStateModel {
  int statusCode;
  List<StateList> data;

  GetAllStateModel({
    required this.statusCode,
    required this.data,
  });

  factory GetAllStateModel.fromJson(Map<String, dynamic> json) =>
      GetAllStateModel(
        statusCode: json["statusCode"] ?? 0,
        data:
            List<StateList>.from(json["data"].map((x) => StateList.fromJson(x)) ?? {}),
      );

// Map<String, dynamic> toJson() => {
//   "statusCode": statusCode,
//   "data": List<dynamic>.from(data.map((x) => x.toJson())),
// };
}

class StateList {
  int stateId;
  String stateName;
  String shortName;
  int customerId;

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

  StateList({
    required this.stateId,
    required this.stateName,
    required this.shortName,
    required this.customerId,
    // this.customer,
    // this.pageNumber,
    // this.pageSize,
    // this.totalRecords,
    // this.createdBy,
    // this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    // this.isActive,
    // this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory StateList.fromJson(Map<String, dynamic> json) => StateList(
        stateId: json["stateID"] ?? 0,
        stateName: json["stateName"] ?? "",
        shortName: json["shortName"] ?? "",
        customerId: json["customerId"] ?? 0,
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

// Map<String, dynamic> toJson() => {
//   "stateID": stateId,
//   "stateName": stateName,
//   "shortName": shortName,
//   "customerId": customerId,
//   "customer": customer,
//   "pageNumber": pageNumber,
//   "pageSize": pageSize,
//   "totalRecords": totalRecords,
//   "createdBy": createdBy,
//   "createdOn": createdOn.toIso8601String(),
//   "modifiedBy": modifiedBy,
//   "modifiedOn": modifiedOn,
//   "isActive": isActive,
//   "isDeleted": isDeleted,
//   "createdUser": createdUser,
//   "modifiedUser": modifiedUser,
// };
}
