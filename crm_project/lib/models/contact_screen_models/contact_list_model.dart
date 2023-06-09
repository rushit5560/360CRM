// To parse this JSON data, do
//
//     final getContactListModel = getContactListModelFromJson(jsonString);

import 'dart:convert';

GetContactListModel getContactListModelFromJson(String str) =>
    GetContactListModel.fromJson(json.decode(str));

class GetContactListModel {
  int statusCode;
  Data data;

  GetContactListModel({
    required this.statusCode,
    required this.data,
  });

  factory GetContactListModel.fromJson(Map<String, dynamic> json) =>
      GetContactListModel(
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int pageNumber;
  int pageSize;
  // dynamic firstPage;
  // dynamic lastPage;
  int totalPages;
  int totalRecords;
  // dynamic nextPage;
  // dynamic previousPage;
  List<ContactDetails> data;
  bool succeeded;
  // dynamic errors;
  String message;

  Data({
    required this.pageNumber,
    required this.pageSize,
    // this.firstPage,
    // this.lastPage,
    required this.totalPages,
    required this.totalRecords,
    // this.nextPage,
    // this.previousPage,
    required this.data,
    required this.succeeded,
    // this.errors,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        // firstPage: json["firstPage"],
        // lastPage: json["lastPage"],
        totalPages: json["totalPages"] ?? 0,
        totalRecords: json["totalRecords"] ?? 0,
        // nextPage: json["nextPage"],
        // previousPage: json["previousPage"],
        data: List<ContactDetails>.from(
            json["data"].map((x) => ContactDetails.fromJson(x)) ?? {}),
        succeeded: json["succeeded"] ?? false,
        // errors: json["errors"],
        message: json["message"] ?? "",
      );
}

class ContactDetails {
  int mtmCompanyContactId;
  int companyId;
  // Company company;
  int contactId;
  Contact contact;
  int? contactRoleId;
  ContactRoleClass? contactRole;
  int pageNumber;
  int pageSize;
  int totalRecords;
  // dynamic createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  ContactDetails({
    required this.mtmCompanyContactId,
    required this.companyId,
    // required this.company,
    required this.contactId,
    required this.contact,
    this.contactRoleId,
    this.contactRole,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    // this.createdBy,
    // required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory ContactDetails.fromJson(Map<String, dynamic> json) => ContactDetails(
        mtmCompanyContactId: json["mtmCompanyContactId"] ?? 0,
        companyId: json["companyID"] ?? 0,
        // company: Company.fromJson(json["company"] ?? {}),
        contactId: json["contactID"] ?? 0,
        contact: Contact.fromJson(json["contact"] ?? {}),
        contactRoleId: json["contactRoleID"] ?? 0,
        contactRole: json["contactRole"] == null
            ? null
            : ContactRoleClass.fromJson(json["contactRole"] ?? {}),
        pageNumber: json["pageNumber"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        totalRecords: json["totalRecords"] ?? 0,
        // createdBy: json["createdBy"],
        // createdOn: DateTime.parse(json["createdOn"]),
        // modifiedBy: json["modifiedBy"],
        // modifiedOn: json["modifiedOn"],
        isActive: json["isActive"] ?? false,
        isDeleted: json["isDeleted"] ?? false,
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
      );
}

// class Company {
//   int companyId;
//   CompanyName companyName;
//   int companyTypeId;
//   String phone;
//   String phone2;
//   Fax fax;
//   Website website;
//   Email email;
//   dynamic companyType;
//   int customerId;
//   dynamic customer;
//   int pageNumber;
//   int pageSize;
//   int totalRecords;
//   dynamic createdBy;
//   DateTime createdOn;
//   dynamic modifiedBy;
//   DateTime modifiedOn;
//   bool isActive;
//   bool isDeleted;
//   dynamic createdUser;
//   dynamic modifiedUser;

//   Company({
//     required this.companyId,
//     required this.companyName,
//     required this.companyTypeId,
//     required this.phone,
//     required this.phone2,
//     required this.fax,
//     required this.website,
//     required this.email,
//     this.companyType,
//     required this.customerId,
//     this.customer,
//     required this.pageNumber,
//     required this.pageSize,
//     required this.totalRecords,
//     this.createdBy,
//     required this.createdOn,
//     this.modifiedBy,
//     required this.modifiedOn,
//     required this.isActive,
//     required this.isDeleted,
//     this.createdUser,
//     this.modifiedUser,
//   });

//   factory Company.fromJson(Map<String, dynamic> json) => Company(
//         companyId: json["companyId"],
//         companyName: companyNameValues.map[json["companyName"]]!,
//         companyTypeId: json["companyTypeId"],
//         phone: json["phone"],
//         phone2: json["phone2"],
//         fax: faxValues.map[json["fax"]]!,
//         website: websiteValues.map[json["website"]]!,
//         email: emailValues.map[json["email"]]!,
//         companyType: json["companyType"],
//         customerId: json["customerId"],
//         customer: json["customer"],
//         pageNumber: json["pageNumber"],
//         pageSize: json["pageSize"],
//         totalRecords: json["totalRecords"],
//         createdBy: json["createdBy"],
//         createdOn: DateTime.parse(json["createdOn"]),
//         modifiedBy: json["modifiedBy"],
//         modifiedOn: DateTime.parse(json["modifiedOn"]),
//         isActive: json["isActive"],
//         isDeleted: json["isDeleted"],
//         createdUser: json["createdUser"],
//         modifiedUser: json["modifiedUser"],
//       );

//   Map<String, dynamic> toJson() => {
//         "companyId": companyId,
//         "companyName": companyNameValues.reverse[companyName],
//         "companyTypeId": companyTypeId,
//         "phone": phone,
//         "phone2": phone2,
//         "fax": faxValues.reverse[fax],
//         "website": websiteValues.reverse[website],
//         "email": emailValues.reverse[email],
//         "companyType": companyType,
//         "customerId": customerId,
//         "customer": customer,
//         "pageNumber": pageNumber,
//         "pageSize": pageSize,
//         "totalRecords": totalRecords,
//         "createdBy": createdBy,
//         "createdOn": createdOn.toIso8601String(),
//         "modifiedBy": modifiedBy,
//         "modifiedOn": modifiedOn.toIso8601String(),
//         "isActive": isActive,
//         "isDeleted": isDeleted,
//         "createdUser": createdUser,
//         "modifiedUser": modifiedUser,
//       };
// }

class Contact {
  // int contactId;
  // int? companyId;
  // dynamic company;
  // int? contactTypeId;
  // dynamic contactType;
  // int? contactCategoryId;
  ContactRoleClass? contactCategory;
  // int customerId;
  // dynamic customer;
  // int? areaOfInterestId;
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
  // Phone phone;
  // Phone2 phone2;
  // MobilePhone mobilePhone;
  // String fax;
  // String otherPhone;
  // Email1 email1;
  // String email2;
  // bool optOut;
  // DateTime optOutDate;
  // MessengerClient messengerClient;
  // MessengerId messengerId;
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
  // Type type;
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
    // required this.contactId,
    // this.companyId,
    // this.company,
    // this.contactTypeId,
    // this.contactType,
    // this.contactCategoryId,
    this.contactCategory,
    // required this.customerId,
    // this.customer,
    // this.areaOfInterestId,
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
    // required this.phone,
    // required this.phone2,
    // required this.mobilePhone,
    // required this.fax,
    // required this.otherPhone,
    // required this.email1,
    // required this.email2,
    // required this.optOut,
    // required this.optOutDate,
    // required this.messengerClient,
    // required this.messengerId,
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
        // contactId: json["contactID"],
        // companyId: json["companyId"],
        // company: json["company"],
        // contactTypeId: json["contactTypeId"],
        // contactType: json["contactType"],
        // contactCategoryId: json["contactCategoryId"],
        contactCategory: json["contactCategory"] == null
            ? null
            : ContactRoleClass.fromJson(json["contactCategory"]),
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
        firstName:json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        // contactStatus: json["contactStatus"],
        // tenant: json["tenant"],
        // phone: phoneValues.map[json["phone"]]!,
        // phone2: phone2Values.map[json["phone2"]]!,
        // mobilePhone: mobilePhoneValues.map[json["mobilePhone"]]!,
        // fax: json["fax"],
        // otherPhone: json["otherPhone"],
        // email1: email1Values.map[json["email1"]]!,
        // email2: json["email2"],
        // optOut: json["optOut"],
        // optOutDate: DateTime.parse(json["optOutDate"]),
        // messengerClient: messengerClientValues.map[json["messengerClient"]]!,
        // messengerId: messengerIdValues.map[json["messengerID"]]!,
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
        // type: typeValues.map[json["type"]]!,
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

class ContactRoleClass {
  int? contactCategoryId;
  String? contactCategorys;
  // int customerId;
  // dynamic customer;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // String? modifiedBy;
  // DateTime? modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;
  // int? contactRoleId;
  String? name;

  ContactRoleClass({
    this.contactCategoryId,
    this.contactCategorys,
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
    // this.contactRoleId,
    this.name,
  });

  factory ContactRoleClass.fromJson(Map<String, dynamic> json) =>
      ContactRoleClass(
        contactCategoryId: json["contactCategoryId"] ?? 0,
        contactCategorys: json["contactCategorys"] ?? "",
        // customerId: json["customerId"],
        // customer: json["customer"],
        // pageNumber: json["pageNumber"],
        // pageSize: json["pageSize"],
        // totalRecords: json["totalRecords"],
        // createdBy: json["createdBy"],
        // createdOn: DateTime.parse(json["createdOn"]),
        // modifiedBy: json["modifiedBy"],
        // modifiedOn: json["modifiedOn"] == null
        //     ? null
        //     : DateTime.parse(json["modifiedOn"]),
        // isActive: json["isActive"],
        // isDeleted: json["isDeleted"],
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
        // contactRoleId: json["contactRoleID"],
        name: json["name"] ?? "",
      );

}
