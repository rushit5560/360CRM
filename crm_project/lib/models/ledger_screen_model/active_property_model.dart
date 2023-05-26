import 'dart:convert';

ActivePropertyListModel activePropertyListModelFromJson(String str) => ActivePropertyListModel.fromJson(json.decode(str));

String activePropertyListModelToJson(ActivePropertyListModel data) => json.encode(data.toJson());

class ActivePropertyListModel {
  int statusCode;
  bool success;
  List<PropertyData> data;

  ActivePropertyListModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  factory ActivePropertyListModel.fromJson(Map<String, dynamic> json) => ActivePropertyListModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<PropertyData>.from((json["data"] ?? []).map((x) => PropertyData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PropertyData {
  int? propertyId;
  String? propertyName;
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
  // UnitType unitType;
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
  // int garageTypeId;
  // dynamic garageType;
  // Bedrooms bedrooms;
  // Bathrooms bathrooms;
  // NumberRooms numberRooms;
  // SquareFeet squareFeet;
  // PropertyLot propertyLot;
  // PropertyBlock propertyBlock;
  // String propertyTaxNumber;
  // int purchasePrice;
  // int askingPrice;
  // int offerPrice;
  // int anticipatedArv;
  // int afterRepairValue;
  // int arvPercent;
  // bool onLockbox;
  // String combination;
  // int monthlyPayment;
  // int interestRate;
  // int annualTaxes;
  // String taxYear;
  // int outstandingTaxes;
  // int currentYearExpenses;
  // int insurance;
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

  PropertyData({
    this.propertyId,
    this.propertyName,
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

  factory PropertyData.fromJson(Map<String, dynamic> json) => PropertyData(
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
    // unitType: unitTypeValues.map[json["unitType"]],
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
    // bedrooms: bedroomsValues.map[json["bedrooms"]],
    // bathrooms: bathroomsValues.map[json["bathrooms"]],
    // numberRooms: numberRoomsValues.map[json["numberRooms"]],
    // squareFeet: squareFeetValues.map[json["squareFeet"]],
    // propertyLot: propertyLotValues.map[json["propertyLot"]],
    // propertyBlock: propertyBlockValues.map[json["propertyBlock"]],
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
