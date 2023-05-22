import 'dart:convert';

CompanyListModel companyListModelFromJson(String str) => CompanyListModel.fromJson(json.decode(str));

String companyListModelToJson(CompanyListModel data) => json.encode(data.toJson());

class CompanyListModel {
  int statusCode;
  Data data;

  CompanyListModel({
    required this.statusCode,
    required this.data,
  });

  factory CompanyListModel.fromJson(Map<String, dynamic> json) => CompanyListModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data.toJson(),
  };
}

class Data {
  int pageNumber;
  int pageSize;
  String firstPage;
  String lastPage;
  int totalPages;
  int totalRecords;
  String nextPage;
  String previousPage;
  List<CompanyData> data;
  bool succeeded;
  String errors;
  String message;

  Data({
    required this.pageNumber,
    required this.pageSize,
    required this.firstPage,
    required this.lastPage,
    required this.totalPages,
    required this.totalRecords,
    required this.nextPage,
    required this.previousPage,
    required this.data,
    required this.succeeded,
    required this.errors,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pageNumber: json["pageNumber"] ?? 0,
    pageSize: json["pageSize"] ?? 0,
    firstPage: json["firstPage"].toString(),
    lastPage: json["lastPage"].toString(),
    totalPages: json["totalPages"] ?? 0,
    totalRecords: json["totalRecords"] ?? 0,
    nextPage: json["nextPage"].toString(),
    previousPage: json["previousPage"].toString(),
    data: List<CompanyData>.from((json["data"] ?? []).map((x) => CompanyData.fromJson(x ?? {}))),
    succeeded: json["succeeded"] ?? false,
    errors: json["errors"].toString(),
    message: json["message"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "firstPage": firstPage,
    "lastPage": lastPage,
    "totalPages": totalPages,
    "totalRecords": totalRecords,
    "nextPage": nextPage,
    "previousPage": previousPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "succeeded": succeeded,
    "errors": errors,
    "message": message,
  };
}

class CompanyData {
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
  // DateTime createdOn;
  // dynamic modifiedBy;
  // DateTime modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  CompanyData({
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
    // required this.createdOn,
    // this.modifiedBy,
    // required this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) => CompanyData(
    companyId: json["companyId"] ?? 0,
    companyName: json["companyName"] ?? "",
    companyTypeId: json["companyTypeId"] ?? 0,
    phone: json["phone"] ?? "",
    phone2: json["phone2"] ?? "",
    fax: json["fax"] ?? "",
    website: json["website"] ?? "",
    email: json["email"] ?? "",
    companyType: CompanyType.fromJson(json["companyType"] ?? {}),
    customerId: json["customerId"] ?? 0,
    // customer: json["customer"],
    pageNumber: json["pageNumber"] ?? 0,
    pageSize: json["pageSize"] ?? 0,
    totalRecords: json["totalRecords"] ?? 0,
    createdBy: json["createdBy"] ?? "",
    // createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: DateTime.parse(json["modifiedOn"] ?? DateTime.now()),
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
    // "createdOn": createdOn.toIso8601String(),
    // "modifiedBy": modifiedBy,
    // "modifiedOn": modifiedOn.toIso8601String(),
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
  // String customer;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  // DateTime createdOn;
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
    // required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory CompanyType.fromJson(Map<String, dynamic> json) => CompanyType(
    companyTypeId: json["companyTypeId"] ?? 0,
    companyTypes: json["companyTypes"] ?? "",
    customerId: json["customerId"] ?? 0,
    // customer: json["customer"],
    pageNumber: json["pageNumber"] ?? 0,
    pageSize: json["pageSize"] ?? 0,
    totalRecords: json["totalRecords"] ?? 0,
    createdBy: json["createdBy"] ?? "",
    // createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
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
    // "createdOn": createdOn.toIso8601String(),
    // "modifiedBy": modifiedBy,
    // "modifiedOn": modifiedOn,
    "isActive": isActive,
    "isDeleted": isDeleted,
    // "createdUser": createdUser,
    // "modifiedUser": modifiedUser,
  };
}
