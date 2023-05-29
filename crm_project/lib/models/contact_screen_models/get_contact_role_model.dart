// To parse this JSON data, do
//
//     final getContactRoleModel = getContactRoleModelFromJson(jsonString);

import 'dart:convert';

GetContactRoleModel getContactRoleModelFromJson(String str) =>
    GetContactRoleModel.fromJson(json.decode(str));

// String getContactRoleModelToJson(GetContactRoleModel data) => json.encode(data.toJson());

class GetContactRoleModel {
  int statusCode;
  List<ContactRoleData> data;

  GetContactRoleModel({
    required this.statusCode,
    required this.data,
  });

  factory GetContactRoleModel.fromJson(Map<String, dynamic> json) =>
      GetContactRoleModel(
        statusCode: json["statusCode"] ?? 0,
        data:
            List<ContactRoleData>.from(json["data"].map((x) => ContactRoleData.fromJson(x)) ?? []),
      );

  // Map<String, dynamic> toJson() => {
  //     "statusCode": statusCode,
  //     "data": List<dynamic>.from(data.map((x) => x.toJson())),
  // };
}

class ContactRoleData {
  int? contactRoleId;
  String? name;
  // int customerId;
  // dynamic customer;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // String? modifiedBy;
  // DateTime? modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  ContactRoleData({
    this.contactRoleId,
    this.name,
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

  factory ContactRoleData.fromJson(Map<String, dynamic> json) => ContactRoleData(
        contactRoleId: json["contactRoleID"] ?? 0,
        name: json["name"] ?? "",
        // customerId: json["customerId"],
        // customer: json["customer"],
        // pageNumber: json["pageNumber"],
        // pageSize: json["pageSize"],
        // totalRecords: json["totalRecords"],
        // createdBy: json["createdBy"],
        // createdOn: DateTime.parse(json["createdOn"]),
        // modifiedBy: json["modifiedBy"],
        // modifiedOn: json["modifiedOn"] == null ? null : DateTime.parse(json["modifiedOn"]),
        // isActive: json["isActive"],
        // isDeleted: json["isDeleted"],
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
      );

  // Map<String, dynamic> toJson() => {
  //     "contactRoleID": contactRoleId,
  //     "name": name,
  //     "customerId": customerId,
  //     "customer": customer,
  //     "pageNumber": pageNumber,
  //     "pageSize": pageSize,
  //     "totalRecords": totalRecords,
  //     "createdBy": createdBy,
  //     "createdOn": createdOn.toIso8601String(),
  //     "modifiedBy": modifiedBy,
  //     "modifiedOn": modifiedOn?.toIso8601String(),
  //     "isActive": isActive,
  //     "isDeleted": isDeleted,
  //     "createdUser": createdUser,
  //     "modifiedUser": modifiedUser,
  // };
}
