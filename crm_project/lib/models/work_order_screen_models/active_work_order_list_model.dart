// To parse this JSON data, do
//
//     final activeWorkOrderListModel = activeWorkOrderListModelFromJson(jsonString);

import 'dart:convert';

ActiveWorkOrderListModel activeWorkOrderListModelFromJson(String str) => ActiveWorkOrderListModel.fromJson(json.decode(str));

String activeWorkOrderListModelToJson(ActiveWorkOrderListModel data) => json.encode(data.toJson());

class ActiveWorkOrderListModel {
  int statusCode;
  List<WorkOrderListData> data;

  ActiveWorkOrderListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActiveWorkOrderListModel.fromJson(Map<String, dynamic> json) => ActiveWorkOrderListModel(
    statusCode: json["statusCode"]??0,
    data: List<WorkOrderListData>.from((json["data"]??{}).map((x) => WorkOrderListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class WorkOrderListData {
  int? workOrderId;
  DateTime? workOrderDate;
  int? workOrderStatusId;
  // dynamic workOrderStatus;
  String? workOrderDetails;
  int? propertyId;
  // dynamic property;
  int? companyId;
  // dynamic company;
  DateTime? projectStartDate;
  DateTime? projectDueDate;
  DateTime? completeDate;
  double? perDiemPenalty;
  double? perDiemBonus;
  double? projectedCost;
  int? unit;
  double? budget;
  double? actualCost;
  int? percentOfBudget;
  double? costOverRuns;
  // dynamic parentId;
  int? workOrderTypeId;
  // dynamic workOrderType;
  String? specialTerms;
  // dynamic contractorVerification;
  int? customerId;
  // dynamic customer;
  String? type;
  int? pageNumber;
  int? pageSize;
  int? totalRecords;
  String? createdBy;
  DateTime? createdOn;
  // dynamic modifiedBy;
  DateTime? modifiedOn;
  bool? isActive;
  bool? isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  WorkOrderListData({
    this.workOrderId,
    this.workOrderDate,
    this.workOrderStatusId,
    // this.workOrderStatus,
    this.workOrderDetails,
    this.propertyId,
    // this.property,
    this.companyId,
    // this.company,
    this.projectStartDate,
    this.projectDueDate,
    this.completeDate,
    this.perDiemPenalty,
    // this.perDiemBonus,
    this.projectedCost,
    this.unit,
    this.budget,
    this.actualCost,
    this.percentOfBudget,
    this.costOverRuns,
    // this.parentId,
    this.workOrderTypeId,
    // this.workOrderType,
    this.specialTerms,
    // this.contractorVerification,
    this.customerId,
    // this.customer,
    this.type,
    this.pageNumber,
    this.pageSize,
    this.totalRecords,
    this.createdBy,
    this.createdOn,
    // this.modifiedBy,
    this.modifiedOn,
    this.isActive,
    this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory WorkOrderListData.fromJson(Map<String, dynamic> json) => WorkOrderListData(
    workOrderId: json["workOrderID"]??0,
    workOrderDate: DateTime.parse(json["workOrderDate"] ?? DateTime.now().toString()),
    workOrderStatusId: json["workOrderStatusID"]??0,
    // workOrderStatus: json["workOrderStatus"],
    workOrderDetails: json["workOrderDetails"]??'',
    propertyId: json["propertyID"]??0,
    // property: json["property"],
    companyId: json["companyID"]??0,
    // company: json["company"],
    projectStartDate: DateTime.parse(json["projectStartDate"]?? DateTime.now().toString()),
    projectDueDate: DateTime.parse(json["projectDueDate"]?? DateTime.now().toString()),
    completeDate: DateTime.parse(json["completeDate"]?? DateTime.now().toString()),
    perDiemPenalty: json["perDiemPenalty"]??0.0,
    // perDiemBonus: json["perDiemBonus"]??0,
    projectedCost: json["projectedCost"]??0.0,
    unit: json["unit"]??0,
    budget: json["budget"]??0.0,
    actualCost: json["actualCost"]??0.0,
    percentOfBudget: json["percentOfBudget"]??0,
    costOverRuns: json["costOverRuns"]??0.0,
    // parentId: json["parentID"],
    workOrderTypeId: json["workOrderTypeID"]??0,
    // workOrderType: json["workOrderType"],
    specialTerms: json["specialTerms"]??'',
    // contractorVerification: json["contractorVerification"],
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    type: json["type"]??'',
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]?? DateTime.now().toString()),
    // modifiedBy: json["modifiedBy"],
    modifiedOn: DateTime.parse(json["modifiedOn"]?? DateTime.now().toString()),
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "workOrderID": workOrderId,
    "workOrderDate": workOrderDate,
    "workOrderStatusID": workOrderStatusId,
    // "workOrderStatus": workOrderStatus,
    "workOrderDetails": workOrderDetails,
    "propertyID": propertyId,
    // "property": property,
    "companyID": companyId,
    // "company": company,
    "projectStartDate": projectStartDate,
    "projectDueDate": projectDueDate,
    "completeDate": completeDate,
    "perDiemPenalty": perDiemPenalty,
    // "perDiemBonus": perDiemBonus,
    "projectedCost": projectedCost,
    "unit": unit,
    "budget": budget,
    "actualCost": actualCost,
    "percentOfBudget": percentOfBudget,
    "costOverRuns": costOverRuns,
    // "parentID": parentId,
    "workOrderTypeID": workOrderTypeId,
    // "workOrderType": workOrderType,
    "specialTerms": specialTerms,
    // "contractorVerification": contractorVerification,
    "customerId": customerId,
    // "customer": customer,
    "type": type,
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
