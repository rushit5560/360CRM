// To parse this JSON data, do
//
//     final activeWorkOrderListModel = activeWorkOrderListModelFromJson(jsonString);

import 'dart:convert';

ActiveWorkOrderListModel activeWorkOrderListModelFromJson(String str) => ActiveWorkOrderListModel.fromJson(json.decode(str));

String activeWorkOrderListModelToJson(ActiveWorkOrderListModel data) => json.encode(data.toJson());

class ActiveWorkOrderListModel {
  int statusCode;
  List<WorkOrderData> data;

  ActiveWorkOrderListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActiveWorkOrderListModel.fromJson(Map<String, dynamic> json) => ActiveWorkOrderListModel(
    statusCode: json["statusCode"] ?? 0,
    data: List<WorkOrderData>.from((json["data"] ?? []).map((x) => WorkOrderData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class WorkOrderData {
  int? workOrderId;
  // DateTime workOrderDate;
  // int workOrderStatusId;
  // dynamic workOrderStatus;
  String? workOrderDetails;
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

  WorkOrderData({
    this.workOrderId,
    // this.workOrderDate,
    // this.workOrderStatusId,
    // this.workOrderStatus,
    this.workOrderDetails,
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

  factory WorkOrderData.fromJson(Map<String, dynamic> json) => WorkOrderData(
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
