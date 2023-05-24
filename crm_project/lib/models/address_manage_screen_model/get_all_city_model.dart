// To parse this JSON data, do
//
//     final getAllCityModel = getAllCityModelFromJson(jsonString);

import 'dart:convert';

GetAllCityModel getAllCityModelFromJson(String str) =>
    GetAllCityModel.fromJson(json.decode(str));

// String getAllCityModelToJson(GetAllCityModel data) => json.encode(data.toJson());

class GetAllCityModel {
  int statusCode;
  List<CityList> data;

  GetAllCityModel({
    required this.statusCode,
    required this.data,
  });

  factory GetAllCityModel.fromJson(Map<String, dynamic> json) =>
      GetAllCityModel(
        statusCode: json["statusCode"],
        data:
            List<CityList>.from(json["data"].map((x) => CityList.fromJson(x))),
      );

// Map<String, dynamic> toJson() => {
//   "statusCode": statusCode,
//   "data": List<dynamic>.from(data.map((x) => x.toJson())),
// };
}

class CityList {
  int cityId;
  String cityName;
  int stateId;
  int customerId;

  // dynamic state;
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

  CityList({
    required this.cityId,
    required this.cityName,
    required this.stateId,
    required this.customerId,

    // this.state,
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

  factory CityList.fromJson(Map<String, dynamic> json) => CityList(
        cityId: json["cityId"],
        cityName: json["cityName"],
        stateId: json["stateID"],
        customerId: json["customerId"],

        // state: json["state"],
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
//   "cityId": cityId,
//   "cityName": cityName,
//   "stateID": stateId,
//   "state": state,
//   "customerId": customerId,
//   "customer": customer,
//   "pageNumber": pageNumber,
//   "pageSize": pageSize,
//   "totalRecords": totalRecords,
//   "createdBy": createdBy,
//   "createdOn": createdOn.toIso8601String(),
//   "modifiedBy": modifiedBy,
//   "modifiedOn": modifiedOn.toIso8601String(),
//   "isActive": isActive,
//   "isDeleted": isDeleted,
//   "createdUser": createdUser,
//   "modifiedUser": modifiedUser,
// };
}
