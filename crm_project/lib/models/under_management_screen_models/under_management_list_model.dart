// To parse this JSON data, do
//
//     final underManagmentListModel = underManagmentListModelFromJson(jsonString);

import 'dart:convert';

UnderManagementListModel underManagementListModelFromJson(String str) => UnderManagementListModel.fromJson(json.decode(str));

String underManagementListModelToJson(UnderManagementListModel data) => json.encode(data.toJson());

class UnderManagementListModel {
  int statusCode;
  bool success;
  List<UnderManagementData> data;

  UnderManagementListModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  factory UnderManagementListModel.fromJson(Map<String, dynamic> json) => UnderManagementListModel(
    statusCode: json["statusCode"]??0,
    success: json["success"]??'',
    data: List<UnderManagementData>.from((json["data"]??{}).map((x) => UnderManagementData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UnderManagementData {
  int propertyId;
  String propertyName;
  String address;
  DateTime startDate;
  DateTime endDate;
  String leaseRenewalTypeId;
  String type;
  // dynamic companyId;

  UnderManagementData({
    required this.propertyId,
    required this.propertyName,
    required this.address,
    required this.startDate,
    required this.endDate,
    required this.leaseRenewalTypeId,
    required this.type,
    // this.companyId,
  });

  factory UnderManagementData.fromJson(Map<String, dynamic> json) => UnderManagementData(
    propertyId: json["propertyId"]??0,
    propertyName: json["propertyName"]??'',
    address: json["address"]??'',
    startDate: DateTime.parse(json["startDate"]??DateTime.now().toString()),
    endDate: DateTime.parse(json["endDate"]??DateTime.now().toString()),
    leaseRenewalTypeId: (json["leaseRenewalTypeID"]?? '').toString(),
    type: json["type"]??'',
    // companyId: json["companyID"],
  );

  Map<String, dynamic> toJson() => {
    "propertyId": propertyId,
    "propertyName": propertyName,
    "address": address,
    "startDate": startDate,
    "endDate": endDate,
    "leaseRenewalTypeID": leaseRenewalTypeId,
    "type": type,
    // "companyID": companyId,
  };
}
