// To parse this JSON data, do
//
//     final workOrderPropertyListModel = workOrderPropertyListModelFromJson(jsonString);

import 'dart:convert';

WorkOrderPropertyListModel workOrderPropertyListModelFromJson(String str) => WorkOrderPropertyListModel.fromJson(json.decode(str));

// String workOrderPropertyListModelToJson(WorkOrderPropertyListModel data) => json.encode(data.toJson());

class WorkOrderPropertyListModel {
  int statusCode;
  bool success;
  List<WorkOrderPropertyData> data;

  WorkOrderPropertyListModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  factory WorkOrderPropertyListModel.fromJson(Map<String, dynamic> json) => WorkOrderPropertyListModel(
    statusCode: json["statusCode"]??0,
    success: json["success"]??'',
    data: List<WorkOrderPropertyData>.from((json["data"]??{}).map((x) => WorkOrderPropertyData.fromJson(x))),
  );

  // Map<String, dynamic> toJson() => {
  //   "statusCode": statusCode,
  //   "success": success,
  //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
  // };
}

class WorkOrderPropertyData {
  int? propertyId;
  String? propertyName;
  String? address;
  String? unitNumber;
  int? cityId;
  // dynamic city;
  int? stateId;
  // dynamic state;
  String? zip;
  int? prospectId;
  // dynamic prospect;
  int? propertyTypeId;
  // dynamic propertyType;
  int? propertyStatusId;
  // dynamic propertyStatus;
  String? unitType;//>>
  bool? rented;
  int? customerId;
  // dynamic customer;
  // dynamic activityId;
  // dynamic activity;
  // dynamic checkListId;
  // dynamic checkList;
  // dynamic documentTemplateId;
  // dynamic documentTemplate;
  // // String? lotSize;
  // // String? stories;
  // // String? parking;
  // // bool? garage;
  // // int? garageTypeId;
  // // // dynamic garageType;
  // // String? bedrooms;//>>
  // // String? bathrooms;//>>
  // // String? numberRooms;//>>
  // // String? squareFeet;//>>
  // // String? propertyLot;//>>
  // // String? propertyBlock;//>>
  // // String? propertyTaxNumber;
  // // int? purchasePrice;
  // // int? askingPrice;
  // // int? offerPrice;
  // // int? anticipatedArv;
  // // int? afterRepairValue;
  // // int? arvPercent;
  // // bool? onLockbox;
  // // String? combination;
  // // int? monthlyPayment;
  // // int? interestRate;
  // // int? annualTaxes;
  // // String? taxYear;
  // // int? outstandingTaxes;
  // // int? currentYearExpenses;
  // // int? insurance;
  // // dynamic parentId;
  // // dynamic appraisalAmount;
  // // dynamic appraisalDate;
  // // dynamic appraisalOrderDate;
  // String? numberOfUnits;
  // String? referralSource;
  // dynamic currentValue;
  // dynamic escrowBalance;
  // dynamic expectedPayoffDate;
  // dynamic listingExpiration;
  // dynamic netRealizableValue;
  // dynamic payoffGoodThrough;
  // dynamic propertyManagerFees;
  // dynamic realEstateAgent;
  String? realatorCommission;
  // dynamic secured;
  // dynamic taxesOwed;
  String? comments;
  int? pageNumber;
  int? pageSize;
  int? totalRecords;
  String? createdBy;
  DateTime? createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool? isActive;
  bool? isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  WorkOrderPropertyData({
    this.propertyId,
    this.propertyName,
    this.address,
    this.unitNumber,
    this.cityId,
    // this.city,
    this.stateId,
    // this.state,
    this.zip,
    this.prospectId,
    // this.prospect,
    this.propertyTypeId,
    // this.propertyType,
    this.propertyStatusId,
    // this.propertyStatus,
    this.unitType,
    this.rented,
    this.customerId,
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
    // // this.garageType,
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
    // // this.parentId,
    // // this.appraisalAmount,
    // // this.appraisalDate,
    // // this.appraisalOrderDate,
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
    this.realatorCommission,
    // this.secured,
    // this.taxesOwed,
    this.comments,
    this.pageNumber,
    this.pageSize,
    this.totalRecords,
    this.createdBy,
    this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    this.isActive,
    this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory WorkOrderPropertyData.fromJson(Map<String, dynamic> json) => WorkOrderPropertyData(
    propertyId: json["propertyId"]??0,
    propertyName: json["propertyName"]??'',
    address: json["address"]??'',
    unitNumber: json["unitNumber"]??'',
    cityId: json["cityId"]??'',
    // city: json["city"],
    stateId: json["stateId"]??0,
    // state: json["state"],
    zip: json["zip"]??'',
    prospectId: json["prospectID"]??0,
    // prospect: json["prospect"],
    propertyTypeId: json["propertyTypeID"]??0,
    // propertyType: json["propertyType"],
    propertyStatusId: json["propertyStatusID"]??0,
    // propertyStatus: json["propertyStatus"],
    unitType: json["unitType"]??'',
    rented: json["rented"]??false,
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    // activityId: json["activityID"],
    // activity: json["activity"],
    // checkListId: json["checkListId"],
    // checkList: json["checkList"],
    // documentTemplateId: json["documentTemplateId"],
    // documentTemplate: json["documentTemplate"],
    // lotSize: json["lotSize"]??'',
    // stories: json["stories"]??'',
    // parking: json["parking"]??'',
    // garage: json["garage"]??false,
    // garageTypeId: json["garageTypeID"]??0,
    // // garageType: json["garageType"],
    // bedrooms: json["bedrooms"]??'',
    // bathrooms: json["bathrooms"]??'',
    // numberRooms: json["numberRooms"]??'',
    // squareFeet: json["squareFeet"]??'',
    // propertyLot: json["propertyLot"]??'',
    // propertyBlock: json["propertyBlock"]??'',
    // propertyTaxNumber: json["propertyTaxNumber"]??'',
    // purchasePrice: json["purchasePrice"]??0,
    // askingPrice: json["askingPrice"]??0,
    // offerPrice: json["offerPrice"]??0,
    // anticipatedArv: json["anticipatedARV"]??0,
    // afterRepairValue: json["afterRepairValue"]??0,
    // arvPercent: json["arvPercent"]??0,
    // onLockbox: json["onLockbox"]??false,
    // combination: json["combination"]??'',
    // monthlyPayment: json["monthlyPayment"]??0,
    // interestRate: json["interestRate"]??0,
    // annualTaxes: json["annualTaxes"]??0,
    // taxYear: json["taxYear"]??0,
    // outstandingTaxes: json["outstandingTaxes"]??0,
    // currentYearExpenses: json["currentYearExpenses"]??0,
    // insurance: json["insurance"]??0,
    // // parentId: json["parentID"],
    // // appraisalAmount: json["appraisalAmount"],
    // // appraisalDate: json["appraisalDate"],
    // // appraisalOrderDate: json["appraisalOrderDate"],
    // numberOfUnits: json["numberOfUnits"]??'',
    // referralSource: json["referralSource"]??'',
    // currentValue: json["currentValue"],
    // escrowBalance: json["escrowBalance"],
    // expectedPayoffDate: json["expectedPayoffDate"],
    // listingExpiration: json["listingExpiration"],
    // netRealizableValue: json["netRealizableValue"],
    // payoffGoodThrough: json["payoffGoodThrough"],
    // propertyManagerFees: json["propertyManagerFees"],
    // realEstateAgent: json["realEstateAgent"],
    realatorCommission: json["realatorCommission"]??'',
    // secured: json["secured"],
    // taxesOwed: json["taxesOwed"],
    comments: json["comments"]??'',
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now().toString()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  // Map<String, dynamic> toJson() => {
  //   "propertyId": propertyId,
  //   "propertyName": propertyName,
  //   "address": address,
  //   "unitNumber": unitNumber,
  //   "cityId": cityId,
  //   "city": city,
  //   "stateId": stateId,
  //   "state": state,
  //   "zip": zip,
  //   "prospectID": prospectId,
  //   "prospect": prospect,
  //   "propertyTypeID": propertyTypeId,
  //   "propertyType": propertyType,
  //   "propertyStatusID": propertyStatusId,
  //   "propertyStatus": propertyStatus,
  //   "unitType": unitTypeValues.reverse[unitType],
  //   "rented": rented,
  //   "customerId": customerId,
  //   "customer": customer,
  //   "activityID": activityId,
  //   "activity": activity,
  //   "checkListId": checkListId,
  //   "checkList": checkList,
  //   "documentTemplateId": documentTemplateId,
  //   "documentTemplate": documentTemplate,
  //   "lotSize": lotSize,
  //   "stories": stories,
  //   "parking": parking,
  //   "garage": garage,
  //   "garageTypeID": garageTypeId,
  //   "garageType": garageType,
  //   "bedrooms": bedroomsValues.reverse[bedrooms],
  //   "bathrooms": bathroomsValues.reverse[bathrooms],
  //   "numberRooms": numberRoomsValues.reverse[numberRooms],
  //   "squareFeet": squareFeetValues.reverse[squareFeet],
  //   "propertyLot": bathroomsValues.reverse[propertyLot],
  //   "propertyBlock": propertyBlockValues.reverse[propertyBlock],
  //   "propertyTaxNumber": propertyTaxNumber,
  //   "purchasePrice": purchasePrice,
  //   "askingPrice": askingPrice,
  //   "offerPrice": offerPrice,
  //   "anticipatedARV": anticipatedArv,
  //   "afterRepairValue": afterRepairValue,
  //   "arvPercent": arvPercent,
  //   "onLockbox": onLockbox,
  //   "combination": combination,
  //   "monthlyPayment": monthlyPayment,
  //   "interestRate": interestRate,
  //   "annualTaxes": annualTaxes,
  //   "taxYear": taxYear,
  //   "outstandingTaxes": outstandingTaxes,
  //   "currentYearExpenses": currentYearExpenses,
  //   "insurance": insurance,
  //   "parentID": parentId,
  //   "appraisalAmount": appraisalAmount,
  //   "appraisalDate": appraisalDate,
  //   "appraisalOrderDate": appraisalOrderDate,
  //   "numberOfUnits": numberOfUnits,
  //   "referralSource": referralSource,
  //   "currentValue": currentValue,
  //   "escrowBalance": escrowBalance,
  //   "expectedPayoffDate": expectedPayoffDate,
  //   "listingExpiration": listingExpiration,
  //   "netRealizableValue": netRealizableValue,
  //   "payoffGoodThrough": payoffGoodThrough,
  //   "propertyManagerFees": propertyManagerFees,
  //   "realEstateAgent": realEstateAgent,
  //   "realatorCommission": realatorCommission,
  //   "secured": secured,
  //   "taxesOwed": taxesOwed,
  //   "comments": comments,
  //   "pageNumber": pageNumber,
  //   "pageSize": pageSize,
  //   "totalRecords": totalRecords,
  //   "createdBy": createdBy,
  //   "createdOn": createdOn.toIso8601String(),
  //   "modifiedBy": modifiedBy,
  //   "modifiedOn": modifiedOn,
  //   "isActive": isActive,
  //   "isDeleted": isDeleted,
  //   "createdUser": createdUser,
  //   "modifiedUser": modifiedUser,
  // };
}
