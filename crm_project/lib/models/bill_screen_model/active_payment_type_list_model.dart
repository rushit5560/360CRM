import 'dart:convert';

ActivePaymentTypeListModel activePaymentTypeListModelFromJson(String str) => ActivePaymentTypeListModel.fromJson(json.decode(str));

String activePaymentTypeListModelToJson(ActivePaymentTypeListModel data) => json.encode(data.toJson());

class ActivePaymentTypeListModel {
  int statusCode;
  List<PaymentTypeData> data;

  ActivePaymentTypeListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActivePaymentTypeListModel.fromJson(Map<String, dynamic> json) => ActivePaymentTypeListModel(
    statusCode: json["statusCode"] ?? 0,
    data: List<PaymentTypeData>.from((json["data"] ?? []).map((x) => PaymentTypeData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PaymentTypeData {
  int? paymentTypeId;
  String? paymentTypes;
  // int customerId;
  // dynamic customer;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // String modifiedBy;
  // DateTime modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  PaymentTypeData({
    this.paymentTypeId,
    this.paymentTypes,
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

  factory PaymentTypeData.fromJson(Map<String, dynamic> json) => PaymentTypeData(
    paymentTypeId: json["paymentTypeId"] ?? 0,
    paymentTypes: json["paymentTypes"] ?? "",
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

}
