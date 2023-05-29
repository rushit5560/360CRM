// To parse this JSON data, do
//
//     final activeContactCategoryModel = activeContactCategoryModelFromJson(jsonString);

import 'dart:convert';

ActiveContactCategoryModel activeContactCategoryModelFromJson(String str) =>
    ActiveContactCategoryModel.fromJson(json.decode(str));

// String activeContactCategoryModelToJson(ActiveContactCategoryModel data) => json.encode(data.toJson());

class ActiveContactCategoryModel {
  int statusCode;
  List<ContactCategoryData> data;

  ActiveContactCategoryModel({
    required this.statusCode,
    required this.data,
  });

  factory ActiveContactCategoryModel.fromJson(Map<String, dynamic> json) =>
      ActiveContactCategoryModel(
        statusCode: json["statusCode"] ?? 0,
        data: List<ContactCategoryData>.from(
            json["data"].map((x) => ContactCategoryData.fromJson(x)) ?? []),
      );

  // Map<String, dynamic> toJson() => {
  //     "statusCode": statusCode,
  //     "data": List<dynamic>.from(data.map((x) => x.toJson())),
  // };
}

class ContactCategoryData {
  int? contactCategoryId;
  String? contactCategorys;
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

  ContactCategoryData({
     this.contactCategoryId,
     this.contactCategorys,
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

  factory ContactCategoryData.fromJson(Map<String, dynamic> json) =>
      ContactCategoryData(
        contactCategoryId: json["contactCategoryId"] ?? 0,
        contactCategorys: json["contactCategorys"] ?? "",
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

  // Map<String, dynamic> toJson() => {
  //     "contactCategoryId": contactCategoryId,
  //     "contactCategorys": contactCategorys,
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
