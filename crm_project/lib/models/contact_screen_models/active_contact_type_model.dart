// To parse this JSON data, do
//
//     final activeContactTypeModel = activeContactTypeModelFromJson(jsonString);

import 'dart:convert';

ActiveContactTypeModel activeContactTypeModelFromJson(String str) =>
    ActiveContactTypeModel.fromJson(json.decode(str));

// String activeContactTypeModelToJson(ActiveContactTypeModel data) => json.encode(data.toJson());

class ActiveContactTypeModel {
  int statusCode;
  List<ContactDataType> data;

  ActiveContactTypeModel({
    required this.statusCode,
    required this.data,
  });

  factory ActiveContactTypeModel.fromJson(Map<String, dynamic> json) =>
      ActiveContactTypeModel(
        statusCode: json["statusCode"] ?? 0,
        data: List<ContactDataType>.from(
            json["data"].map((x) => ContactDataType.fromJson(x)) ?? []),
      );

  // Map<String, dynamic> toJson() => {
  //     "statusCode": statusCode,
  //     "data": List<dynamic>.from(data.map((x) => x.toJson())),
  // };
}

class ContactDataType {
  int? contactTypeId;
  String? contactTypes;
  int? customerId;
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

  ContactDataType({
     this.contactTypeId,
     this.contactTypes,
     this.customerId,
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

  factory ContactDataType.fromJson(Map<String, dynamic> json) =>
      ContactDataType(
        contactTypeId: json["contactTypeId"] ?? 0,
        contactTypes: json["contactTypes"] ?? "",
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
  //     "contactTypeId": contactTypeId,
  //     "contactTypes": contactTypes,
  //     "customerId": customerId,
  //     "customer": customer,
  //     "pageNumber": pageNumber,
  //     "pageSize": pageSize,
  //     "totalRecords": totalRecords,
  //     "createdBy": createdBy,
  //     "createdOn": createdOn.toIso8601String(),
  //     "modifiedBy": modifiedBy,
  //     "modifiedOn": modifiedOn,
  //     "isActive": isActive,
  //     "isDeleted": isDeleted,
  //     "createdUser": createdUser,
  //     "modifiedUser": modifiedUser,
  // };
}
