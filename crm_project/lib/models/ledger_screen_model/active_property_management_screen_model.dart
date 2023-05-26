
// To parse this JSON data, do
//
//     final activePropertyManagementListModel = activePropertyManagementListModelFromJson(jsonString);

import 'dart:convert';

ActivePropertyManagementListModel activePropertyManagementListModelFromJson(String str) => ActivePropertyManagementListModel.fromJson(json.decode(str));

// String activePropertyManagementListModelToJson(ActivePropertyManagementListModel data) => json.encode(data.toJson());

class ActivePropertyManagementListModel {
  int statusCode;
  bool success;
  List<PropertyManagementData> data;

  ActivePropertyManagementListModel({
  required  this.statusCode,
  required  this.success,
  required  this.data,
  });

  factory ActivePropertyManagementListModel.fromJson(Map<String, dynamic> json) => ActivePropertyManagementListModel(
    statusCode: json["statusCode"]??0,
    success: json["success"]??false,
    data: List<PropertyManagementData>.from(json["data"].map((x) => PropertyManagementData.fromJson(x))??{}),
  );

  // Map<String, dynamic> toJson() => {
  //   "statusCode": statusCode,
  //   "success": success,
  //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
  // };
}

class PropertyManagementData {
  int? propertyManagementId;
  // int propertyId;
  // dynamic property;
  // int companyId;
  // Company company;
  // DateTime startDate;
  // DateTime endDate;
  // dynamic leaseRenewalTypeId;
  // dynamic leaseRenewalType;
  // int customerId;
  // dynamic customer;
  String? terminationTerms;
  // int termsDays;
  // int terminationNoticeId;
  // dynamic terminationNotice;
  // int monthlyFee;
  // int minimumMonthlyFee;
  // String speicalTerms;
  // String escrowAccount;
  // int escrowAmount;
  // String type;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // String modifiedBy;
  // DateTime modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  PropertyManagementData({
    this.propertyManagementId,
    // this.propertyId,
    // this.property,
    // this.companyId,
    // this.company,
    // this.startDate,
    // this.endDate,
    // this.leaseRenewalTypeId,
    // this.leaseRenewalType,
    // this.customerId,
    // this.customer,
    this.terminationTerms,
    // this.termsDays,
    // this.terminationNoticeId,
    // this.terminationNotice,
    // this.monthlyFee,
    // this.minimumMonthlyFee,
    // this.speicalTerms,
    // this.escrowAccount,
    // this.escrowAmount,
    // this.type,
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

  factory PropertyManagementData.fromJson(Map<String, dynamic> json) => PropertyManagementData(
    propertyManagementId: json["propertyManagementId"]??0,
    // propertyId: json["propertyID"],
    // property: json["property"],
    // companyId: json["companyID"],
    // company: Company.fromJson(json["company"]),
    // startDate: DateTime.parse(json["startDate"]),
    // endDate: DateTime.parse(json["endDate"]),
    // leaseRenewalTypeId: json["leaseRenewalTypeID"],
    // leaseRenewalType: json["leaseRenewalType"],
    // customerId: json["customerId"],
    // customer: json["customer"],
    terminationTerms: json["terminationTerms"]??"",
    // termsDays: json["termsDays"],
    // terminationNoticeId: json["terminationNoticeID"],
    // terminationNotice: json["terminationNotice"],
    // monthlyFee: json["monthlyFee"],
    // minimumMonthlyFee: json["minimumMonthlyFee"],
    // speicalTerms: json["speicalTerms"],
    // escrowAccount: json["escrowAccount"],
    // escrowAmount: json["escrowAmount"],
    // type: json["type"],
    // pageNumber: json["pageNumber"],
    // pageSize: json["pageSize"],
    // totalRecords: json["totalRecords"],
    // createdBy: json["createdBy"],
    // createdOn: DateTime.parse(json["createdOn"]),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: DateTime.parse(json["modifiedOn"]),
    // isActive: json["isActive"],
    // isDeleted: json["isDeleted"],
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "propertyManagementId": propertyManagementId,
    // "propertyID": propertyId,
    // "property": property,
    // "companyID": companyId,
    // "company": company.toJson(),
    // "startDate": startDate.toIso8601String(),
    // "endDate": endDate.toIso8601String(),
    // "leaseRenewalTypeID": leaseRenewalTypeId,
    // "leaseRenewalType": leaseRenewalType,
    // "customerId": customerId,
    // "customer": customer,
    "terminationTerms": terminationTerms,
    // "termsDays": termsDays,
    // "terminationNoticeID": terminationNoticeId,
    // "terminationNotice": terminationNotice,
    // "monthlyFee": monthlyFee,
    // "minimumMonthlyFee": minimumMonthlyFee,
    // "speicalTerms": speicalTerms,
    // "escrowAccount": escrowAccount,
    // "escrowAmount": escrowAmount,
    // "type": type,
    // "pageNumber": pageNumber,
    // "pageSize": pageSize,
    // "totalRecords": totalRecords,
    // "createdBy": createdBy,
    // "createdOn": createdOn.toIso8601String(),
    // "modifiedBy": modifiedBy,
    // "modifiedOn": modifiedOn.toIso8601String(),
    // "isActive": isActive,
    // "isDeleted": isDeleted,
    // "createdUser": createdUser,
    // "modifiedUser": modifiedUser,
  };
}

// class Company {
//   int companyId;
//   CompanyName companyName;
//   int companyTypeId;
//   String phone;
//   String phone2;
//   Fax fax;
//   String website;
//   Email email;
//   dynamic companyType;
//   int customerId;
//   dynamic customer;
//   int pageNumber;
//   int pageSize;
//   int totalRecords;
//   String createdBy;
//   DateTime createdOn;
//   String modifiedBy;
//   DateTime modifiedOn;
//   bool isActive;
//   bool isDeleted;
//   dynamic createdUser;
//   dynamic modifiedUser;
//
//   Company({
//     this.companyId,
//     this.companyName,
//     this.companyTypeId,
//     this.phone,
//     this.phone2,
//     this.fax,
//     this.website,
//     this.email,
//     this.companyType,
//     this.customerId,
//     this.customer,
//     this.pageNumber,
//     this.pageSize,
//     this.totalRecords,
//     this.createdBy,
//     this.createdOn,
//     this.modifiedBy,
//     this.modifiedOn,
//     this.isActive,
//     this.isDeleted,
//     this.createdUser,
//     this.modifiedUser,
//   });
//
//   factory Company.fromJson(Map<String, dynamic> json) => Company(
//     companyId: json["companyId"],
//     companyName: companyNameValues.map[json["companyName"]],
//     companyTypeId: json["companyTypeId"],
//     phone: json["phone"],
//     phone2: json["phone2"],
//     fax: faxValues.map[json["fax"]],
//     website: json["website"],
//     email: emailValues.map[json["email"]],
//     companyType: json["companyType"],
//     customerId: json["customerId"],
//     customer: json["customer"],
//     pageNumber: json["pageNumber"],
//     pageSize: json["pageSize"],
//     totalRecords: json["totalRecords"],
//     createdBy: json["createdBy"],
//     createdOn: DateTime.parse(json["createdOn"]),
//     modifiedBy: json["modifiedBy"],
//     modifiedOn: DateTime.parse(json["modifiedOn"]),
//     isActive: json["isActive"],
//     isDeleted: json["isDeleted"],
//     createdUser: json["createdUser"],
//     modifiedUser: json["modifiedUser"],
//   );

// }
