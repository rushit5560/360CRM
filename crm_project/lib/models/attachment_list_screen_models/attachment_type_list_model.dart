// To parse this JSON data, do
//
//     final attachmentTypeListModel = attachmentTypeListModelFromJson(jsonString);

import 'dart:convert';

AttachmentTypeListModel attachmentTypeListModelFromJson(String str) => AttachmentTypeListModel.fromJson(json.decode(str));

String attachmentTypeListModelToJson(AttachmentTypeListModel data) => json.encode(data.toJson());

class AttachmentTypeListModel {
  int statusCode;
  List<attachmentTypeList> data;

  AttachmentTypeListModel({
    required this.statusCode,
    required this.data,
  });

  factory AttachmentTypeListModel.fromJson(Map<String, dynamic> json) => AttachmentTypeListModel(
    statusCode: json["statusCode"]??0,
    data: List<attachmentTypeList>.from((json["data"]??{}).map((x) => attachmentTypeList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class attachmentTypeList {
  int attachmentTypeId;
  String attachmentTypes;
  int customerId;
  // dynamic customer;
  int pageNumber;
  int pageSize;
  int totalRecords;
  String createdBy;
  DateTime createdOn;
  String? modifiedBy;
  DateTime? modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  attachmentTypeList({
    required this.attachmentTypeId,
    required this.attachmentTypes,
    required this.customerId,
    // this.customer,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory attachmentTypeList.fromJson(Map<String, dynamic> json) => attachmentTypeList(
    attachmentTypeId: json["attachmentTypeId"]??0,
    attachmentTypes: json["attachmentTypes"]??'',
    customerId: json["customerId"]??0,
    // customer: json["customer"],
    pageNumber: json["pageNumber"]??0,
    pageSize: json["pageSize"]??0,
    totalRecords: json["totalRecords"]??0,
    createdBy: json["createdBy"]??'',
    createdOn: DateTime.parse(json["createdOn"]??DateTime.now()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"] == null ? null : DateTime.parse(json["modifiedOn"]),
    isActive: json["isActive"]??false,
    isDeleted: json["isDeleted"]??true,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "attachmentTypeId": attachmentTypeId,
    "attachmentTypes": attachmentTypes,
    "customerId": customerId,
    // "customer": customer,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "totalRecords": totalRecords,
    "createdBy": createdBy,
    "createdOn": createdOn.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn?.toIso8601String(),
    "isActive": isActive,
    "isDeleted": isDeleted,
    // "createdUser": createdUser,
    // "modifiedUser": modifiedUser,
  };
}
