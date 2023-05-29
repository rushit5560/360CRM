import 'dart:convert';

BillListModel billListModelFromJson(String str) => BillListModel.fromJson(json.decode(str));

// String billListModelToJson(BillListModel data) => json.encode(data.toJson());

class BillListModel {
  int statusCode;
  Data data;

  BillListModel({
    required this.statusCode,
    required this.data,
  });

  factory BillListModel.fromJson(Map<String, dynamic> json) => BillListModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

}

class Data {
  // int pageNumber;
  // int pageSize;
  // dynamic firstPage;
  // dynamic lastPage;
  // int totalPages;
  // int totalRecords;
  // dynamic nextPage;
  // dynamic previousPage;
  List<BillData> data;
  // bool succeeded;
  // dynamic errors;
  // dynamic message;

  Data({
    // this.pageNumber,
    // this.pageSize,
    // this.firstPage,
    // this.lastPage,
    // this.totalPages,
    // this.totalRecords,
    // this.nextPage,
    // this.previousPage,
    required this.data,
    // this.succeeded,
    // this.errors,
    // this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    // pageNumber: json["pageNumber"],
    // pageSize: json["pageSize"],
    // firstPage: json["firstPage"],
    // lastPage: json["lastPage"],
    // totalPages: json["totalPages"],
    // totalRecords: json["totalRecords"],
    // nextPage: json["nextPage"],
    // previousPage: json["previousPage"],
    data: List<BillData>.from((json["data"] ?? []).map((x) => BillData.fromJson(x ?? {}))),
    // succeeded: json["succeeded"],
    // errors: json["errors"],
    // message: json["message"],
  );

}

class BillData {
  int billId;
  // int companyId;
  // dynamic company;
  // dynamic contactId;
  // dynamic contact;
  // int propertyId;
  // dynamic property;
  String reference;
  DateTime billDate;
  DateTime dueDate;
  // String address;
  String totalAmount;
  // bool paid;
  // dynamic parentId;
  // dynamic campaignId;
  // dynamic campaign;
  // dynamic workOrderId;
  // dynamic workOrder;
  // dynamic leaseId;
  // dynamic lease;
  // dynamic mortgageId;
  // dynamic mortgage;
  // dynamic mortgagePaymentId;
  // dynamic legalId;
  // dynamic legal;
  // dynamic propertyManagementId;
  // dynamic propertyManagement;
  // dynamic prospectId;
  // dynamic prospect;
  // String type;
  // dynamic billItem;
  // dynamic payments;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  BillData({
    required this.billId,
    // this.companyId,
    // this.company,
    // this.contactId,
    // this.contact,
    // this.propertyId,
    // this.property,
    required this.reference,
    required this.billDate,
    required this.dueDate,
    // this.address,
    required this.totalAmount,
    // this.paid,
    // this.parentId,
    // this.campaignId,
    // this.campaign,
    // this.workOrderId,
    // this.workOrder,
    // this.leaseId,
    // this.lease,
    // this.mortgageId,
    // this.mortgage,
    // this.mortgagePaymentId,
    // this.legalId,
    // this.legal,
    // this.propertyManagementId,
    // this.propertyManagement,
    // this.prospectId,
    // this.prospect,
    // this.type,
    // this.billItem,
    // this.payments,
    // this.pageNumber,
    // this.pageSize,
    // this.totalRecords,
    // this.createdBy,
    // this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    // this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory BillData.fromJson(Map<String, dynamic> json) => BillData(
    billId: json["billID"],
    // companyId: json["companyID"],
    // company: json["company"],
    // contactId: json["contactID"],
    // contact: json["contact"],
    // propertyId: json["propertyID"],
    // property: json["property"],
    reference: json["reference"],
    billDate: DateTime.parse(json["billDate"]),
    dueDate: DateTime.parse(json["dueDate"]),
    // address: json["address"],
    totalAmount: (json["totalAmount"] ?? 0.0).toString(),
    // paid: json["paid"],
    // parentId: json["parentID"],
    // campaignId: json["campaignID"],
    // campaign: json["campaign"],
    // workOrderId: json["workOrderID"],
    // workOrder: json["workOrder"],
    // leaseId: json["leaseID"],
    // lease: json["lease"],
    // mortgageId: json["mortgageID"],
    // mortgage: json["mortgage"],
    // mortgagePaymentId: json["mortgagePaymentID"],
    // legalId: json["legalID"],
    // legal: json["legal"],
    // propertyManagementId: json["propertyManagementID"],
    // propertyManagement: json["propertyManagement"],
    // prospectId: json["prospectID"],
    // prospect: json["prospect"],
    // type: json["type"],
    // billItem: json["billItem"],
    // payments: json["payments"],
    // pageNumber: json["pageNumber"],
    // pageSize: json["pageSize"],
    // totalRecords: json["totalRecords"],
    // createdBy: json["createdBy"],
    // createdOn: DateTime.parse(json["createdOn"]),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"] ?? false,
    // isDeleted: json["isDeleted"],
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

}
