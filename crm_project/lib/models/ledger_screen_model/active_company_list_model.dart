import 'dart:convert';

ActiveCompanyListModel activeCompanyListModelFromJson(String str) => ActiveCompanyListModel.fromJson(json.decode(str));

String activeCompanyListModelToJson(ActiveCompanyListModel data) => json.encode(data.toJson());

class ActiveCompanyListModel {
  int statusCode;
  List<CompanyData> data;

  ActiveCompanyListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActiveCompanyListModel.fromJson(Map<String, dynamic> json) => ActiveCompanyListModel(
    statusCode: json["statusCode"] ?? 0,
    data: List<CompanyData>.from((json["data"] ?? []).map((x) => CompanyData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CompanyData {
  int? companyId;
  String? companyName;
  // int companyTypeId;
  // String phone;
  // String phone2;
  // String fax;
  // String website;
  // Email email;
  // dynamic companyType;
  // int customerId;
  // dynamic customer;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // String modifiedBy;
  // DateTime modifiedOn;
  bool? isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  CompanyData({
    this.companyId,
    this.companyName,
    // this.companyTypeId,
    // this.phone,
    // this.phone2,
    // this.fax,
    // this.website,
    // this.email,
    // this.companyType,
    // this.customerId,
    // this.customer,
    // this.pageNumber,
    // this.pageSize,
    // this.totalRecords,
    // this.createdBy,
    // this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    this.isActive,
    // this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) => CompanyData(
    companyId: json["companyId"] ?? 0,
    companyName: json["companyName"] ?? "",
    // companyTypeId: json["companyTypeId"],
    // phone: json["phone"],
    // phone2: json["phone2"],
    // fax: json["fax"],
    // website: json["website"],
    // email: emailValues.map[json["email"]],
    // companyType: json["companyType"],
    // customerId: json["customerId"],
    // customer: json["customer"],
    // pageNumber: json["pageNumber"],
    // pageSize: json["pageSize"],
    // totalRecords: json["totalRecords"],
    // createdBy: json["createdBy"],
    // createdOn: DateTime.parse(json["createdOn"]),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: DateTime.parse(json["modifiedOn"]),
    isActive: json["isActive"] ?? false,
    // isDeleted: json["isDeleted"],
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  /*Map<String, dynamic> toJson() => {
    "companyId": companyId,
    "companyName": companyName,
    "companyTypeId": companyTypeId,
    "phone": phone,
    "phone2": phone2,
    "fax": fax,
    "website": website,
    "email": emailValues.reverse[email],
    "companyType": companyType,
    "customerId": customerId,
    "customer": customer,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "totalRecords": totalRecords,
    "createdBy": createdBy,
    "createdOn": createdOn.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn.toIso8601String(),
    "isActive": isActive,
    "isDeleted": isDeleted,
    "createdUser": createdUser,
    "modifiedUser": modifiedUser,
  };*/
}

