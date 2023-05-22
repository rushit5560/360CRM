// To parse this JSON data, do
//
//     final companyAddressFilterModel = companyAddressFilterModelFromJson(jsonString);

import 'dart:convert';

CompanyAddressFilterModel companyAddressFilterModelFromJson(String str) =>
    CompanyAddressFilterModel.fromJson(json.decode(str));

// String companyAddressFilterModelToJson(CompanyAddressFilterModel data) => json.encode(data.toJson());

class CompanyAddressFilterModel {
  int statusCode;
  Data data;

  CompanyAddressFilterModel({
    required this.statusCode,
    required this.data,
  });

  factory CompanyAddressFilterModel.fromJson(Map<String, dynamic> json) =>
      CompanyAddressFilterModel(
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"] ?? {}),
      );

  // Map<String, dynamic> toJson() => {
  //   "statusCode": statusCode,
  //   "data": data.toJson(),
  // };
}

class Data {
  int pageNumber;
  int pageSize;
  // dynamic firstPage;
  // dynamic lastPage;
  int totalPages;
  int totalRecords;
  // dynamic nextPage;
  // dynamic previousPage;
  List<AddressList> data;
  bool succeeded;
  // dynamic errors;
  // dynamic message;

  Data({
    required this.pageNumber,
    required this.pageSize,
    // this.firstPage,
    // this.lastPage,
    required this.totalPages,
    required this.totalRecords,
    // this.nextPage,
    // this.previousPage,
    required this.data,
    required this.succeeded,
    // this.errors,
    // this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        // firstPage: json["firstPage"],
        // lastPage: json["lastPage"],
        totalPages: json["totalPages"] ?? 0,
        totalRecords: json["totalRecords"] ?? 0,
        // nextPage: json["nextPage"],
        // previousPage: json["previousPage"],
        data: List<AddressList>.from(
          json["data"].map((x) => AddressList.fromJson(x)) ?? {},
        ),
        succeeded: json["succeeded"] ?? false,
        // errors: json["errors"],
        // message: json["message"],
      );

  // Map<String, dynamic> toJson() => {
  //   "pageNumber": pageNumber,
  //   "pageSize": pageSize,
  //   "firstPage": firstPage,
  //   "lastPage": lastPage,
  //   "totalPages": totalPages,
  //   "totalRecords": totalRecords,
  //   "nextPage": nextPage,
  //   "previousPage": previousPage,
  //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //   "succeeded": succeeded,
  //   "errors": errors,
  //   "message": message,
  // };
}

class AddressList {
  int addressId;
  // dynamic contactId;
  // dynamic contact;
  String address1;
  String address2;
  String zip;
  String type;
  int addressTypeId;
  // dynamic addressType;
  int companyId;
  // dynamic company;
  // dynamic cityId;
  // dynamic city;
  int stateId;
  // dynamic state;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  // DateTime createdOn;
  String modifiedBy;
  // DateTime modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  AddressList({
    required this.addressId,
    // this.contactId,
    // this.contact,
    required this.address1,
    required this.address2,
    required this.zip,
    required this.type,
    required this.addressTypeId,
    // this.addressType,
    required this.companyId,
    // this.company,
    // this.cityId,
    // this.city,
    required this.stateId,
    // this.state,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.createdBy,
    // required this.createdOn,
    required this.modifiedBy,
    // required this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
        addressId: json["addressId"] ?? 0,
        // contactId: json["contactID"],
        // contact: json["contact"],
        address1: json["address1"] ?? "",
        address2: json["address2"] ?? "",
        zip: json["zip"] ?? "",
        type: json["type"] ?? "",
        addressTypeId: json["addressTypeId"] ?? 0,
        // addressType: json["addressType"],
        companyId: json["companyID"] ?? 0,
        // company: json["company"],
        // cityId: json["cityID"],
        // city: json["city"],
        stateId: json["stateID"] ?? 0,
        // state: json["state"],
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        totalRecords: json["totalRecords"] ?? 0,
        createdBy: json["createdBy"] ?? "",
        // createdOn: DateTime.parse(json["createdOn"]),
        modifiedBy: json["modifiedBy"] ?? "",
        // modifiedOn: DateTime.parse(json["modifiedOn"]),
        isActive: json["isActive"] ?? false,
        isDeleted: json["isDeleted"] ?? false,
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
      );

  // Map<String, dynamic> toJson() => {
  //   "addressId": addressId,
  //   "contactID": contactId,
  //   "contact": contact,
  //   "address1": address1,
  //   "address2": address2,
  //   "zip": zip,
  //   "type": type,
  //   "addressTypeId": addressTypeId,
  //   "addressType": addressType,
  //   "companyID": companyId,
  //   "company": company,
  //   "cityID": cityId,
  //   "city": city,
  //   "stateID": stateId,
  //   "state": state,
  //   "pageNumber": pageNumber,
  //   "pageSize": pageSize,
  //   "totalRecords": totalRecords,
  //   "createdBy": createdBy,
  //   "createdOn": createdOn.toIso8601String(),
  //   "modifiedBy": modifiedBy,
  //   "modifiedOn": modifiedOn.toIso8601String(),
  //   "isActive": isActive,
  //   "isDeleted": isDeleted,
  //   "createdUser": createdUser,
  //   "modifiedUser": modifiedUser,
  // };
}
