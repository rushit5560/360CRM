// To parse this JSON data, do
//
//     final activeProspectManageListModel = activeProspectManageListModelFromJson(jsonString);

import 'dart:convert';

ActiveProspectManageListModel activeProspectManageListModelFromJson(String str) => ActiveProspectManageListModel.fromJson(json.decode(str));

// String activeProspectManageListModelToJson(ActiveProspectManageListModel data) => json.encode(data.toJson());

class ActiveProspectManageListModel {
  int statusCode;
  bool success;
  List<ProspectManageData> data;

  ActiveProspectManageListModel({
  required this.statusCode,
  required this.success,
  required this.data,
  });

  factory ActiveProspectManageListModel.fromJson(Map<String, dynamic> json) => ActiveProspectManageListModel(
    statusCode: json["statusCode"]??0,
    success: json["success"]??false,
    data: List<ProspectManageData>.from(json["data"].map((x) => ProspectManageData.fromJson(x))??{}),
  );

  // Map<String, dynamic> toJson() => {
  //   "statusCode": statusCode,
  //   "success": success,
  //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
  // };
}

class ProspectManageData {
  int? prospectId;
  String? propertyAddress;
  // int cityId;
  // dynamic city;
  // int stateId;
  // dynamic state;
  // String zip;
  // String prospectType;
  // String prospectSource;
  // int prospectStatusId;
  // dynamic prospectStatus;
  // DateTime closingDate;
  // String squareFeet;
  // String bedrooms;
  // String bathrooms;
  // String garage;
  // String pool;
  // String occupied;
  // int propertyTypeId;
  // dynamic propertyType;
  // int firstMortgageBalance;
  // int firstMortgageInterest;
  // int firstMortgagePayment;
  // int secondMortgageBalance;
  // int secondMortgageInterest;
  // int secondMortgagePayment;
  // String listed;
  // int listingPrice;
  // int homeValue;
  // int askingPrice;
  // String knownRepairs;
  // String sellingReason;
  // String additional;
  // String behind;
  // int amountBehind;
  // int quickClosePrice;
  // String misc;
  // int arv;
  // int purchasePrice;
  // int downPaymentPercent;
  // int downPayment;
  // bool interestOnly;
  // int interestRate;
  // dynamic mortgageTerm;
  // dynamic holdingTerm;
  // int condoAssocFees;
  // int taxes;
  // int insurance;
  // dynamic loanPayment;
  // dynamic utilities;
  // int rentRate;
  // String lotSize;
  // String stories;
  // String parking;
  // int customerId;
  // dynamic customer;
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

  ProspectManageData({
    this.prospectId,
    this.propertyAddress,
    // this.cityId,
    // this.city,
    // this.stateId,
    // this.state,
    // this.zip,
    // this.prospectType,
    // this.prospectSource,
    // this.prospectStatusId,
    // this.prospectStatus,
    // this.closingDate,
    // this.squareFeet,
    // this.bedrooms,
    // this.bathrooms,
    // this.garage,
    // this.pool,
    // this.occupied,
    // this.propertyTypeId,
    // this.propertyType,
    // this.firstMortgageBalance,
    // this.firstMortgageInterest,
    // this.firstMortgagePayment,
    // this.secondMortgageBalance,
    // this.secondMortgageInterest,
    // this.secondMortgagePayment,
    // this.listed,
    // this.listingPrice,
    // this.homeValue,
    // this.askingPrice,
    // this.knownRepairs,
    // this.sellingReason,
    // this.additional,
    // this.behind,
    // this.amountBehind,
    // this.quickClosePrice,
    // this.misc,
    // this.arv,
    // this.purchasePrice,
    // this.downPaymentPercent,
    // this.downPayment,
    // this.interestOnly,
    // this.interestRate,
    // this.mortgageTerm,
    // this.holdingTerm,
    // this.condoAssocFees,
    // this.taxes,
    // this.insurance,
    // this.loanPayment,
    // this.utilities,
    // this.rentRate,
    // this.lotSize,
    // this.stories,
    // this.parking,
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

  factory ProspectManageData.fromJson(Map<String, dynamic> json) => ProspectManageData(
    prospectId: json["prospectId"]??0,
    propertyAddress: json["propertyAddress"]??"",
    // cityId: json["cityId"],
    // city: json["city"],
    // stateId: json["stateId"],
    // state: json["state"],
    // zip: json["zip"],
    // prospectType: json["prospectType"],
    // prospectSource: json["prospectSource"],
    // prospectStatusId: json["prospectStatusID"],
    // prospectStatus: json["prospectStatus"],
    // closingDate: DateTime.parse(json["closingDate"]),
    // squareFeet: json["squareFeet"],
    // bedrooms: json["bedrooms"],
    // bathrooms: json["bathrooms"],
    // garage: json["garage"],
    // pool: json["pool"],
    // occupied: json["occupied"],
    // propertyTypeId: json["propertyTypeID"],
    // propertyType: json["propertyType"],
    // firstMortgageBalance: json["firstMortgageBalance"],
    // firstMortgageInterest: json["firstMortgageInterest"],
    // firstMortgagePayment: json["firstMortgagePayment"],
    // secondMortgageBalance: json["secondMortgageBalance"],
    // secondMortgageInterest: json["secondMortgageInterest"],
    // secondMortgagePayment: json["secondMortgagePayment"],
    // listed: json["listed"],
    // listingPrice: json["listingPrice"],
    // homeValue: json["homeValue"],
    // askingPrice: json["askingPrice"],
    // knownRepairs: json["knownRepairs"],
    // sellingReason: json["sellingReason"],
    // additional: json["additional"],
    // behind: json["behind"],
    // amountBehind: json["amountBehind"],
    // quickClosePrice: json["quickClosePrice"],
    // misc: json["misc"],
    // arv: json["arv"],
    // purchasePrice: json["purchasePrice"],
    // downPaymentPercent: json["downPaymentPercent"],
    // downPayment: json["downPayment"],
    // interestOnly: json["interestOnly"],
    // interestRate: json["interestRate"],
    // mortgageTerm: json["mortgageTerm"],
    // holdingTerm: json["holdingTerm"],
    // condoAssocFees: json["condoAssocFees"],
    // taxes: json["taxes"],
    // insurance: json["insurance"],
    // loanPayment: json["loanPayment"],
    // utilities: json["utilities"],
    // rentRate: json["rentRate"],
    // lotSize: json["lotSize"],
    // stories: json["stories"],
    // parking: json["parking"],
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
