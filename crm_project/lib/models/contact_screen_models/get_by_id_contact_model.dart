// To parse this JSON data, do
//
//     final getByIdContactModel = getByIdContactModelFromJson(jsonString);

import 'dart:convert';

GetByIdContactModel getByIdContactModelFromJson(String str) =>
    GetByIdContactModel.fromJson(json.decode(str));

class GetByIdContactModel {
  int statusCode;
  ContactData data;

  GetByIdContactModel({
    required this.statusCode,
    required this.data,
  });

  factory GetByIdContactModel.fromJson(Map<String, dynamic> json) =>
      GetByIdContactModel(
        statusCode: json["statusCode"] ?? 0,
        data: ContactData.fromJson(json["data"] ?? {}),
      );
}

class ContactData {
  int mtmCompanyContactId;
  int companyId;
  Company company;
  int contactId;
  Contact contact;
  int contactRoleId;
  ContactRole contactRole;
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

  ContactData({
    required this.mtmCompanyContactId,
    required this.companyId,
    required this.company,
    required this.contactId,
    required this.contact,
    required this.contactRoleId,
    required this.contactRole,
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

  factory ContactData.fromJson(Map<String, dynamic> json) => ContactData(
        mtmCompanyContactId: json["mtmCompanyContactId"] ?? 0,
        companyId: json["companyID"] ?? 0,
        company: Company.fromJson(json["company"] ?? {}),
        contactId: json["contactID"] ?? 0,
        contact: Contact.fromJson(json["contact"] ?? {}),
        contactRoleId: json["contactRoleID"] ?? 0,
        contactRole: ContactRole.fromJson(json["contactRole"] ?? {}),
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
}

class Company {
  int companyId;
  String companyName;
  int companyTypeId;
  // String phone;
  // String phone2;
  // String fax;
  // String website;
  // String email;
  // dynamic companyType;
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

  Company({
    required this.companyId,
    required this.companyName,
    required this.companyTypeId,
    // required this.phone,
    // required this.phone2,
    // required this.fax,
    // required this.website,
    // required this.email,
    // this.companyType,
    // required this.customerId,
    // this.customer,
    // required this.pageNumber,
    // required this.pageSize,
    // required this.totalRecords,
    // required this.createdBy,
    // required this.createdOn,
    // this.modifiedBy,
    // required this.modifiedOn,
    // required this.isActive,
    // required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyId: json["companyId"] ?? 0,
        companyName: json["companyName"] ?? "",
        companyTypeId: json["companyTypeId"] ?? 0,
        // phone: json["phone"],
        // phone2: json["phone2"],
        // fax: json["fax"],
        // website: json["website"],
        // email: json["email"],
        // companyType: json["companyType"],
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

class Contact {
  int contactId;
  int companyId;
  // dynamic company;
  int contactTypeId;
  // dynamic contactType;
  int contactCategoryId;
  // dynamic contactCategory;
  int customerId;
  // dynamic customer;
  int areaOfInterestId;
  // dynamic areaOfInterest;
  // dynamic propertyId;
  // dynamic property;
  // dynamic prospectId;
  // dynamic prospect;
  // dynamic spouseId;
  // dynamic spouse;
  String firstName;
  String middleName;
  String lastName;
  // String contactStatus;
  // dynamic tenant;
  String phone;
  String phone2;
  String mobilePhone;
  String fax;
  String otherPhone;
  String email1;
  String email2;
  bool optOut;
  DateTime optOutDate;
  String messengerClient;
  String messengerId;
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
  // dynamic createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  Contact({
    required this.contactId,
    required this.companyId,
    // this.company,
    required this.contactTypeId,
    // this.contactType,
    required this.contactCategoryId,
    // this.contactCategory,
    required this.customerId,
    // this.customer,
    required this.areaOfInterestId,
    // this.areaOfInterest,
    // this.propertyId,
    // this.property,
    // this.prospectId,
    // this.prospect,
    // this.spouseId,
    // this.spouse,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    // required this.contactStatus,
    // this.tenant,
    required this.phone,
    required this.phone2,
    required this.mobilePhone,
    required this.fax,
    required this.otherPhone,
    required this.email1,
    required this.email2,
    required this.optOut,
    required this.optOutDate,
    required this.messengerClient,
    required this.messengerId,
    // required this.ssn,
    // this.dob,
    // required this.middleFicoScore,
    // required this.maritalStatus,
    // required this.dependants,
    // required this.usCitizen,
    // required this.employer,
    // required this.position,
    // required this.businessPhone,
    // required this.typeOfBusiness,
    // required this.lengthEmployed,
    // required this.yearsLineOfWork,
    // required this.selfEmployed,
    // required this.prevEmployer,
    // required this.prevPosition,
    // required this.prevBusinessPhone,
    // required this.prevLengthEmployed,
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
    // required this.bankruptcy,
    // required this.bkComments,
    // this.bkDischargeDate,
    // this.creditReportDate,
    // required this.contractorLicense,
    // required this.contractorState,
    // required this.newImport,
    // required this.title,
    // required this.type,
    // this.id,
    // this.roleId,
    // required this.pageNumber,
    // required this.pageSize,
    // required this.totalRecords,
    // this.createdBy,
    // required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    // required this.isActive,
    // required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        contactId: json["contactID"] ?? 0,
        companyId: json["companyId"] ?? 0,
        // company: json["company"],
        contactTypeId: json["contactTypeId"] ?? 0,
        // contactType: json["contactType"],
        contactCategoryId: json["contactCategoryId"] ?? 0,
        // contactCategory: json["contactCategory"],
        customerId: json["customerId"] ?? 0,
        // customer: json["customer"],
        areaOfInterestId: json["areaOfInterestId"] ?? 0,
        // areaOfInterest: json["areaOfInterest"],
        // propertyId: json["propertyID"],
        // property: json["property"],
        // prospectId: json["prospectID"],
        // prospect: json["prospect"],
        // spouseId: json["spouseID"],
        // spouse: json["spouse"],
        firstName: json["firstName"] ?? "",
        middleName: json["middleName"] ?? "",
        lastName: json["lastName"] ?? "",
        // contactStatus: json["contactStatus"],
        // tenant: json["tenant"],
        phone: json["phone"] ?? "",
        phone2: json["phone2"] ?? "",
        mobilePhone: json["mobilePhone"] ?? "",
        fax: json["fax"] ?? "",
        otherPhone: json["otherPhone"] ?? "",
        email1: json["email1"] ?? "",
        email2: json["email2"] ?? "",
        optOut: json["optOut"] ?? false,
        optOutDate:
            DateTime.parse(json["optOutDate"] ?? DateTime.now().toString()),
        messengerClient: json["messengerClient"] ?? "",
        messengerId: json["messengerID"] ?? "",
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
        // modifiedOn: json["modifiedOn"],
        // isActive: json["isActive"],
        // isDeleted: json["isDeleted"],
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
      );
}

class ContactRole {
  int contactRoleId;
  String name;
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

  ContactRole({
    required this.contactRoleId,
    required this.name,
    // required this.customerId,
    // this.customer,
    // required this.pageNumber,
    // required this.pageSize,
    // required this.totalRecords,
    // required this.createdBy,
    // required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    // required this.isActive,
    // required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory ContactRole.fromJson(Map<String, dynamic> json) => ContactRole(
        contactRoleId: json["contactRoleID"] ?? 0,
        name: json["name"] ?? "",
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
