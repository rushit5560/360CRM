import 'dart:convert';

BillDetailsModel billDetailsModelFromJson(String str) => BillDetailsModel.fromJson(json.decode(str));

// String billDetailsModelToJson(BillDetailsModel data) => json.encode(data.toJson());

class BillDetailsModel {
  int statusCode;
  Data data;

  BillDetailsModel({
    required this.statusCode,
    required this.data,
  });

  factory BillDetailsModel.fromJson(Map<String, dynamic> json) => BillDetailsModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

}

class Data {
  int billId;
  // int companyId;
  // Company company;
  // dynamic contactId;
  // dynamic contact;
  String propertyId;
  // dynamic property;
  String reference;
  DateTime billDate;
  DateTime dueDate;
  String address;
  int totalAmount;
  bool paid;
  // dynamic parentId;
  // int campaignId;
  // Campaign campaign;
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
  List<BillItem> billItem;
  List<Payment> payments;
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
    required this.billId,
    // this.companyId,
    // this.company,
    // this.contactId,
    // this.contact,
    required this.propertyId,
    // this.property,
    required this.reference,
    required this.billDate,
    required this.dueDate,
    required this.address,
    required this.totalAmount,
    required this.paid,
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
    required this.billItem,
    required this.payments,
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
    billId: json["billID"] ?? 0,
    // companyId: json["companyID"],
    // company: Company.fromJson(json["company"]),
    // contactId: json["contactID"],
    // contact: json["contact"],
    propertyId: (json["propertyID"] ?? 0).toString(),
    // property: json["property"],
    reference: json["reference"] ?? "",
    billDate: DateTime.parse(json["billDate"] ?? DateTime.now()),
    dueDate: DateTime.parse(json["dueDate"] ?? DateTime.now()),
    address: json["address"] ?? "",
    totalAmount: json["totalAmount"] ?? 0,
    paid: json["paid"] ?? false,
    // parentId: json["parentID"],
    // campaignId: json["campaignID"],
    // campaign: Campaign.fromJson(json["campaign"]),
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
    billItem: List<BillItem>.from((json["billItem"] ?? []).map((x) => BillItem.fromJson(x ?? {}))),
    payments: List<Payment>.from((json["payments"] ?? []).map((x) => Payment.fromJson(x ?? {}))),
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

class BillItem {
  int billItemId;
  int billId;
  // dynamic bill;
  int qty;
  int accountCategoryId;
  // dynamic accountCategory;
  String itemDescription;
  String unit;
  int price;
  int itemTotal;
  // int pageNumber;
  // int pageSize;
  int totalRecords;
  // dynamic createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  BillItem({
    required this.billItemId,
    required this.billId,
    // this.bill,
    required this.qty,
    required this.accountCategoryId,
    // this.accountCategory,
    required this.itemDescription,
    required this.unit,
    required this.price,
    required this.itemTotal,
    // this.pageNumber,
    // this.pageSize,
    required this.totalRecords,
    // this.createdBy,
    // this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    // this.isActive,
    // this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory BillItem.fromJson(Map<String, dynamic> json) => BillItem(
    billItemId: json["billItemID"] ?? 0,
    billId: json["billID"] ?? 0,
    // bill: json["bill"],
    qty: json["qty"] ?? 0,
    accountCategoryId: json["accountCategoryId"] ?? 0,
    // accountCategory: json["accountCategory"],
    itemDescription: json["itemDescription"] ?? "",
    unit: json["unit"] ?? "",
    price: json["price"] ?? 0,
    itemTotal: json["itemTotal"] ?? 0,
    // pageNumber: json["pageNumber"],
    // pageSize: json["pageSize"],
    totalRecords: json["totalRecords"] ?? 0,
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

// class Campaign {
//   int campaignId;
//   int campaignTypeId;
//   dynamic campaignType;
//   String campaignName;
//   int campaignStatusId;
//   int marketingChannelId;
//   dynamic marketingChannel;
//   dynamic campaignStatus;
//   DateTime startDate;
//   DateTime endDate;
//   int cost;
//   String parentCampaign;
//   String referralSource;
//   String ftpHostName;
//   String ftpUsername;
//   String ftpPassword;
//   dynamic ftpPort;
//   String ftpProxy;
//   bool ftpPassive;
//   String licenseCode;
//   String dataSourceName;
//   String driver;
//   String server;
//   dynamic serverPort;
//   String user;
//   String password;
//   String database;
//   dynamic lastId;
//   dynamic lastRightPanelId;
//   String type;
//   int propertyId;
//   dynamic property;
//   dynamic prospectId;
//   dynamic prospect;
//   int customerId;
//   dynamic customer;
//   int pageNumber;
//   int pageSize;
//   int totalRecords;
//   String createdBy;
//   DateTime createdOn;
//   dynamic modifiedBy;
//   dynamic modifiedOn;
//   bool isActive;
//   bool isDeleted;
//   dynamic createdUser;
//   dynamic modifiedUser;
//
//   Campaign({
//     this.campaignId,
//     this.campaignTypeId,
//     this.campaignType,
//     this.campaignName,
//     this.campaignStatusId,
//     this.marketingChannelId,
//     this.marketingChannel,
//     this.campaignStatus,
//     this.startDate,
//     this.endDate,
//     this.cost,
//     this.parentCampaign,
//     this.referralSource,
//     this.ftpHostName,
//     this.ftpUsername,
//     this.ftpPassword,
//     this.ftpPort,
//     this.ftpProxy,
//     this.ftpPassive,
//     this.licenseCode,
//     this.dataSourceName,
//     this.driver,
//     this.server,
//     this.serverPort,
//     this.user,
//     this.password,
//     this.database,
//     this.lastId,
//     this.lastRightPanelId,
//     this.type,
//     this.propertyId,
//     this.property,
//     this.prospectId,
//     this.prospect,
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
//   factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
//     campaignId: json["campaignID"],
//     campaignTypeId: json["campaignTypeId"],
//     campaignType: json["campaignType"],
//     campaignName: json["campaignName"],
//     campaignStatusId: json["campaignStatusId"],
//     marketingChannelId: json["marketingChannelId"],
//     marketingChannel: json["marketingChannel"],
//     campaignStatus: json["campaignStatus"],
//     startDate: DateTime.parse(json["startDate"]),
//     endDate: DateTime.parse(json["endDate"]),
//     cost: json["cost"],
//     parentCampaign: json["parentCampaign"],
//     referralSource: json["referralSource"],
//     ftpHostName: json["ftpHostName"],
//     ftpUsername: json["ftpUsername"],
//     ftpPassword: json["ftpPassword"],
//     ftpPort: json["ftpPort"],
//     ftpProxy: json["ftpProxy"],
//     ftpPassive: json["ftpPassive"],
//     licenseCode: json["licenseCode"],
//     dataSourceName: json["dataSourceName"],
//     driver: json["driver"],
//     server: json["server"],
//     serverPort: json["serverPort"],
//     user: json["user"],
//     password: json["password"],
//     database: json["database"],
//     lastId: json["lastID"],
//     lastRightPanelId: json["lastRightPanelID"],
//     type: json["type"],
//     propertyId: json["propertyID"],
//     property: json["property"],
//     prospectId: json["prospectID"],
//     prospect: json["prospect"],
//     customerId: json["customerId"],
//     customer: json["customer"],
//     pageNumber: json["pageNumber"],
//     pageSize: json["pageSize"],
//     totalRecords: json["totalRecords"],
//     createdBy: json["createdBy"],
//     createdOn: DateTime.parse(json["createdOn"]),
//     modifiedBy: json["modifiedBy"],
//     modifiedOn: json["modifiedOn"],
//     isActive: json["isActive"],
//     isDeleted: json["isDeleted"],
//     createdUser: json["createdUser"],
//     modifiedUser: json["modifiedUser"],
//   );
//
// }

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
  String createdBy;
  DateTime createdOn;
  dynamic modifiedBy;
  dynamic modifiedOn;
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
    modifiedOn: json["modifiedOn"],
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    createdUser: json["createdUser"],
    modifiedUser: json["modifiedUser"],
  );

}*/

class Payment {
  int paymentId;
  int billId;
  // dynamic bill;
  int amount;
  DateTime paymentDate;
  // int paymentTypeId;
  // dynamic paymentType;
  // int paymentMethodId;
  // dynamic paymentMethod;
  int accountCategoryId;
  // dynamic accountCategory;
  String reference;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // dynamic createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  Payment({
    required this.paymentId,
    required this.billId,
    // this.bill,
    required this.amount,
    required this.paymentDate,
    // this.paymentTypeId,
    // this.paymentType,
    // this.paymentMethodId,
    // this.paymentMethod,
    required this.accountCategoryId,
    // this.accountCategory,
    required this.reference,
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

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    paymentId: json["paymentID"] ?? 0,
    billId: json["billID"] ?? 0,
    // bill: json["bill"],
    amount: json["amount"] ?? 0,
    paymentDate: DateTime.parse(json["paymentDate"] ?? DateTime.now()),
    // paymentTypeId: json["paymentTypeID"],
    // paymentType: json["paymentType"],
    // paymentMethodId: json["paymentMethodID"],
    // paymentMethod: json["paymentMethod"],
    accountCategoryId: json["accountCategoryId"] ?? 0,
    // accountCategory: json["accountCategory"],
    reference: json["reference"] ?? "",
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
