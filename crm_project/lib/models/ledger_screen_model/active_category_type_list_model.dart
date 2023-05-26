import 'dart:convert';

ActiveCategoryTypeListModel activeCategoryTypeListModelFromJson(String str) => ActiveCategoryTypeListModel.fromJson(json.decode(str));

String activeCategoryTypeListModelToJson(ActiveCategoryTypeListModel data) => json.encode(data.toJson());

class ActiveCategoryTypeListModel {
  int statusCode;
  List<CategoryTypeData> data;

  ActiveCategoryTypeListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActiveCategoryTypeListModel.fromJson(Map<String, dynamic> json) => ActiveCategoryTypeListModel(
    statusCode: json["statusCode"] ?? 0,
    data: List<CategoryTypeData>.from((json["data"] ?? []).map((x) => CategoryTypeData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoryTypeData {
  int? accountCategoryId;
  String? category;
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

  CategoryTypeData({
    this.accountCategoryId,
    this.category,
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

  factory CategoryTypeData.fromJson(Map<String, dynamic> json) => CategoryTypeData(
    accountCategoryId: json["accountCategoryId"] ?? 0,
    category: json["category"] ?? "",
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

  // Map<String, dynamic> toJson() => {
  //   "accountCategoryId": accountCategoryId,
  //   "category": category,
  //   "customerId": customerId,
  //   "customer": customer,
  //   "pageNumber": pageNumber,
  //   "pageSize": pageSize,
  //   "totalRecords": totalRecords,
  //   "createdBy": createdBy,
  //   "createdOn": createdOn.toIso8601String(),
  //   "modifiedBy": modifiedBy,
  //   "modifiedOn": modifiedOn,
  //   "isActive": isActive,
  //   "isDeleted": isDeleted,
  //   "createdUser": createdUser,
  //   "modifiedUser": modifiedUser,
  // };
}
