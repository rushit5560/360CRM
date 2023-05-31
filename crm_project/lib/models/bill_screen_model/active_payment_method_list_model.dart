import 'dart:convert';

ActivePaymentMethodListModel activePaymentMethodListModelFromJson(String str) => ActivePaymentMethodListModel.fromJson(json.decode(str));

String activePaymentMethodListModelToJson(ActivePaymentMethodListModel data) => json.encode(data.toJson());

class ActivePaymentMethodListModel {
  int statusCode;
  List<PaymentMethodData> data;

  ActivePaymentMethodListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActivePaymentMethodListModel.fromJson(Map<String, dynamic> json) => ActivePaymentMethodListModel(
    statusCode: json["statusCode"] ?? 0,
    data: List<PaymentMethodData>.from((json["data"] ?? []).map((x) => PaymentMethodData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PaymentMethodData {
  int? paymentMethodsId;
  String? paymentMethods;
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

  PaymentMethodData({
    this.paymentMethodsId,
    this.paymentMethods,
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

  factory PaymentMethodData.fromJson(Map<String, dynamic> json) => PaymentMethodData(
    paymentMethodsId: json["paymentMethodsId"] ?? 0,
    paymentMethods: json["paymentMethods"] ?? "",
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
