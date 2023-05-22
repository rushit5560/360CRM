// To parse this JSON data, do
//
//     final companyListModel = companyListModelFromJson(jsonString);

import 'dart:convert';

CompanyListModel companyListModelFromJson(String str) =>
    CompanyListModel.fromJson(json.decode(str));

String companyListModelToJson(CompanyListModel data) =>
    json.encode(data.toJson());

class CompanyListModel {
  int statusCode;
  List<Datum> data;

  CompanyListModel({
    required this.statusCode,
    required this.data,
  });

  factory CompanyListModel.fromJson(Map<String, dynamic> json) =>
      CompanyListModel(
        statusCode: json["statusCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int companyId;
  String companyName;
  int companyTypeId;
  String phone;
  String phone2;
  String fax;
  String website;
  String email;
  dynamic companyType;
  int customerId;
  dynamic customer;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  DateTime createdOn;
  String? modifiedBy;
  DateTime? modifiedOn;
  bool isActive;
  bool isDeleted;
  dynamic createdUser;
  dynamic modifiedUser;

  Datum({
    required this.companyId,
    required this.companyName,
    required this.companyTypeId,
    required this.phone,
    required this.phone2,
    required this.fax,
    required this.website,
    required this.email,
    this.companyType,
    required this.customerId,
    this.customer,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.createdBy,
    required this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    this.createdUser,
    this.modifiedUser,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        companyId: json["companyId"],
        companyName: json["companyName"],
        companyTypeId: json["companyTypeId"],
        phone: json["phone"],
        phone2: json["phone2"],
        fax: json["fax"],
        website: json["website"],
        email: json["email"],
        companyType: json["companyType"],
        customerId: json["customerId"],
        customer: json["customer"],
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        totalRecords: json["totalRecords"],
        createdBy: json["createdBy"],
        createdOn: DateTime.parse(json["createdOn"]),
        modifiedBy: json["modifiedBy"],
        modifiedOn: json["modifiedOn"] == null
            ? null
            : DateTime.parse(json["modifiedOn"]),
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdUser: json["createdUser"],
        modifiedUser: json["modifiedUser"],
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
        "companyType": companyType,
        "customerId": customerId,
        "customer": customer,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalRecords": totalRecords,
        "createdBy": createdBy,
        "createdOn": createdOn.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedOn": modifiedOn?.toIso8601String(),
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdUser": createdUser,
        "modifiedUser": modifiedUser,
      };
}
