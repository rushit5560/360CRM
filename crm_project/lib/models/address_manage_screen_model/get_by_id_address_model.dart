// To parse this JSON data, do
//
//     final updateAddressModel = updateAddressModelFromJson(jsonString);

import 'dart:convert';

UpdateAddressModel updateAddressModelFromJson(String str) =>
    UpdateAddressModel.fromJson(json.decode(str));

// String updateAddressModelToJson(UpdateAddressModel data) => json.encode(data.toJson());

class UpdateAddressModel {
  int statusCode;
  AddressData data;

  UpdateAddressModel({
    required this.statusCode,
    required this.data,
  });

  factory UpdateAddressModel.fromJson(Map<String, dynamic> json) =>
      UpdateAddressModel(
        statusCode: json["statusCode"] ?? 0,
        data: AddressData.fromJson(json["data"] ?? {}),
      );

  // Map<String, dynamic> toJson() => {
  //     "statusCode": statusCode,
  //     "data": data.toJson(),
  // };
}

class AddressData {
  int addressId;
  // dynamic contactId;
  // dynamic contact;
  String address1;
  String address2;
  String zip;
  String type;
  int addressTypeId;
  AddressType addressType;
  // int companyId;
  // dynamic company;
  int cityId;
  AddressType city;
  int stateId;
  AddressType state;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // dynamic createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  AddressData({
    required this.addressId,
    // this.contactId,
    // this.contact,
    required this.address1,
    required this.address2,
    required this.zip,
    required this.type,
    required this.addressTypeId,
    required this.addressType,
    // required this.companyId,
    // this.company,
    required this.cityId,
    required this.city,
    required this.stateId,
    required this.state,
    // required this.pageNumber,
    // required this.pageSize,
    // required this.totalRecords,
    // this.createdBy,
    // required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    // required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
        addressId: json["addressId"] ?? 0,
        // contactId: json["contactID"],
        // contact: json["contact"],
        address1: json["address1"] ?? "",
        address2: json["address2"] ?? "",
        zip: json["zip"] ?? "",
        type: json["type"] ?? "",
        addressTypeId: json["addressTypeId"] ?? 0,
        addressType: AddressType.fromJson(json["addressType"] ?? {}),
        // companyId: json["companyID"],
        // company: json["company"],
        cityId: json["cityID"] ?? 0,
        city: AddressType.fromJson(json["city"] ?? {}),
        stateId: json["stateID"] ?? 0,
        state: AddressType.fromJson(json["state"] ?? {}),
        // pageNumber: json["pageNumber"],
        // pageSize: json["pageSize"],
        // totalRecords: json["totalRecords"],
        // createdBy: json["createdBy"],
        // createdOn: DateTime.parse(json["createdOn"]),
        // modifiedBy: json["modifiedBy"],
        // modifiedOn: json["modifiedOn"],
        isActive: json["isActive"] ?? false,
        // isDeleted: json["isDeleted"],
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
      );

  // Map<String, dynamic> toJson() => {
  //     "addressId": addressId,
  //     "contactID": contactId,
  //     "contact": contact,
  //     "address1": address1,
  //     "address2": address2,
  //     "zip": zip,
  //     "type": type,
  //     "addressTypeId": addressTypeId,
  //     "addressType": addressType.toJson(),
  //     "companyID": companyId,
  //     "company": company,
  //     "cityID": cityId,
  //     "city": city.toJson(),
  //     "stateID": stateId,
  //     "state": state.toJson(),
  //     "pageNumber": pageNumber,
  //     "pageSize": pageSize,
  //     "totalRecords": totalRecords,
  //     "createdBy": createdBy,
  //     "createdOn": createdOn.toIso8601String(),
  //     "modifiedBy": modifiedBy,
  //     "modifiedOn": modifiedOn,
  //     "isActive": isActive,
  //     "isDeleted": isDeleted,
  //     "createdUser": createdUser,
  //     "modifiedUser": modifiedUser,
  // };
}

class AddressType {
  int? addressTypeId;
  String? addressTypes;
  // int customerId;
  // dynamic customer;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // DateTime? modifiedOn;
  bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;
  int? cityId;
  String? cityName;
  int? stateId;
  // dynamic state;
  String? stateName;
  // String? shortName;

  AddressType({
    this.addressTypeId,
    this.addressTypes,
    // required this.customerId,
    // this.customer,
    // required this.pageNumber,
    // required this.pageSize,
    // required this.totalRecords,
    // required this.createdBy,
    // required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    // required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
    this.cityId,
    this.cityName,
    this.stateId,
    // this.state,
    this.stateName,
    // this.shortName,
  });

  factory AddressType.fromJson(Map<String, dynamic> json) => AddressType(
        addressTypeId: json["addressTypeId"] ?? 0,
        addressTypes: json["addressTypes"] ?? "",
        // customerId: json["customerId"],
        // customer: json["customer"],
        // pageNumber: json["pageNumber"],
        // pageSize: json["pageSize"],
        // totalRecords: json["totalRecords"],
        // createdBy: json["createdBy"],
        // createdOn: DateTime.parse(json["createdOn"]),
        // modifiedBy: json["modifiedBy"],
        // modifiedOn: json["modifiedOn"] == null ? null : DateTime.parse(json["modifiedOn"]),
        isActive: json["isActive"] ?? false,
        // isDeleted: json["isDeleted"],
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
        cityId: json["cityId"] ?? 0,
        cityName: json["cityName"] ?? "",
        stateId: json["stateID"] ?? 0,
        // state: json["state"],
        stateName: json["stateName"] ?? "",
        // shortName: json["shortName"],
      );

  // Map<String, dynamic> toJson() => {
  //     "addressTypeId": addressTypeId,
  //     "addressTypes": addressTypes,
  //     "customerId": customerId,
  //     "customer": customer,
  //     "pageNumber": pageNumber,
  //     "pageSize": pageSize,
  //     "totalRecords": totalRecords,
  //     "createdBy": createdBy,
  //     "createdOn": createdOn.toIso8601String(),
  //     "modifiedBy": modifiedBy,
  //     "modifiedOn": modifiedOn?.toIso8601String(),
  //     "isActive": isActive,
  //     "isDeleted": isDeleted,
  //     "createdUser": createdUser,
  //     "modifiedUser": modifiedUser,
  //     "cityId": cityId,
  //     "cityName": cityName,
  //     "stateID": stateId,
  //     "state": state,
  //     "stateName": stateName,
  //     "shortName": shortName,
  // };
}
