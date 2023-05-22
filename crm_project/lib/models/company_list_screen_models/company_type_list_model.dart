// To parse this JSON data, do
//
//     final companyTypeListModel = companyTypeListModelFromJson(jsonString);

import 'dart:convert';

CompanyTypeListModel companyTypeListModelFromJson(String str) => CompanyTypeListModel.fromJson(json.decode(str));

String companyTypeListModelToJson(CompanyTypeListModel data) => json.encode(data.toJson());

class CompanyTypeListModel {
  int statusCode;
  List<CompanyTypeDetails> data;

  CompanyTypeListModel({
    required this.statusCode,
    required this.data,
  });

  factory CompanyTypeListModel.fromJson(Map<String, dynamic> json) => CompanyTypeListModel(
    statusCode: json["statusCode"]??0,
    data: List<CompanyTypeDetails>.from((json["data"]??{}).map((x) => CompanyTypeDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CompanyTypeDetails {
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

  CompanyTypeDetails({
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

  factory CompanyTypeDetails.fromJson(Map<String, dynamic> json) => CompanyTypeDetails(
    companyTypeId: json["companyTypeId"]??0,
    companyTypes: json["companyTypes"].toString(),
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"].toString(),
    createdOn: DateTime.parse(json["createdOn"]?? DateTime.now()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
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
