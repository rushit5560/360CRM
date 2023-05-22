// To parse this JSON data, do
//
//     final updateCompanyModel = updateCompanyModelFromJson(jsonString);

import 'dart:convert';

UpdateCompanyModel updateCompanyModelFromJson(String str) =>
    UpdateCompanyModel.fromJson(json.decode(str));

String updateCompanyModelToJson(UpdateCompanyModel data) =>
    json.encode(data.toJson());

class UpdateCompanyModel {
  int statusCode;
  Data data;

  UpdateCompanyModel({
    required this.statusCode,
    required this.data,
  });

  factory UpdateCompanyModel.fromJson(Map<String, dynamic> json) =>
      UpdateCompanyModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data.toJson(),
      };
}

class Data {
  int companyId;
  String companyName;
  int companyTypeId;
  String phone;
  String phone2;
  String fax;
  String website;
  String email;
  CompanyType companyType;
  int customerId;

  // dynamic customer;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  DateTime createdOn;

  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  bool isDeleted;

  // dynamic createdUser;
  // dynamic modifiedUser;

  Data({
    required this.companyId,
    required this.companyName,
    required this.companyTypeId,
    required this.phone,
    required this.phone2,
    required this.fax,
    required this.website,
    required this.email,
    required this.companyType,
    required this.customerId,
    // this.customer,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        companyId: json["companyId"] ?? 0,
        companyName: json["companyName"].toString(),
        companyTypeId: json["companyTypeId"] ?? 0,
        phone: json["phone"].toString(),
        phone2: json["phone2"].toString(),
        fax: json["fax"].toString(),
        website: json["website"].toString(),
        email: json["email"].toString(),
        companyType: CompanyType.fromJson(json["companyType"] ?? {}),
        customerId: json["customerId"] ?? 0,
        // customer: json["customer"],
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        totalRecords: json["totalRecords"] ?? 0,
        createdBy: json["createdBy"].toString(),
        createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
        // modifiedBy: json["modifiedBy"],
        // modifiedOn: json["modifiedOn"],
        isActive: json["isActive"] ?? false,
        isDeleted: json["isDeleted"] ?? false,
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "companyName": companyName,
        "companyTypeId": companyTypeId,
        "phone": phone,
        "phone2": phone2,
        "fax": fax,
        "website": website,
        "email": email,
        "companyType": companyType.toJson(),
        "customerId": customerId,
        // "customer": customer,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalRecords": totalRecords,
        "createdBy": createdBy,
        "createdOn": createdOn.toIso8601String(),
        // "modifiedBy": modifiedBy,
        // "modifiedOn": modifiedOn,
        "isActive": isActive,
        "isDeleted": isDeleted,
        // "createdUser": createdUser,
        // "modifiedUser": modifiedUser,
      };
}

class CompanyType {
  int companyTypeId;
  String companyTypes;
  int customerId;

  // dynamic customer;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  DateTime createdOn;

  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  bool isDeleted;

  // dynamic createdUser;
  // dynamic modifiedUser;

  CompanyType({
    required this.companyTypeId,
    required this.companyTypes,
    required this.customerId,
    // this.customer,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory CompanyType.fromJson(Map<String, dynamic> json) => CompanyType(
        companyTypeId: json["companyTypeId"] ?? 0,
        companyTypes: json["companyTypes"].toString(),
        customerId: json["customerId"] ?? 0,
        // customer: json["customer"],
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        totalRecords: json["totalRecords"] ?? 0,
        createdBy: json["createdBy"].toString(),
        createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
        // modifiedBy: json["modifiedBy"],
        // modifiedOn: json["modifiedOn"],
        isActive: json["isActive"] ?? false,
        isDeleted: json["isDeleted"] ?? false,
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
      );

  Map<String, dynamic> toJson() => {
        "companyTypeId": companyTypeId,
        "companyTypes": companyTypes,
        "customerId": customerId,
        // "customer": customer,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalRecords": totalRecords,
        "createdBy": createdBy,
        "createdOn": createdOn.toIso8601String(),
        // "modifiedBy": modifiedBy,
        // "modifiedOn": modifiedOn,
        "isActive": isActive,
        "isDeleted": isDeleted,
        // "createdUser": createdUser,
        // "modifiedUser": modifiedUser,
      };
}
