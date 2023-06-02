import 'dart:convert';

RepairAreaListModel repairAreaListModelFromJson(String str) => RepairAreaListModel.fromJson(json.decode(str));

String repairAreaListModelToJson(RepairAreaListModel data) => json.encode(data.toJson());

class RepairAreaListModel {
  int statusCode;
  List<RepairAreaData> data;

  RepairAreaListModel({
    required this.statusCode,
    required this.data,
  });

  factory RepairAreaListModel.fromJson(Map<String, dynamic> json) => RepairAreaListModel(
    statusCode: json["statusCode"] ?? 0,
    data: List<RepairAreaData>.from((json["data"] ?? []).map((x) => RepairAreaData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class RepairAreaData {
  int? repairAreaId;
  String? repairAreas;
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

  RepairAreaData({
    this.repairAreaId,
    this.repairAreas,
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

  factory RepairAreaData.fromJson(Map<String, dynamic> json) => RepairAreaData(
    repairAreaId: json["repairAreaId"] ?? "",
    repairAreas: json["repairAreas"] ?? "",
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
