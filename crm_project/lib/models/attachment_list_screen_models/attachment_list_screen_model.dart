// To parse this JSON data, do
//
//     final attachmentListModel = attachmentListModelFromJson(jsonString);

import 'dart:convert';

AttachmentListModel attachmentListModelFromJson(String str) => AttachmentListModel.fromJson(json.decode(str));

String attachmentListModelToJson(AttachmentListModel data) => json.encode(data.toJson());

class AttachmentListModel {
  int statusCode;
  Data data;

  AttachmentListModel({
    required this.statusCode,
    required this.data,
  });

  factory AttachmentListModel.fromJson(Map<String, dynamic> json) => AttachmentListModel(
    statusCode: json["statusCode"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data.toJson(),
  };
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
  List<AttachmentDetails> data;
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
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    // firstPage: json["firstPage"],
    // lastPage: json["lastPage"],
    totalPages: json["totalPages"]??0,
    totalRecords: json["totalRecords"]??0,
    // nextPage: json["nextPage"],
    // previousPage: json["previousPage"],
    data: List<AttachmentDetails>.from((json["data"]??{}).map((x) => AttachmentDetails.fromJson(x))),
    succeeded: json["succeeded"]??false,
    // errors: json["errors"],
    // message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    // "firstPage": firstPage,
    // "lastPage": lastPage,
    "totalPages": totalPages,
    "totalRecords": totalRecords,
    // "nextPage": nextPage,
    // "previousPage": previousPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "succeeded": succeeded,
    // "errors": errors,
    // "message": message,
  };
}

class AttachmentDetails {
  int attachmentId;
  // dynamic contactId;
  // dynamic contact;
  int attachmentTypeId;
  AttachmentType attachmentType;
  String description;
  String attachmentPath;
  int parentId;
  // dynamic propertyId;
  // dynamic property;
  int companyId;
  // dynamic company;
  // dynamic offerId;
  // dynamic offer;
  // dynamic legalId;
  // dynamic legal;
  // dynamic workOrderId;
  // dynamic workOrder;
  // dynamic prospectId;
  // dynamic prospect;
  // dynamic mortgageId;
  // dynamic mortgage;
  String attachmentDb;
  // dynamic propertyManagementId;
  // dynamic propertyManagement;
  String type;
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

  AttachmentDetails({
    required this.attachmentId,
    // this.contactId,
    // this.contact,
    required this.attachmentTypeId,
    required this.attachmentType,
    required this.description,
    required this.attachmentPath,
    required this.parentId,
    // this.propertyId,
    // this.property,
    required this.companyId,
    // this.company,
    // this.offerId,
    // this.offer,
    // this.legalId,
    // this.legal,
    // this.workOrderId,
    // this.workOrder,
    // this.prospectId,
    // this.prospect,
    // this.mortgageId,
    // this.mortgage,
    required this.attachmentDb,
    // this.propertyManagementId,
    // this.propertyManagement,
    required this.type,
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

  factory AttachmentDetails.fromJson(Map<String, dynamic> json) => AttachmentDetails(
    attachmentId: json["attachmentID"]??0,
    // contactId: json["contactID"],
    // contact: json["contact"],
    attachmentTypeId: json["attachmentTypeId"]??0,
    attachmentType: AttachmentType.fromJson(json["attachmentType"]??{}),
    description: json["description"]??'',
    attachmentPath: json["attachmentPath"]??'',
    parentId: json["parentID"]??0,
    // propertyId: json["propertyID"],
    // property: json["property"],
    companyId: json["companyID"]??0,
    // company: json["company"],
    // offerId: json["offerID"],
    // offer: json["offer"],
    // legalId: json["legalID"],
    // legal: json["legal"],
    // workOrderId: json["workOrderId"],
    // workOrder: json["workOrder"],
    // prospectId: json["prospectID"],
    // prospect: json["prospect"],
    // mortgageId: json["mortgageID"],
    // mortgage: json["mortgage"],
    attachmentDb: json["attachmentDB"]??'',
    // propertyManagementId: json["propertyManagementID"],
    // propertyManagement: json["propertyManagement"],
    type: json["type"]??'',
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "attachmentID": attachmentId,
    // "contactID": contactId,
    // "contact": contact,
    "attachmentTypeId": attachmentTypeId,
    "attachmentType": attachmentType.toJson(),
    "description": description,
    "attachmentPath": attachmentPath,
    "parentID": parentId,
    // "propertyID": propertyId,
    // "property": property,
    "companyID": companyId,
    // "company": company,
    // "offerID": offerId,
    // "offer": offer,
    // "legalID": legalId,
    // "legal": legal,
    // "workOrderId": workOrderId,
    // "workOrder": workOrder,
    // "prospectID": prospectId,
    // "prospect": prospect,
    // "mortgageID": mortgageId,
    // "mortgage": mortgage,
    "attachmentDB": attachmentDb,
    // "propertyManagementID": propertyManagementId,
    // "propertyManagement": propertyManagement,
    "type": type,
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

class AttachmentType {
  int attachmentTypeId;
  String attachmentTypes;
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

  AttachmentType({
    required this.attachmentTypeId,
    required this.attachmentTypes,
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

  factory AttachmentType.fromJson(Map<String, dynamic> json) => AttachmentType(
    attachmentTypeId: json["attachmentTypeId"]??0,
    attachmentTypes: json["attachmentTypes"]??'',
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "attachmentTypeId": attachmentTypeId,
    "attachmentTypes": attachmentTypes,
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
