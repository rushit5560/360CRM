// To parse this JSON data, do
//
//     final activeLeaseListModel = activeLeaseListModelFromJson(jsonString);

import 'dart:convert';

ActiveLeaseListModel activeLeaseListModelFromJson(String str) =>
    ActiveLeaseListModel.fromJson(json.decode(str));

// String activeLeaseListModelToJson(ActiveLeaseListModel data) => json.encode(data.toJson());

class ActiveLeaseListModel {
  int statusCode;
  bool success;
  List<LeaseData> data;

  ActiveLeaseListModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  factory ActiveLeaseListModel.fromJson(Map<String, dynamic> json) =>
      ActiveLeaseListModel(
        statusCode: json["statusCode"] ?? 0,
        success: json["success"] ?? false,
        data:
            List<LeaseData>.from(json["data"].map((x) => LeaseData.fromJson(x)) ?? {}),
      );

// Map<String, dynamic> toJson() => {
//   "statusCode": statusCode,
//   "success": success,
//   "data": List<dynamic>.from(data.map((x) => x.toJson())),
// };
}

class LeaseData {
  int? leaseId;

  // int leaseStatusId;
  // dynamic leaseStatus;
  // DateTime leaseStartDate;
  // DateTime leaseEndDate;
  // int rentalAmount;
  // DateTime rentDueDate;
  String? gracePeriod;

  // int lateFee;
  // int leaseRenewalTypeId;
  // dynamic leaseRenewalType;
  // bool petsAllowed;
  // int petDepositAmount;
  // int securityDeposit;
  // String depositAccount;
  // String depositBank;
  // String specialTerms;
  // int propertyManagementId;
  // dynamic propertyManagement;
  // int propertyId;
  // dynamic property;
  // int contactId;
  // dynamic contact;
  // dynamic moveInDate;
  // dynamic renewDate;
  // bool autoRenew;
  // dynamic parentId;
  // Type type;
  // dynamic listingBrokerId;
  // dynamic listingBroker;
  // dynamic sellingBrokerId;
  // dynamic sellingBroker;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // String modifiedBy;
  // DateTime modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  LeaseData({
     this.leaseId,
    // this.leaseStatusId,
    // this.leaseStatus,
    // this.leaseStartDate,
    // this.leaseEndDate,
    // this.rentalAmount,
    // this.rentDueDate,
     this.gracePeriod,
    // this.lateFee,
    // this.leaseRenewalTypeId,
    // this.leaseRenewalType,
    // this.petsAllowed,
    // this.petDepositAmount,
    // this.securityDeposit,
    // this.depositAccount,
    // this.depositBank,
    // this.specialTerms,
    // this.propertyManagementId,
    // this.propertyManagement,
    // this.propertyId,
    // this.property,
    // this.contactId,
    // this.contact,
    // this.moveInDate,
    // this.renewDate,
    // this.autoRenew,
    // this.parentId,
    // this.type,
    // this.listingBrokerId,
    // this.listingBroker,
    // this.sellingBrokerId,
    // this.sellingBroker,
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

  factory LeaseData.fromJson(Map<String, dynamic> json) => LeaseData(
        leaseId: json["leaseID"] ?? 0,
        // leaseStatusId: json["leaseStatusID"],
        // leaseStatus: json["leaseStatus"],
        // leaseStartDate: DateTime.parse(json["leaseStartDate"]),
        // leaseEndDate: DateTime.parse(json["leaseEndDate"]),
        // rentalAmount: json["rentalAmount"],
        // rentDueDate: DateTime.parse(json["rentDueDate"]),
        gracePeriod: (json["gracePeriod"] ?? 0).toString(),
        // lateFee: json["lateFee"],
        // leaseRenewalTypeId: json["leaseRenewalTypeID"],
        // leaseRenewalType: json["leaseRenewalType"],
        // petsAllowed: json["petsAllowed"],
        // petDepositAmount: json["petDepositAmount"],
        // securityDeposit: json["securityDeposit"],
        // depositAccount: json["depositAccount"],
        // depositBank: json["depositBank"],
        // specialTerms: json["specialTerms"],
        // propertyManagementId: json["propertyManagementID"],
        // propertyManagement: json["propertyManagement"],
        // propertyId: json["propertyID"],
        // property: json["property"],
        // contactId: json["contactID"],
        // contact: json["contact"],
        // moveInDate: json["moveInDate"],
        // renewDate: json["renewDate"],
        // autoRenew: json["autoRenew"],
        // parentId: json["parentID"],
        // type: typeValues.map[json["type"]],
        // listingBrokerId: json["listingBrokerID"],
        // listingBroker: json["listingBroker"],
        // sellingBrokerId: json["sellingBrokerID"],
        // sellingBroker: json["sellingBroker"],
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
