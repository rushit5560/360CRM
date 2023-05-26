import 'dart:convert';

LedgerListModel ledgerListModelFromJson(String str) => LedgerListModel.fromJson(json.decode(str));

String ledgerListModelToJson(LedgerListModel data) => json.encode(data.toJson());

class LedgerListModel {
  int statusCode;
  Data data;

  LedgerListModel({
    required this.statusCode,
    required this.data,
  });

  factory LedgerListModel.fromJson(Map<String, dynamic> json) => LedgerListModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": data.toJson(),
  };
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
  List<LedgerData> data;
  // bool succeeded;
  String errors;
  String message;

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
    required this.errors,
    required this.message,
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
    data: List<LedgerData>.from((json["data"] ?? []).map((x) => LedgerData.fromJson(x ?? {}))),
    // succeeded: json["succeeded"],
    errors: json["errors"] ?? "",
    message: json["message"] ?? "",
  );

}

class LedgerData {
  int accountLedgerId;
  // int companyId;
  // Company company;
  // dynamic contactId;
  // dynamic contact;
  // int propertyId;
  // dynamic property;
  // dynamic campaignId;
  // dynamic campaign;
  // dynamic legalId;
  // dynamic legal;
  // dynamic propertyManagementId;
  // dynamic propertyManagement;
  // dynamic prospectId;
  // dynamic prospect;
  // dynamic mortgageId;
  // dynamic mortgage;
  // String type;
  // dynamic entryId;
  String amount;
  // dynamic transactionDate;
  String ledgerType;
  // int accountCategoryId;
  AccountCategory accountCategory;
  String reference;
  String details;
  // dynamic parentId;
  // int workOrderId;
  // WorkOrder workOrder;
  // dynamic leaseId;
  // dynamic lease;
  // dynamic billId;
  // dynamic bill;
  // dynamic invoiceId;
  // dynamic invoice;
  // dynamic paymentId;
  DateTime ledgerDate;
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

  LedgerData({
    required this.accountLedgerId,
    // this.companyId,
    // this.company,
    // this.contactId,
    // this.contact,
    // this.propertyId,
    // this.property,
    // this.campaignId,
    // this.campaign,
    // this.legalId,
    // this.legal,
    // this.propertyManagementId,
    // this.propertyManagement,
    // this.prospectId,
    // this.prospect,
    // this.mortgageId,
    // this.mortgage,
    // this.type,
    // this.entryId,
    required this.amount,
    // this.transactionDate,
    required this.ledgerType,
    // this.accountCategoryId,
    required this.accountCategory,
    required this.reference,
    required this.details,
    // this.parentId,
    // this.workOrderId,
    // this.workOrder,
    // this.leaseId,
    // this.lease,
    // this.billId,
    // this.bill,
    // this.invoiceId,
    // this.invoice,
    // this.paymentId,
    required this.ledgerDate,
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

  factory LedgerData.fromJson(Map<String, dynamic> json) => LedgerData(
    accountLedgerId: json["accountLedgerID"],
    // companyId: json["companyID"],
    // company: Company.fromJson(json["company"]),
    // contactId: json["contactID"],
    // contact: json["contact"],
    // propertyId: json["propertyID"],
    // property: json["property"],
    // campaignId: json["campaignID"],
    // campaign: json["campaign"],
    // legalId: json["legalID"],
    // legal: json["legal"],
    // propertyManagementId: json["propertyManagementID"],
    // propertyManagement: json["propertyManagement"],
    // prospectId: json["prospectID"],
    // prospect: json["prospect"],
    // mortgageId: json["mortgageID"],
    // mortgage: json["mortgage"],
    // type: json["type"],
    // entryId: json["entryID"],
    amount: (json["amount"] ?? 0.0).toString(),
    // transactionDate: json["transactionDate"],
    ledgerType: json["ledgerType"] ?? "",
    // accountCategoryId: json["accountCategoryID"],
    accountCategory: AccountCategory.fromJson(json["accountCategory"] ?? {}),
    reference: json["reference"] ?? "",
    details: json["details"] ?? "",
    // parentId: json["parentID"],
    // workOrderId: json["workOrderId"],
    // workOrder: WorkOrder.fromJson(json["workOrder"]),
    // leaseId: json["leaseID"],
    // lease: json["lease"],
    // billId: json["billID"],
    // bill: json["bill"],
    // invoiceId: json["invoiceID"],
    // invoice: json["invoice"],
    // paymentId: json["paymentID"],
    ledgerDate: DateTime.parse(json["ledgerDate"] ?? DateTime.now()),
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

class AccountCategory {
  // int accountCategoryId;
  String category;
  // int customerId;
  // dynamic customer;
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

  AccountCategory({
    // this.accountCategoryId,
    required this.category,
    // this.customerId,
    // this.customer,
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

  factory AccountCategory.fromJson(Map<String, dynamic> json) => AccountCategory(
    // accountCategoryId: json["accountCategoryId"],
    category: json["category"] ?? "",
    // customerId: json["customerId"],
    // customer: json["customer"],
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

/*class Company {
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
  dynamic createdBy;
  DateTime createdOn;
  dynamic modifiedBy;
  DateTime modifiedOn;
  bool isActive;
  bool isDeleted;
  dynamic createdUser;
  dynamic modifiedUser;

  Company({
    this.companyId,
    this.companyName,
    this.companyTypeId,
    this.phone,
    this.phone2,
    this.fax,
    this.website,
    this.email,
    this.companyType,
    this.customerId,
    this.customer,
    this.pageNumber,
    this.pageSize,
    this.totalRecords,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.isActive,
    this.isDeleted,
    this.createdUser,
    this.modifiedUser,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
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
    modifiedOn: DateTime.parse(json["modifiedOn"]),
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    createdUser: json["createdUser"],
    modifiedUser: json["modifiedUser"],
  );

}*/

/*class WorkOrder {
  int workOrderId;
  DateTime workOrderDate;
  int workOrderStatusId;
  dynamic workOrderStatus;
  String workOrderDetails;
  int propertyId;
  dynamic property;
  int companyId;
  dynamic company;
  DateTime projectStartDate;
  DateTime projectDueDate;
  DateTime completeDate;
  int perDiemPenalty;
  int perDiemBonus;
  int projectedCost;
  int unit;
  int budget;
  int actualCost;
  int percentOfBudget;
  int costOverRuns;
  dynamic parentId;
  int workOrderTypeId;
  dynamic workOrderType;
  String specialTerms;
  dynamic contractorVerification;
  int customerId;
  dynamic customer;
  String type;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  DateTime createdOn;
  dynamic modifiedBy;
  DateTime modifiedOn;
  bool isActive;
  bool isDeleted;
  dynamic createdUser;
  dynamic modifiedUser;

  WorkOrder({
    this.workOrderId,
    this.workOrderDate,
    this.workOrderStatusId,
    this.workOrderStatus,
    this.workOrderDetails,
    this.propertyId,
    this.property,
    this.companyId,
    this.company,
    this.projectStartDate,
    this.projectDueDate,
    this.completeDate,
    this.perDiemPenalty,
    this.perDiemBonus,
    this.projectedCost,
    this.unit,
    this.budget,
    this.actualCost,
    this.percentOfBudget,
    this.costOverRuns,
    this.parentId,
    this.workOrderTypeId,
    this.workOrderType,
    this.specialTerms,
    this.contractorVerification,
    this.customerId,
    this.customer,
    this.type,
    this.pageNumber,
    this.pageSize,
    this.totalRecords,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.isActive,
    this.isDeleted,
    this.createdUser,
    this.modifiedUser,
  });

  factory WorkOrder.fromJson(Map<String, dynamic> json) => WorkOrder(
    workOrderId: json["workOrderID"],
    workOrderDate: DateTime.parse(json["workOrderDate"]),
    workOrderStatusId: json["workOrderStatusID"],
    workOrderStatus: json["workOrderStatus"],
    workOrderDetails: json["workOrderDetails"],
    propertyId: json["propertyID"],
    property: json["property"],
    companyId: json["companyID"],
    company: json["company"],
    projectStartDate: DateTime.parse(json["projectStartDate"]),
    projectDueDate: DateTime.parse(json["projectDueDate"]),
    completeDate: DateTime.parse(json["completeDate"]),
    perDiemPenalty: json["perDiemPenalty"],
    perDiemBonus: json["perDiemBonus"],
    projectedCost: json["projectedCost"],
    unit: json["unit"],
    budget: json["budget"],
    actualCost: json["actualCost"],
    percentOfBudget: json["percentOfBudget"],
    costOverRuns: json["costOverRuns"],
    parentId: json["parentID"],
    workOrderTypeId: json["workOrderTypeID"],
    workOrderType: json["workOrderType"],
    specialTerms: json["specialTerms"],
    contractorVerification: json["contractorVerification"],
    customerId: json["customerId"],
    customer: json["customer"],
    type: json["type"],
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    totalRecords: json["totalRecords"],
    createdBy: json["createdBy"],
    createdOn: DateTime.parse(json["createdOn"]),
    modifiedBy: json["modifiedBy"],
    modifiedOn: DateTime.parse(json["modifiedOn"]),
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    createdUser: json["createdUser"],
    modifiedUser: json["modifiedUser"],
  );

}*/
