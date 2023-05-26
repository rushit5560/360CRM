import 'dart:convert';

ActiveContactListModel activeContactListModelFromJson(String str) => ActiveContactListModel.fromJson(json.decode(str));

String activeContactListModelToJson(ActiveContactListModel data) => json.encode(data.toJson());

class ActiveContactListModel {
  int statusCode;
  bool success;
  List<ContactData> data;

  ActiveContactListModel({
    required this.statusCode,
    required this.success,
    required this.data,
  });

  factory ActiveContactListModel.fromJson(Map<String, dynamic> json) => ActiveContactListModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    data: List<ContactData>.from((json["data"] ?? []).map((x) => ContactData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ContactData {
  int? contactId;
  // int companyId;
  // dynamic company;
  // int contactTypeId;
  // dynamic contactType;
  // int contactCategoryId;
  // dynamic contactCategory;
  // int customerId;
  // dynamic customer;
  // dynamic areaOfInterestId;
  // dynamic areaOfInterest;
  // dynamic propertyId;
  // dynamic property;
  // dynamic prospectId;
  // dynamic prospect;
  // dynamic spouseId;
  // dynamic spouse;
  String? firstName;
  // String middleName;
  String? lastName;
  // String contactStatus;
  // dynamic tenant;
  // String phone;
  // String phone2;
  // String mobilePhone;
  // String fax;
  // String otherPhone;
  // String email1;
  // String email2;
  // bool optOut;
  // DateTime optOutDate;
  // String messengerClient;
  // String messengerId;
  // String ssn;
  // dynamic dob;
  // String middleFicoScore;
  // String maritalStatus;
  // String dependants;
  // bool usCitizen;
  // String employer;
  // String position;
  // String businessPhone;
  // String typeOfBusiness;
  // String lengthEmployed;
  // String yearsLineOfWork;
  // bool selfEmployed;
  // String prevEmployer;
  // String prevPosition;
  // String prevBusinessPhone;
  // String prevLengthEmployed;
  // dynamic currentYearAgi;
  // dynamic debtIncomeRatio;
  // dynamic grossMonthlyIncome;
  // dynamic monthlyCashFlow;
  // dynamic monthlyHousingExpense;
  // dynamic netMonthlyIncome;
  // dynamic otherIncomeExclChildSupport;
  // dynamic periodBeginning;
  // dynamic periodEnding;
  // dynamic previousYrAgi;
  // dynamic revolvingResourcesBalance;
  // dynamic revolvingResourcesLimit;
  // bool bankruptcy;
  // String bkComments;
  // dynamic bkDischargeDate;
  // dynamic creditReportDate;
  // String contractorLicense;
  // String contractorState;
  // bool newImport;
  // String title;
  // String type;
  // dynamic id;
  // dynamic roleId;
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

  ContactData({
    this.contactId,
    // this.companyId,
    // this.company,
    // this.contactTypeId,
    // this.contactType,
    // this.contactCategoryId,
    // this.contactCategory,
    // this.customerId,
    // this.customer,
    // this.areaOfInterestId,
    // this.areaOfInterest,
    // this.propertyId,
    // this.property,
    // this.prospectId,
    // this.prospect,
    // this.spouseId,
    // this.spouse,
    this.firstName,
    // this.middleName,
    this.lastName,
    // this.contactStatus,
    // this.tenant,
    // this.phone,
    // this.phone2,
    // this.mobilePhone,
    // this.fax,
    // this.otherPhone,
    // this.email1,
    // this.email2,
    // this.optOut,
    // this.optOutDate,
    // this.messengerClient,
    // this.messengerId,
    // this.ssn,
    // this.dob,
    // this.middleFicoScore,
    // this.maritalStatus,
    // this.dependants,
    // this.usCitizen,
    // this.employer,
    // this.position,
    // this.businessPhone,
    // this.typeOfBusiness,
    // this.lengthEmployed,
    // this.yearsLineOfWork,
    // this.selfEmployed,
    // this.prevEmployer,
    // this.prevPosition,
    // this.prevBusinessPhone,
    // this.prevLengthEmployed,
    // this.currentYearAgi,
    // this.debtIncomeRatio,
    // this.grossMonthlyIncome,
    // this.monthlyCashFlow,
    // this.monthlyHousingExpense,
    // this.netMonthlyIncome,
    // this.otherIncomeExclChildSupport,
    // this.periodBeginning,
    // this.periodEnding,
    // this.previousYrAgi,
    // this.revolvingResourcesBalance,
    // this.revolvingResourcesLimit,
    // this.bankruptcy,
    // this.bkComments,
    // this.bkDischargeDate,
    // this.creditReportDate,
    // this.contractorLicense,
    // this.contractorState,
    // this.newImport,
    // this.title,
    // this.type,
    // this.id,
    // this.roleId,
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

  factory ContactData.fromJson(Map<String, dynamic> json) => ContactData(
    contactId: json["contactID"] ?? 0,
    // companyId: json["companyId"],
    // company: json["company"],
    // contactTypeId: json["contactTypeId"],
    // contactType: json["contactType"],
    // contactCategoryId: json["contactCategoryId"],
    // contactCategory: json["contactCategory"],
    // customerId: json["customerId"],
    // customer: json["customer"],
    // areaOfInterestId: json["areaOfInterestId"],
    // areaOfInterest: json["areaOfInterest"],
    // propertyId: json["propertyID"],
    // property: json["property"],
    // prospectId: json["prospectID"],
    // prospect: json["prospect"],
    // spouseId: json["spouseID"],
    // spouse: json["spouse"],
    firstName: json["firstName"] ?? "",
    // middleName: json["middleName"],
    lastName: json["lastName"] ?? "",
    // contactStatus: json["contactStatus"],
    // tenant: json["tenant"],
    // phone: json["phone"],
    // phone2: json["phone2"],
    // mobilePhone: json["mobilePhone"],
    // fax: json["fax"],
    // otherPhone: json["otherPhone"],
    // email1: json["email1"],
    // email2: json["email2"],
    // optOut: json["optOut"],
    // optOutDate: DateTime.parse(json["optOutDate"]),
    // messengerClient: json["messengerClient"],
    // messengerId: json["messengerID"],
    // ssn: json["ssn"],
    // dob: json["dob"],
    // middleFicoScore: json["middleFicoScore"],
    // maritalStatus: json["maritalStatus"],
    // dependants: json["dependants"],
    // usCitizen: json["usCitizen"],
    // employer: json["employer"],
    // position: json["position"],
    // businessPhone: json["businessPhone"],
    // typeOfBusiness: json["typeOfBusiness"],
    // lengthEmployed: json["lengthEmployed"],
    // yearsLineOfWork: json["yearsLineOfWork"],
    // selfEmployed: json["selfEmployed"],
    // prevEmployer: json["prevEmployer"],
    // prevPosition: json["prevPosition"],
    // prevBusinessPhone: json["prevBusinessPhone"],
    // prevLengthEmployed: json["prevLengthEmployed"],
    // currentYearAgi: json["currentYearAGI"],
    // debtIncomeRatio: json["debtIncomeRatio"],
    // grossMonthlyIncome: json["grossMonthlyIncome"],
    // monthlyCashFlow: json["monthlyCashFlow"],
    // monthlyHousingExpense: json["monthlyHousingExpense"],
    // netMonthlyIncome: json["netMonthlyIncome"],
    // otherIncomeExclChildSupport: json["otherIncomeExclChildSupport"],
    // periodBeginning: json["periodBeginning"],
    // periodEnding: json["periodEnding"],
    // previousYrAgi: json["previousYrAGI"],
    // revolvingResourcesBalance: json["revolvingResourcesBalance"],
    // revolvingResourcesLimit: json["revolvingResourcesLimit"],
    // bankruptcy: json["bankruptcy"],
    // bkComments: json["bkComments"],
    // bkDischargeDate: json["bkDischargeDate"],
    // creditReportDate: json["creditReportDate"],
    // contractorLicense: json["contractorLicense"],
    // contractorState: json["contractorState"],
    // newImport: json["newImport"],
    // title: json["title"],
    // type: json["type"],
    // id: json["id"],
    // roleId: json["roleId"],
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
