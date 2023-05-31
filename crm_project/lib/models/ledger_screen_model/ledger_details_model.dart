import 'dart:convert';

LedgerDetailsGetByIdModel ledgerDetailsGetByIdModelFromJson(String str) => LedgerDetailsGetByIdModel.fromJson(json.decode(str));

// String ledgerDetailsGetByIdModelToJson(LedgerDetailsGetByIdModel data) => json.encode(data.toJson());

class LedgerDetailsGetByIdModel {
  int statusCode;
  Data data;

  LedgerDetailsGetByIdModel({
    required this.statusCode,
    required this.data,
  });

  factory LedgerDetailsGetByIdModel.fromJson(Map<String, dynamic> json) => LedgerDetailsGetByIdModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

}

class Data {
  int accountLedgerId;
  int companyId;
  Company company;
  String contactId;
  // dynamic contact;
  // int propertyId;
  Property property;
  String campaignId;
  // dynamic campaign;
  // dynamic legalId;
  // dynamic legal;
  String propertyManagementId;
  // dynamic propertyManagement;
  String prospectId;
  // dynamic prospect;
  String mortgageId;
  // dynamic mortgage;
  // String type;
  // dynamic entryId;
  String amount;
  // dynamic transactionDate;
  String ledgerType;
  int accountCategoryId;
  AccountCategory accountCategory;
  String reference;
  String details;
  // dynamic parentId;
  // int workOrderId;
  WorkOrder workOrder;
  String leaseId;
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
  // DateTime modifiedOn;
  bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  Data({
    required this.accountLedgerId,
    required this.companyId,
    required this.company,
    required this.contactId,
    // this.contact,
    // this.propertyId,
    required this.property,
    required this.campaignId,
    // this.campaign,
    // this.legalId,
    // this.legal,
    required this.propertyManagementId,
    // this.propertyManagement,
    required this.prospectId,
    // this.prospect,
    required this.mortgageId,
    // this.mortgage,
    // this.type,
    // this.entryId,
    required this.amount,
    // this.transactionDate,
    required this.ledgerType,
    required this.accountCategoryId,
    required this.accountCategory,
    required this.reference,
    required this.details,
    // this.parentId,
    // this.workOrderId,
    required this.workOrder,
    required this.leaseId,
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accountLedgerId: json["accountLedgerID"] ?? 0,
    companyId: json["companyID"] ?? 0,
    company: Company.fromJson(json["company"] ?? {}),
    contactId: (json["contactID"] ?? 0).toString(),
    // contact: json["contact"],
    // propertyId: json["propertyID"],
    property: Property.fromJson(json["property"] ?? {}),
    campaignId: (json["campaignID"] ?? 0).toString(),
    // campaign: json["campaign"],
    // legalId: json["legalID"],
    // legal: json["legal"],
    propertyManagementId: (json["propertyManagementID"] ?? 0).toString(),
    // propertyManagement: json["propertyManagement"],
    prospectId: (json["prospectID"] ?? 0).toString(),
    // prospect: json["prospect"],
    mortgageId: (json["mortgageID"] ?? 0).toString(),
    // mortgage: json["mortgage"],
    // type: json["type"],
    // entryId: json["entryID"],
    amount: (json["amount"] ?? 0.0).toString(),
    // transactionDate: json["transactionDate"],
    ledgerType: json["ledgerType"] ?? "",
    accountCategoryId: json["accountCategoryID"] ?? 0,
    accountCategory: json["accountCategory"] == null ? AccountCategory.fromJson({}) : AccountCategory.fromJson(json["accountCategory"] ?? {}),
    reference: json["reference"] ?? "",
    details: json["details"] ?? "",
    // parentId: json["parentID"],
    // workOrderId: json["workOrderId"],
    workOrder: json["workOrder"] == null ? WorkOrder.fromJson({}) : WorkOrder.fromJson(json["workOrder"] ?? ""),
    leaseId: (json["leaseID"] ?? 0).toString(),
    // lease: json["lease"],
    // billId: json["billID"],
    // bill: json["bill"],
    // invoiceId: json["invoiceID"],
    // invoice: json["invoice"],
    // paymentId: json["paymentID"],
    ledgerDate: DateTime.parse(json["ledgerDate"] ?? ""),
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


}

class AccountCategory {
  int accountCategoryId;
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
    required this.accountCategoryId,
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
    accountCategoryId: json["accountCategoryId"] ?? 0,
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

class Company {
  int companyId;
  String companyName;
  // int companyTypeId;
  // String phone;
  // String phone2;
  // String fax;
  // String website;
  // String email;
  // dynamic companyType;
  // int customerId;
  // dynamic customer;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // dynamic createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // DateTime modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  Company({
    required this.companyId,
    required this.companyName,
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
    // this.isActive,
    // this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    companyId: json["companyId"] ?? 0,
    companyName: json["companyName"] ?? "",
    // companyTypeId: json["companyTypeId"],
    // phone: json["phone"],
    // phone2: json["phone2"],
    // fax: json["fax"],
    // website: json["website"],
    // email: json["email"],
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
    // isActive: json["isActive"],
    // isDeleted: json["isDeleted"],
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

}

class Property {
  int propertyId;
  String propertyName;
  // String address;
  // String unitNumber;
  // int cityId;
  // dynamic city;
  // int stateId;
  // dynamic state;
  // String zip;
  // int prospectId;
  // dynamic prospect;
  // int propertyTypeId;
  // dynamic propertyType;
  // int propertyStatusId;
  // dynamic propertyStatus;
  // String unitType;
  // bool rented;
  // int customerId;
  // dynamic customer;
  // dynamic activityId;
  // dynamic activity;
  // dynamic checkListId;
  // dynamic checkList;
  // dynamic documentTemplateId;
  // dynamic documentTemplate;
  // String lotSize;
  // String stories;
  // String parking;
  // bool garage;
  // dynamic garageTypeId;
  // dynamic garageType;
  // String bedrooms;
  // String bathrooms;
  // String numberRooms;
  // String squareFeet;
  // String propertyLot;
  // String propertyBlock;
  // String propertyTaxNumber;
  // dynamic purchasePrice;
  // dynamic askingPrice;
  // dynamic offerPrice;
  // dynamic anticipatedArv;
  // dynamic afterRepairValue;
  // dynamic arvPercent;
  // bool onLockbox;
  // String combination;
  // dynamic monthlyPayment;
  // dynamic interestRate;
  // dynamic annualTaxes;
  // dynamic taxYear;
  // dynamic outstandingTaxes;
  // dynamic currentYearExpenses;
  // dynamic insurance;
  // dynamic parentId;
  // dynamic appraisalAmount;
  // dynamic appraisalDate;
  // dynamic appraisalOrderDate;
  // String numberOfUnits;
  // String referralSource;
  // dynamic currentValue;
  // dynamic escrowBalance;
  // dynamic expectedPayoffDate;
  // dynamic listingExpiration;
  // dynamic netRealizableValue;
  // dynamic payoffGoodThrough;
  // dynamic propertyManagerFees;
  // dynamic realEstateAgent;
  // String realatorCommission;
  // dynamic secured;
  // dynamic taxesOwed;
  // String comments;
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

  Property({
    required this.propertyId,
    required this.propertyName,
    // this.address,
    // this.unitNumber,
    // this.cityId,
    // this.city,
    // this.stateId,
    // this.state,
    // this.zip,
    // this.prospectId,
    // this.prospect,
    // this.propertyTypeId,
    // this.propertyType,
    // this.propertyStatusId,
    // this.propertyStatus,
    // this.unitType,
    // this.rented,
    // this.customerId,
    // this.customer,
    // this.activityId,
    // this.activity,
    // this.checkListId,
    // this.checkList,
    // this.documentTemplateId,
    // this.documentTemplate,
    // this.lotSize,
    // this.stories,
    // this.parking,
    // this.garage,
    // this.garageTypeId,
    // this.garageType,
    // this.bedrooms,
    // this.bathrooms,
    // this.numberRooms,
    // this.squareFeet,
    // this.propertyLot,
    // this.propertyBlock,
    // this.propertyTaxNumber,
    // this.purchasePrice,
    // this.askingPrice,
    // this.offerPrice,
    // this.anticipatedArv,
    // this.afterRepairValue,
    // this.arvPercent,
    // this.onLockbox,
    // this.combination,
    // this.monthlyPayment,
    // this.interestRate,
    // this.annualTaxes,
    // this.taxYear,
    // this.outstandingTaxes,
    // this.currentYearExpenses,
    // this.insurance,
    // this.parentId,
    // this.appraisalAmount,
    // this.appraisalDate,
    // this.appraisalOrderDate,
    // this.numberOfUnits,
    // this.referralSource,
    // this.currentValue,
    // this.escrowBalance,
    // this.expectedPayoffDate,
    // this.listingExpiration,
    // this.netRealizableValue,
    // this.payoffGoodThrough,
    // this.propertyManagerFees,
    // this.realEstateAgent,
    // this.realatorCommission,
    // this.secured,
    // this.taxesOwed,
    // this.comments,
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

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    propertyId: json["propertyId"] ?? 0,
    propertyName: json["propertyName"] ?? "",
    // address: json["address"],
    // unitNumber: json["unitNumber"],
    // cityId: json["cityId"],
    // city: json["city"],
    // stateId: json["stateId"],
    // state: json["state"],
    // zip: json["zip"],
    // prospectId: json["prospectID"],
    // prospect: json["prospect"],
    // propertyTypeId: json["propertyTypeID"],
    // propertyType: json["propertyType"],
    // propertyStatusId: json["propertyStatusID"],
    // propertyStatus: json["propertyStatus"],
    // unitType: json["unitType"],
    // rented: json["rented"],
    // customerId: json["customerId"],
    // customer: json["customer"],
    // activityId: json["activityID"],
    // activity: json["activity"],
    // checkListId: json["checkListId"],
    // checkList: json["checkList"],
    // documentTemplateId: json["documentTemplateId"],
    // documentTemplate: json["documentTemplate"],
    // lotSize: json["lotSize"],
    // stories: json["stories"],
    // parking: json["parking"],
    // garage: json["garage"],
    // garageTypeId: json["garageTypeID"],
    // garageType: json["garageType"],
    // bedrooms: json["bedrooms"],
    // bathrooms: json["bathrooms"],
    // numberRooms: json["numberRooms"],
    // squareFeet: json["squareFeet"],
    // propertyLot: json["propertyLot"],
    // propertyBlock: json["propertyBlock"],
    // propertyTaxNumber: json["propertyTaxNumber"],
    // purchasePrice: json["purchasePrice"],
    // askingPrice: json["askingPrice"],
    // offerPrice: json["offerPrice"],
    // anticipatedArv: json["anticipatedARV"],
    // afterRepairValue: json["afterRepairValue"],
    // arvPercent: json["arvPercent"],
    // onLockbox: json["onLockbox"],
    // combination: json["combination"],
    // monthlyPayment: json["monthlyPayment"],
    // interestRate: json["interestRate"],
    // annualTaxes: json["annualTaxes"],
    // taxYear: json["taxYear"],
    // outstandingTaxes: json["outstandingTaxes"],
    // currentYearExpenses: json["currentYearExpenses"],
    // insurance: json["insurance"],
    // parentId: json["parentID"],
    // appraisalAmount: json["appraisalAmount"],
    // appraisalDate: json["appraisalDate"],
    // appraisalOrderDate: json["appraisalOrderDate"],
    // numberOfUnits: json["numberOfUnits"],
    // referralSource: json["referralSource"],
    // currentValue: json["currentValue"],
    // escrowBalance: json["escrowBalance"],
    // expectedPayoffDate: json["expectedPayoffDate"],
    // listingExpiration: json["listingExpiration"],
    // netRealizableValue: json["netRealizableValue"],
    // payoffGoodThrough: json["payoffGoodThrough"],
    // propertyManagerFees: json["propertyManagerFees"],
    // realEstateAgent: json["realEstateAgent"],
    // realatorCommission: json["realatorCommission"],
    // secured: json["secured"],
    // taxesOwed: json["taxesOwed"],
    // comments: json["comments"],
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

class WorkOrder {
  int workOrderId;
  // DateTime workOrderDate;
  // int workOrderStatusId;
  // dynamic workOrderStatus;
  String workOrderDetails;
  // int propertyId;
  // dynamic property;
  // int companyId;
  // dynamic company;
  // DateTime projectStartDate;
  // DateTime projectDueDate;
  // DateTime completeDate;
  // int perDiemPenalty;
  // int perDiemBonus;
  // int projectedCost;
  // int unit;
  // int budget;
  // int actualCost;
  // int percentOfBudget;
  // int costOverRuns;
  // dynamic parentId;
  // int workOrderTypeId;
  // dynamic workOrderType;
  // String specialTerms;
  // dynamic contractorVerification;
  // int customerId;
  // dynamic customer;
  // String type;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // DateTime modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  WorkOrder({
    required this.workOrderId,
    // this.workOrderDate,
    // this.workOrderStatusId,
    // this.workOrderStatus,
    required this.workOrderDetails,
    // this.propertyId,
    // this.property,
    // this.companyId,
    // this.company,
    // this.projectStartDate,
    // this.projectDueDate,
    // this.completeDate,
    // this.perDiemPenalty,
    // this.perDiemBonus,
    // this.projectedCost,
    // this.unit,
    // this.budget,
    // this.actualCost,
    // this.percentOfBudget,
    // this.costOverRuns,
    // this.parentId,
    // this.workOrderTypeId,
    // this.workOrderType,
    // this.specialTerms,
    // this.contractorVerification,
    // this.customerId,
    // this.customer,
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

  factory WorkOrder.fromJson(Map<String, dynamic> json) => WorkOrder(
    workOrderId: json["workOrderID"] ?? 0,
    // workOrderDate: DateTime.parse(json["workOrderDate"]),
    // workOrderStatusId: json["workOrderStatusID"],
    // workOrderStatus: json["workOrderStatus"],
    workOrderDetails: json["workOrderDetails"] ?? "",
    // propertyId: json["propertyID"],
    // property: json["property"],
    // companyId: json["companyID"],
    // company: json["company"],
    // projectStartDate: DateTime.parse(json["projectStartDate"]),
    // projectDueDate: DateTime.parse(json["projectDueDate"]),
    // completeDate: DateTime.parse(json["completeDate"]),
    // perDiemPenalty: json["perDiemPenalty"],
    // perDiemBonus: json["perDiemBonus"],
    // projectedCost: json["projectedCost"],
    // unit: json["unit"],
    // budget: json["budget"],
    // actualCost: json["actualCost"],
    // percentOfBudget: json["percentOfBudget"],
    // costOverRuns: json["costOverRuns"],
    // parentId: json["parentID"],
    // workOrderTypeId: json["workOrderTypeID"],
    // workOrderType: json["workOrderType"],
    // specialTerms: json["specialTerms"],
    // contractorVerification: json["contractorVerification"],
    // customerId: json["customerId"],
    // customer: json["customer"],
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


}
