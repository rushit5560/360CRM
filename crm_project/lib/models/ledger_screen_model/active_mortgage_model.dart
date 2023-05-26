import 'dart:convert';

ActiveMortgageListModel activeMortgageListModelFromJson(String str) => ActiveMortgageListModel.fromJson(json.decode(str));

String activeMortgageListModelToJson(ActiveMortgageListModel data) => json.encode(data.toJson());

class ActiveMortgageListModel {
  int statusCode;
  List<MortgageData> data;

  ActiveMortgageListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActiveMortgageListModel.fromJson(Map<String, dynamic> json) => ActiveMortgageListModel(
    statusCode: json["statusCode"] ?? 0,
    data: List<MortgageData>.from((json["data"] ?? []).map((x) => MortgageData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MortgageData {
  int? mortgageId;
  // int propertyId;
  // dynamic property;
  String? mortgageName;
  // Status status;
  // int originalAmount;
  // int interestRate;
  // bool interestOnly;
  // DateTime dateOpened;
  // DateTime firstPaymentDue;
  // int monthlyPayment;
  // int gracePeriod;
  // int lateFee;
  // int companyId;
  // dynamic company;
  // String lenderContact;
  // String lenderPhone;
  // LenderEmail lenderEmail;
  // String lenderAddress;
  // String loanAccountNumber;
  // int lienPositionId;
  // dynamic lienPosition;
  // int loanTerms;
  // bool prePaymentPenalty;
  // String prePaymentDetails;
  // DateTime balloonPayment;
  // int prospectId;
  // dynamic prospect;
  // Comments comments;
  // Type type;
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

  MortgageData({
    this.mortgageId,
    // this.propertyId,
    // this.property,
    this.mortgageName,
    // this.status,
    // this.originalAmount,
    // this.interestRate,
    // this.interestOnly,
    // this.dateOpened,
    // this.firstPaymentDue,
    // this.monthlyPayment,
    // this.gracePeriod,
    // this.lateFee,
    // this.companyId,
    // this.company,
    // this.lenderContact,
    // this.lenderPhone,
    // this.lenderEmail,
    // this.lenderAddress,
    // this.loanAccountNumber,
    // this.lienPositionId,
    // this.lienPosition,
    // this.loanTerms,
    // this.prePaymentPenalty,
    // this.prePaymentDetails,
    // this.balloonPayment,
    // this.prospectId,
    // this.prospect,
    // this.comments,
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

  factory MortgageData.fromJson(Map<String, dynamic> json) => MortgageData(
    mortgageId: json["mortgageId"] ?? 0,
    // propertyId: json["propertyID"],
    // property: json["property"],
    mortgageName: json["mortgageName"] ?? "",
    // status: statusValues.map[json["status"]],
    // originalAmount: json["originalAmount"],
    // interestRate: json["interestRate"],
    // interestOnly: json["interestOnly"],
    // dateOpened: DateTime.parse(json["dateOpened"]),
    // firstPaymentDue: DateTime.parse(json["firstPaymentDue"]),
    // monthlyPayment: json["monthlyPayment"],
    // gracePeriod: json["gracePeriod"],
    // lateFee: json["lateFee"],
    // companyId: json["companyID"],
    // company: json["company"],
    // lenderContact: json["lenderContact"],
    // lenderPhone: json["lenderPhone"],
    // lenderEmail: lenderEmailValues.map[json["lenderEmail"]],
    // lenderAddress: json["lenderAddress"],
    // loanAccountNumber: json["loanAccountNumber"],
    // lienPositionId: json["lienPositionId"],
    // lienPosition: json["lienPosition"],
    // loanTerms: json["loanTerms"],
    // prePaymentPenalty: json["prePaymentPenalty"],
    // prePaymentDetails: json["prePaymentDetails"],
    // balloonPayment: DateTime.parse(json["balloonPayment"]),
    // prospectId: json["prospectID"],
    // prospect: json["prospect"],
    // comments: commentsValues.map[json["comments"]],
    // type: typeValues.map[json["type"]],
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
