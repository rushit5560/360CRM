// To parse this JSON data, do
//
//     final getAllAddressModel = getAllAddressModelFromJson(jsonString);

import 'dart:convert';

GetAllAddressModel getAllAddressModelFromJson(String str) =>
    GetAllAddressModel.fromJson(json.decode(str));

// String getAllAddressModelToJson(GetAllAddressModel data) => json.encode(data.toJson());

class GetAllAddressModel {
  int statusCode;
  List<AddressList> data;

  GetAllAddressModel({
    required this.statusCode,
    required this.data,
  });

  factory GetAllAddressModel.fromJson(Map<String, dynamic> json) =>
      GetAllAddressModel(
        statusCode: json["statusCode"],
        data: List<AddressList>.from(
            json["data"].map((x) => AddressList.fromJson(x))),
      );

// Map<String, dynamic> toJson() => {
//   "statusCode": statusCode,
//   "data": List<dynamic>.from(data.map((x) => x.toJson())),
// };
}

class AddressList {
  int addressTypeId;
  String addressTypes;
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

  AddressList({
    required this.addressTypeId,
    required this.addressTypes,
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

  factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
        addressTypeId: json["addressTypeId"] ?? 0,
        addressTypes: json["addressTypes"] ?? "",
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
//   "addressTypeId": addressTypeId,
//   "addressTypes": addressTypes,
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
