// import 'dart:convert';
//
// BillListModel billListModelFromJson(String str) => BillListModel.fromJson(json.decode(str));
//
// // String billListModelToJson(BillListModel data) => json.encode(data.toJson());
//
// class BillListModel {
//   int statusCode;
//   List<BillData> data;
//
//   BillListModel({
//     required this.statusCode,
//     required this.data,
//   });
//
//   factory BillListModel.fromJson(Map<String, dynamic> json) => BillListModel(
//     statusCode: json["statusCode"] ?? 0,
//     data: List<BillData>.from((json["data"] ?? []).map((x) => BillData.fromJson(x ?? {}))),
//   );
//
//   // Map<String, dynamic> toJson() => {
//   //   "statusCode": statusCode,
//   //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   // };
//
// }
//
// class BillData {
//   int billItemId;
//   int billId;
//   Bill bill;
//   int qty;
//   int accountCategoryId;
//   AccountCategory accountCategory;
//   String itemDescription;
//   String unit;
//   double price;
//   double itemTotal;
//   int pageNumber;
//   int pageSize;
//   int totalRecords;
//   dynamic createdBy;
//   DateTime createdOn;
//   dynamic modifiedBy;
//   DateTime modifiedOn;
//   bool isActive;
//   bool isDeleted;
//   dynamic createdUser;
//   dynamic modifiedUser;
//
//   BillData({
//     this.billItemId,
//     this.billId,
//     this.bill,
//     this.qty,
//     this.accountCategoryId,
//     this.accountCategory,
//     this.itemDescription,
//     this.unit,
//     this.price,
//     this.itemTotal,
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
//   factory BillData.fromJson(Map<String, dynamic> json) => BillData(
//     billItemId: json["billItemID"],
//     billId: json["billID"],
//     bill: Bill.fromJson(json["bill"]),
//     qty: json["qty"],
//     accountCategoryId: json["accountCategoryId"],
//     accountCategory: AccountCategory.fromJson(json["accountCategory"]),
//     itemDescription: json["itemDescription"],
//     unit: json["unit"],
//     price: json["price"].toDouble(),
//     itemTotal: json["itemTotal"].toDouble(),
//     pageNumber: json["pageNumber"],
//     pageSize: json["pageSize"],
//     totalRecords: json["totalRecords"],
//     createdBy: json["createdBy"],
//     createdOn: DateTime.parse(json["createdOn"]),
//     modifiedBy: json["modifiedBy"],
//     modifiedOn: DateTime.parse(json["modifiedOn"]),
//     isActive: json["isActive"],
//     isDeleted: json["isDeleted"],
//     createdUser: json["createdUser"],
//     modifiedUser: json["modifiedUser"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "billItemID": billItemId,
//     "billID": billId,
//     "bill": bill.toJson(),
//     "qty": qty,
//     "accountCategoryId": accountCategoryId,
//     "accountCategory": accountCategory.toJson(),
//     "itemDescription": itemDescription,
//     "unit": unit,
//     "price": price,
//     "itemTotal": itemTotal,
//     "pageNumber": pageNumber,
//     "pageSize": pageSize,
//     "totalRecords": totalRecords,
//     "createdBy": createdBy,
//     "createdOn": createdOn.toIso8601String(),
//     "modifiedBy": modifiedBy,
//     "modifiedOn": modifiedOn.toIso8601String(),
//     "isActive": isActive,
//     "isDeleted": isDeleted,
//     "createdUser": createdUser,
//     "modifiedUser": modifiedUser,
//   };
// }
//
// class AccountCategory {
//   int accountCategoryId;
//   String category;
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
//   AccountCategory({
//     this.accountCategoryId,
//     this.category,
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
//   factory AccountCategory.fromJson(Map<String, dynamic> json) => AccountCategory(
//     accountCategoryId: json["accountCategoryId"],
//     category: json["category"],
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
//   Map<String, dynamic> toJson() => {
//     "accountCategoryId": accountCategoryId,
//     "category": category,
//     "customerId": customerId,
//     "customer": customer,
//     "pageNumber": pageNumber,
//     "pageSize": pageSize,
//     "totalRecords": totalRecords,
//     "createdBy": createdBy,
//     "createdOn": createdOn.toIso8601String(),
//     "modifiedBy": modifiedBy,
//     "modifiedOn": modifiedOn,
//     "isActive": isActive,
//     "isDeleted": isDeleted,
//     "createdUser": createdUser,
//     "modifiedUser": modifiedUser,
//   };
// }
//
// class Bill {
//   int billId;
//   int companyId;
//   dynamic company;
//   dynamic contactId;
//   dynamic contact;
//   dynamic propertyId;
//   dynamic property;
//   String reference;
//   DateTime billDate;
//   DateTime dueDate;
//   String address;
//   double totalAmount;
//   bool paid;
//   dynamic parentId;
//   dynamic campaignId;
//   dynamic campaign;
//   dynamic workOrderId;
//   dynamic workOrder;
//   dynamic leaseId;
//   dynamic lease;
//   dynamic mortgageId;
//   dynamic mortgage;
//   dynamic mortgagePaymentId;
//   dynamic legalId;
//   dynamic legal;
//   dynamic propertyManagementId;
//   dynamic propertyManagement;
//   dynamic prospectId;
//   dynamic prospect;
//   dynamic type;
//   dynamic billItem;
//   dynamic payments;
//   int pageNumber;
//   int pageSize;
//   int totalRecords;
//   dynamic createdBy;
//   DateTime createdOn;
//   dynamic modifiedBy;
//   DateTime modifiedOn;
//   bool isActive;
//   bool isDeleted;
//   dynamic createdUser;
//   dynamic modifiedUser;
//
//   Bill({
//     this.billId,
//     this.companyId,
//     this.company,
//     this.contactId,
//     this.contact,
//     this.propertyId,
//     this.property,
//     this.reference,
//     this.billDate,
//     this.dueDate,
//     this.address,
//     this.totalAmount,
//     this.paid,
//     this.parentId,
//     this.campaignId,
//     this.campaign,
//     this.workOrderId,
//     this.workOrder,
//     this.leaseId,
//     this.lease,
//     this.mortgageId,
//     this.mortgage,
//     this.mortgagePaymentId,
//     this.legalId,
//     this.legal,
//     this.propertyManagementId,
//     this.propertyManagement,
//     this.prospectId,
//     this.prospect,
//     this.type,
//     this.billItem,
//     this.payments,
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
//   factory Bill.fromJson(Map<String, dynamic> json) => Bill(
//     billId: json["billID"],
//     companyId: json["companyID"],
//     company: json["company"],
//     contactId: json["contactID"],
//     contact: json["contact"],
//     propertyId: json["propertyID"],
//     property: json["property"],
//     reference: json["reference"],
//     billDate: DateTime.parse(json["billDate"]),
//     dueDate: DateTime.parse(json["dueDate"]),
//     address: json["address"],
//     totalAmount: json["totalAmount"].toDouble(),
//     paid: json["paid"],
//     parentId: json["parentID"],
//     campaignId: json["campaignID"],
//     campaign: json["campaign"],
//     workOrderId: json["workOrderID"],
//     workOrder: json["workOrder"],
//     leaseId: json["leaseID"],
//     lease: json["lease"],
//     mortgageId: json["mortgageID"],
//     mortgage: json["mortgage"],
//     mortgagePaymentId: json["mortgagePaymentID"],
//     legalId: json["legalID"],
//     legal: json["legal"],
//     propertyManagementId: json["propertyManagementID"],
//     propertyManagement: json["propertyManagement"],
//     prospectId: json["prospectID"],
//     prospect: json["prospect"],
//     type: json["type"],
//     billItem: json["billItem"],
//     payments: json["payments"],
//     pageNumber: json["pageNumber"],
//     pageSize: json["pageSize"],
//     totalRecords: json["totalRecords"],
//     createdBy: json["createdBy"],
//     createdOn: DateTime.parse(json["createdOn"]),
//     modifiedBy: json["modifiedBy"],
//     modifiedOn: DateTime.parse(json["modifiedOn"]),
//     isActive: json["isActive"],
//     isDeleted: json["isDeleted"],
//     createdUser: json["createdUser"],
//     modifiedUser: json["modifiedUser"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "billID": billId,
//     "companyID": companyId,
//     "company": company,
//     "contactID": contactId,
//     "contact": contact,
//     "propertyID": propertyId,
//     "property": property,
//     "reference": reference,
//     "billDate": billDate.toIso8601String(),
//     "dueDate": dueDate.toIso8601String(),
//     "address": address,
//     "totalAmount": totalAmount,
//     "paid": paid,
//     "parentID": parentId,
//     "campaignID": campaignId,
//     "campaign": campaign,
//     "workOrderID": workOrderId,
//     "workOrder": workOrder,
//     "leaseID": leaseId,
//     "lease": lease,
//     "mortgageID": mortgageId,
//     "mortgage": mortgage,
//     "mortgagePaymentID": mortgagePaymentId,
//     "legalID": legalId,
//     "legal": legal,
//     "propertyManagementID": propertyManagementId,
//     "propertyManagement": propertyManagement,
//     "prospectID": prospectId,
//     "prospect": prospect,
//     "type": type,
//     "billItem": billItem,
//     "payments": payments,
//     "pageNumber": pageNumber,
//     "pageSize": pageSize,
//     "totalRecords": totalRecords,
//     "createdBy": createdBy,
//     "createdOn": createdOn.toIso8601String(),
//     "modifiedBy": modifiedBy,
//     "modifiedOn": modifiedOn.toIso8601String(),
//     "isActive": isActive,
//     "isDeleted": isDeleted,
//     "createdUser": createdUser,
//     "modifiedUser": modifiedUser,
//   };
// }
