// To parse this JSON data, do
//
//     final cityGetByIdListModel = cityGetByIdListModelFromJson(jsonString);

import 'dart:convert';

CityGetByIdListModel cityGetByIdListModelFromJson(String str) =>
    CityGetByIdListModel.fromJson(json.decode(str));

// String cityGetByIdListModelToJson(CityGetByIdListModel data) => json.encode(data.toJson());

class CityGetByIdListModel {
  int statusCode;
  List<CityGetByIdData> data;

  CityGetByIdListModel({
    required this.statusCode,
    required this.data,
  });

  factory CityGetByIdListModel.fromJson(Map<String, dynamic> json) =>
      CityGetByIdListModel(
        statusCode: json["statusCode"] ?? 0,
        data:
            List<CityGetByIdData>.from(json["data"].map((x) => CityGetByIdData.fromJson(x)) ?? {}),
      );

  // Map<String, dynamic> toJson() => {
  //     "statusCode": statusCode,
  //     "data": List<dynamic>.from(data.map((x) => x.toJson())),
  // };
}

class CityGetByIdData {
  int cityId;
  String cityName;
  int stateId;
  // dynamic state;
  // int customerId;
  // dynamic customer;
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

  CityGetByIdData({
    required this.cityId,
    required this.cityName,
    required this.stateId,
    // this.state,
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

  factory CityGetByIdData.fromJson(Map<String, dynamic> json) => CityGetByIdData(
        cityId: json["cityId"],
        cityName: json["cityName"],
        stateId: json["stateID"],
        // state: json["state"],
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

  // Map<String, dynamic> toJson() => {
  //     "cityId": cityId,
  //     "cityName": cityName,
  //     "stateID": stateId,
  //     "state": state,
  //     "customerId": customerId,
  //     "customer": customer,
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
  // };
}
