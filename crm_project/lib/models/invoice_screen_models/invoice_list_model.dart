// To parse this JSON data, do
//
//     final invoiceListModel = invoiceListModelFromJson(jsonString);

import 'dart:convert';

InvoiceListModel invoiceListModelFromJson(String str) => InvoiceListModel.fromJson(json.decode(str));

String invoiceListModelToJson(InvoiceListModel data) => json.encode(data.toJson());

class InvoiceListModel {
  int statusCode;
  Data data;

  InvoiceListModel({
    required this.statusCode,
    required this.data,
  });

  factory InvoiceListModel.fromJson(Map<String, dynamic> json) => InvoiceListModel(
    statusCode: json["statusCode"]??0,
    data: Data.fromJson(json["data"]??{}),
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
  List<InvoiceListData> data;
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
    data: List<InvoiceListData>.from((json["data"]??{}).map((x) => InvoiceListData.fromJson(x))),
    succeeded: json["succeeded"]??'',
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

class InvoiceListData {
  int invoiceId;
  int companyId;
  // dynamic company;
  String billingAddress;
  int shipCompanyId;
  // dynamic shipCompany;
  String shippingAddress;
  DateTime invoiceDate;
  DateTime dueDate;
  bool paid;
  bool invoicePrinted;
  double totalAmount;
  // dynamic contactId;
  // dynamic contact;
  String reference;
  String mailAddress;
  // dynamic subtotalAmount;
  // dynamic parentId;
  // dynamic propertyId;
  // dynamic property;
  // dynamic campaignId;
  // dynamic campaign;
  // dynamic workOrderId;
  // dynamic workOrder;
  // dynamic leaseId;
  // dynamic lease;
  // dynamic propertyManagementId;
  // dynamic propertyManagement;
  // dynamic leasePaymentId;
  // dynamic prospectId;
  // dynamic prospect;
  String type;
  // dynamic invoiceItems;
  // dynamic accountLedgers;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  DateTime createdOn;
  // dynamic modifiedBy;
  DateTime? modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  InvoiceListData({
    required this.invoiceId,
    required this.companyId,
    // this.company,
    required this.billingAddress,
    required this.shipCompanyId,
    // this.shipCompany,
    required this.shippingAddress,
    required this.invoiceDate,
    required this.dueDate,
    required this.paid,
    required this.invoicePrinted,
    required this.totalAmount,
    // this.contactId,
    // this.contact,
    required this.reference,
    required this.mailAddress,
    // this.subtotalAmount,
    // this.parentId,
    // this.propertyId,
    // this.property,
    // this.campaignId,
    // this.campaign,
    // this.workOrderId,
    // this.workOrder,
    // this.leaseId,
    // this.lease,
    // this.propertyManagementId,
    // this.propertyManagement,
    // this.leasePaymentId,
    // this.prospectId,
    // this.prospect,
    required this.type,
    // this.invoiceItems,
    // this.accountLedgers,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory InvoiceListData.fromJson(Map<String, dynamic> json) => InvoiceListData(
    invoiceId: json["invoiceID"]??0,
    companyId: json["companyID"]??0,
    // company: json["company"],
    billingAddress: json["billingAddress"]??'',
    shipCompanyId: json["shipCompanyID"]??0,
    // shipCompany: json["shipCompany"],
    shippingAddress: json["shippingAddress"]??'',
    invoiceDate: DateTime.parse(json["invoiceDate"]??DateTime.now().toString()),
    dueDate: DateTime.parse(json["dueDate"]??DateTime.now().toString()),
    paid: json["paid"]??false,
    invoicePrinted: json["invoicePrinted"]??false,
    totalAmount: json["totalAmount"]??0.0,
    // contactId: json["contactID"],
    // contact: json["contact"],
    reference: json["reference"]??'',
    mailAddress: json["mailAddress"]??'',
    // subtotalAmount: json["subtotalAmount"],
    // parentId: json["parentID"],
    // propertyId: json["propertyID"],
    // property: json["property"],
    // campaignId: json["campaignID"],
    // campaign: json["campaign"],
    // workOrderId: json["workOrderID"],
    // workOrder: json["workOrder"],
    // leaseId: json["leaseID"],
    // lease: json["lease"],
    // propertyManagementId: json["propertyManagementID"],
    // propertyManagement: json["propertyManagement"],
    // leasePaymentId: json["leasePaymentID"],
    // prospectId: json["prospectID"],
    // prospect: json["prospect"],
    type: json["type"]??'',
    // invoiceItems: json["invoiceItems"],
    // accountLedgers: json["accountLedgers"],
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now()),
    // modifiedBy: json["modifiedBy"],
    modifiedOn: DateTime.parse(json["modifiedOn"]??DateTime.now().toString()),
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "invoiceID": invoiceId,
    "companyID": companyId,
    // "company": company,
    "billingAddress": billingAddress,
    "shipCompanyID": shipCompanyId,
    // "shipCompany": shipCompany,
    "shippingAddress": shippingAddress,
    "invoiceDate": invoiceDate,
    "dueDate": dueDate,
    "paid": paid,
    "invoicePrinted": invoicePrinted,
    "totalAmount": totalAmount,
    // "contactID": contactId,
    // "contact": contact,
    "reference": reference,
    "mailAddress": mailAddress,
    // "subtotalAmount": subtotalAmount,
    // "parentID": parentId,
    // "propertyID": propertyId,
    // "property": property,
    // "campaignID": campaignId,
    // "campaign": campaign,
    // "workOrderID": workOrderId,
    // "workOrder": workOrder,
    // "leaseID": leaseId,
    // "lease": lease,
    // "propertyManagementID": propertyManagementId,
    // "propertyManagement": propertyManagement,
    // "leasePaymentID": leasePaymentId,
    // "prospectID": prospectId,
    // "prospect": prospect,
    "type": type,
    // "invoiceItems": invoiceItems,
    // "accountLedgers": accountLedgers,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "totalRecords": totalRecords,
    "createdBy": createdBy,
    "createdOn": createdOn,
    // "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "isActive": isActive,
    "isDeleted": isDeleted,
    // "createdUser": createdUser,
    // "modifiedUser": modifiedUser,
  };
}
