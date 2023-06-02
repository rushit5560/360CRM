// To parse this JSON data, do
//
//     final getPreQualificationCheckListModel = getPreQualificationCheckListModelFromJson(jsonString);

import 'dart:convert';

GetPreQualificationCheckListModel getPreQualificationCheckListModelFromJson(
        String str) =>
    GetPreQualificationCheckListModel.fromJson(json.decode(str));

class GetPreQualificationCheckListModel {
  int statusCode;
  Data data;

  GetPreQualificationCheckListModel({
    required this.statusCode,
    required this.data,
  });

  factory GetPreQualificationCheckListModel.fromJson(
          Map<String, dynamic> json) =>
      GetPreQualificationCheckListModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? []),
      );
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
  List<PreQualificationList> data;
  bool succeeded;

  // dynamic errors;
  String message;

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
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        // firstPage: json["firstPage"],
        // lastPage: json["lastPage"],
        totalPages: json["totalPages"] ?? 0,
        totalRecords: json["totalRecords"] ?? 0,
        // nextPage: json["nextPage"],
        // previousPage: json["previousPage"],
        data:
            List<PreQualificationList>.from(json["data"].map((x) => PreQualificationList.fromJson(x)) ?? []),
        succeeded: json["succeeded"] ?? false,
        // errors: json["errors"],
        message: json["message"] ?? "",
      );
}

class PreQualificationList {
  int preQualificationCheckListId;
  DateTime dateSubmitted;

  // bool twoMostRecentPayStubs;
  // bool lastTwoYearsTaxReturn;
  // bool threeMostRecentMonthsBankStatement;
  // bool copyOfCurrentDriversLicense;
  // bool creditApplication;
  // bool originalSignature;
  // bool paidApplicationFee;
  // dynamic propertyId;
  // dynamic property;
  // int contactId;
  // dynamic contact;
  // String type;
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

  PreQualificationList({
    required this.preQualificationCheckListId,
    required this.dateSubmitted,
    // required this.twoMostRecentPayStubs,
    // required this.lastTwoYearsTaxReturn,
    // required this.threeMostRecentMonthsBankStatement,
    // required this.copyOfCurrentDriversLicense,
    // required this.creditApplication,
    // required this.originalSignature,
    // required this.paidApplicationFee,
    // this.propertyId,
    // this.property,
    // required this.contactId,
    // this.contact,
    // required this.type,
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

  factory PreQualificationList.fromJson(Map<String, dynamic> json) => PreQualificationList(
        preQualificationCheckListId: json["preQualificationCheckListId"] ?? 0,
        dateSubmitted:
            DateTime.parse(json["dateSubmitted"].toString()) ?? DateTime.now(),
        // twoMostRecentPayStubs: json["twoMostRecentPayStubs"],
        // lastTwoYearsTaxReturn: json["lastTwoYearsTaxReturn"],
        // threeMostRecentMonthsBankStatement:
        //     json["threeMostRecentMonthsBankStatement"],
        // copyOfCurrentDriversLicense: json["copyOfCurrentDriversLicense"],
        // creditApplication: json["creditApplication"],
        // originalSignature: json["originalSignature"],
        // paidApplicationFee: json["paidApplicationFee"],
        // propertyId: json["propertyID"],
        // property: json["property"],
        // contactId: json["contactID"],
        // contact: json["contact"],
        // type: json["type"],
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
