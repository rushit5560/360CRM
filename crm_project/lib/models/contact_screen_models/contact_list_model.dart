// import 'dart:convert';
//
// ContactListModel contactListModelFromJson(String str) => ContactListModel.fromJson(json.decode(str));
//
// String contactListModelToJson(ContactListModel data) => json.encode(data.toJson());
//
// class ContactListModel {
//   int statusCode;
//   List<ContactDetails> data;
//
//   ContactListModel({
//     required this.statusCode,
//     required this.data,
//   });
//
//   factory ContactListModel.fromJson(Map<String, dynamic> json) => ContactListModel(
//     statusCode: json["statusCode"] ?? 0,
//     data: List<ContactDetails>.from((json["data"] ?? []).map((x) => ContactDetails.fromJson(x ?? {}))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "statusCode": statusCode,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class ContactDetails {
//   int mtmCompanyContactId;
//   int companyId;
//   // Company company;
//   int contactId;
//   Contact contact;
//   int contactRoleId;
//   // ContactRoleClass contactRole;
//   int pageNumber;
//   int pageSize;
//   int totalRecords;
//   // String createdBy;
//   // DateTime createdOn;
//   // dynamic modifiedBy;
//   // DateTime modifiedOn;
//   bool isActive;
//   bool isDeleted;
//   // dynamic createdUser;
//   // dynamic modifiedUser;
//
//   ContactDetails({
//     required this.mtmCompanyContactId,
//     required this.companyId,
//     // required this.company,
//     required this.contactId,
//     required this.contact,
//     required this.contactRoleId,
//     // this.contactRole,
//     required this.pageNumber,
//     required this.pageSize,
//     required this.totalRecords,
//     // required this.createdBy,
//     // required this.createdOn,
//     // required this.modifiedBy,
//     // required this.modifiedOn,
//     required this.isActive,
//     required this.isDeleted,
//     // required this.createdUser,
//     // required this.modifiedUser,
//   });
//
//   factory ContactDetails.fromJson(Map<String, dynamic> json) => ContactDetails(
//     mtmCompanyContactId: json["mtmCompanyContactId"] ?? 0,
//     companyId: json["companyID"] ?? 0,
//     // company: Company.fromJson(json["company"] ?? {}),
//     contactId: json["contactID"] ?? 0,
//     contact: Contact.fromJson(json["contact"] ?? {}),
//     contactRoleId: json["contactRoleID"] ?? 0,
//     // contactRole: ContactRoleClass.fromJson(json["contactRole"]),
//     pageNumber: json["pageNumber"] ?? 0,
//     pageSize: json["pageSize"] ?? 0,
//     totalRecords: json["totalRecords"] ?? 0,
//     // createdBy: json["createdBy"],
//     // createdOn: DateTime.parse(json["createdOn"]),
//     // modifiedBy: json["modifiedBy"],
//     // modifiedOn: DateTime.parse(json["modifiedOn"]),
//     isActive: json["isActive"] ?? false,
//     isDeleted: json["isDeleted"] ?? false,
//     // createdUser: json["createdUser"],
//     // modifiedUser: json["modifiedUser"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "mtmCompanyContactId": mtmCompanyContactId,
//     "companyID": companyId,
//     // "company": company.toJson(),
//     "contactID": contactId,
//     // "contact": contact.toJson(),
//     "contactRoleID": contactRoleId,
//     // "contactRole": contactRole.toJson(),
//     "pageNumber": pageNumber,
//     "pageSize": pageSize,
//     "totalRecords": totalRecords,
//     // "createdBy": createdBy,
//     // "createdOn": createdOn.toIso8601String(),
//     // "modifiedBy": modifiedBy,
//     // "modifiedOn": modifiedOn.toIso8601String(),
//     "isActive": isActive,
//     "isDeleted": isDeleted,
//     // "createdUser": createdUser,
//     // "modifiedUser": modifiedUser,
//   };
// }
//
// /*class Company {
//   int companyId;
//   String companyName;
//   int companyTypeId;
//   String phone;
//   String phone2;
//   String fax;
//   String website;
//   String email;
//   dynamic companyType;
//   int customerId;
//   dynamic customer;
//   int pageNumber;
//   int pageSize;
//   int totalRecords;
//   String createdBy;
//   DateTime createdOn;
//   dynamic modifiedBy;
//   DateTime modifiedOn;
//   bool isActive;
//   bool isDeleted;
//   dynamic createdUser;
//   dynamic modifiedUser;
//
//   Company({
//     this.companyId,
//     this.companyName,
//     this.companyTypeId,
//     this.phone,
//     this.phone2,
//     this.fax,
//     this.website,
//     this.email,
//     this.companyType,
//     this.customerId,
//     this.customer,
//     this.pageNumber,
//     this.pageSize,
//     this.totalRecords,
//     this.createdBy,
//     this.createdOn,
//     this.modifiedBy,
//     this.modifiedOn,
//     this.isActive,
//     this.isDeleted,
//     this.createdUser,
//     this.modifiedUser,
//   });
//
//   factory Company.fromJson(Map<String, dynamic> json) => Company(
//     companyId: json["companyId"],
//     companyName: json["companyName"],
//     companyTypeId: json["companyTypeId"],
//     phone: json["phone"],
//     phone2: json["phone2"],
//     fax: json["fax"],
//     website: json["website"],
//     email: json["email"],
//     companyType: json["companyType"],
//     customerId: json["customerId"],
//     customer: json["customer"],
//     pageNumber: json["pageNumber"],
//     pageSize: json["pageSize"],
//     totalRecords: json["totalRecords"],
//     createdBy: json["createdBy"],
//     createdOn: DateTime.parse(json["createdOn"]),
//     modifiedBy: json["modifiedBy"],
//     modifiedOn: DateTime.parse(json["modifiedOn"]),
//     isActive: json["isActive"],
//     isDeleted: json["isDeleted"],
//     createdUser: json["createdUser"],
//     modifiedUser: json["modifiedUser"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "companyId": companyId,
//     "companyName": companyName,
//     "companyTypeId": companyTypeId,
//     "phone": phone,
//     "phone2": phone2,
//     "fax": fax,
//     "website": website,
//     "email": email,
//     "companyType": companyType,
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
//   };
// }*/
//
// class Contact {
//   // int contactId;
//   // int companyId;
//   // dynamic company;
//   // int contactTypeId;
//   // dynamic contactType;
//   // int contactCategoryId;
//   // ContactRoleClass contactCategory;
//   // int customerId;
//   // dynamic customer;
//   // dynamic areaOfInterestId;
//   // dynamic areaOfInterest;
//   // dynamic propertyId;
//   // dynamic property;
//   // dynamic prospectId;
//   // dynamic prospect;
//   // int spouseId;
//   // dynamic spouse;
//   String firstName;
//   String middleName;
//   String lastName;
//   // String contactStatus;
//   // dynamic tenant;
//   // String phone;
//   // String phone2;
//   // String mobilePhone;
//   // String fax;
//   // String otherPhone;
//   // String email1;
//   // String email2;
//   // bool optOut;
//   // dynamic optOutDate;
//   // String messengerClient;
//   // String messengerId;
//   // String ssn;
//   // DateTime dob;
//   // String middleFicoScore;
//   // String maritalStatus;
//   // String dependants;
//   // bool usCitizen;
//   // String employer;
//   // String position;
//   // String businessPhone;
//   // String typeOfBusiness;
//   // String lengthEmployed;
//   // String yearsLineOfWork;
//   // bool selfEmployed;
//   // String prevEmployer;
//   // String prevPosition;
//   // String prevBusinessPhone;
//   // String prevLengthEmployed;
//   // dynamic currentYearAgi;
//   // dynamic debtIncomeRatio;
//   // dynamic grossMonthlyIncome;
//   // dynamic monthlyCashFlow;
//   // dynamic monthlyHousingExpense;
//   // dynamic netMonthlyIncome;
//   // dynamic otherIncomeExclChildSupport;
//   // dynamic periodBeginning;
//   // dynamic periodEnding;
//   // dynamic previousYrAgi;
//   // dynamic revolvingResourcesBalance;
//   // dynamic revolvingResourcesLimit;
//   // bool bankruptcy;
//   // String bkComments;
//   // dynamic bkDischargeDate;
//   // dynamic creditReportDate;
//   // String contractorLicense;
//   // String contractorState;
//   // bool newImport;
//   // String title;
//   // String type;
//   // dynamic id;
//   // dynamic roleId;
//   // int pageNumber;
//   // int pageSize;
//   // int totalRecords;
//   // dynamic createdBy;
//   // dynamic createdOn;
//   // String modifiedBy;
//   // DateTime modifiedOn;
//   // bool isActive;
//   // bool isDeleted;
//   // dynamic createdUser;
//   // dynamic modifiedUser;
//
//   Contact({
//     // this.contactId,
//     // this.companyId,
//     // this.company,
//     // this.contactTypeId,
//     // this.contactType,
//     // this.contactCategoryId,
//     // this.contactCategory,
//     // this.customerId,
//     // this.customer,
//     // this.areaOfInterestId,
//     // this.areaOfInterest,
//     // this.propertyId,
//     // this.property,
//     // this.prospectId,
//     // this.prospect,
//     // this.spouseId,
//     // this.spouse,
//     required this.firstName,
//     required this.middleName,
//     required this.lastName,
//     // this.contactStatus,
//     // this.tenant,
//     // this.phone,
//     // this.phone2,
//     // this.mobilePhone,
//     // this.fax,
//     // this.otherPhone,
//     // this.email1,
//     // this.email2,
//     // this.optOut,
//     // this.optOutDate,
//     // this.messengerClient,
//     // this.messengerId,
//     // this.ssn,
//     // this.dob,
//     // this.middleFicoScore,
//     // this.maritalStatus,
//     // this.dependants,
//     // this.usCitizen,
//     // this.employer,
//     // this.position,
//     // this.businessPhone,
//     // this.typeOfBusiness,
//     // this.lengthEmployed,
//     // this.yearsLineOfWork,
//     // this.selfEmployed,
//     // this.prevEmployer,
//     // this.prevPosition,
//     // this.prevBusinessPhone,
//     // this.prevLengthEmployed,
//     // this.currentYearAgi,
//     // this.debtIncomeRatio,
//     // this.grossMonthlyIncome,
//     // this.monthlyCashFlow,
//     // this.monthlyHousingExpense,
//     // this.netMonthlyIncome,
//     // this.otherIncomeExclChildSupport,
//     // this.periodBeginning,
//     // this.periodEnding,
//     // this.previousYrAgi,
//     // this.revolvingResourcesBalance,
//     // this.revolvingResourcesLimit,
//     // this.bankruptcy,
//     // this.bkComments,
//     // this.bkDischargeDate,
//     // this.creditReportDate,
//     // this.contractorLicense,
//     // this.contractorState,
//     // this.newImport,
//     // this.title,
//     // this.type,
//     // this.id,
//     // this.roleId,
//     // this.pageNumber,
//     // this.pageSize,
//     // this.totalRecords,
//     // this.createdBy,
//     // this.createdOn,
//     // this.modifiedBy,
//     // this.modifiedOn,
//     // this.isActive,
//     // this.isDeleted,
//     // this.createdUser,
//     // this.modifiedUser,
//   });
//
//   factory Contact.fromJson(Map<String, dynamic> json) => Contact(
//     // contactId: json["contactID"],
//     // companyId: json["companyId"],
//     // company: json["company"],
//     // contactTypeId: json["contactTypeId"],
//     // contactType: json["contactType"],
//     // contactCategoryId: json["contactCategoryId"],
//     // contactCategory: ContactRoleClass.fromJson(json["contactCategory"]),
//     // customerId: json["customerId"],
//     // customer: json["customer"],
//     // areaOfInterestId: json["areaOfInterestId"],
//     // areaOfInterest: json["areaOfInterest"],
//     // propertyId: json["propertyID"],
//     // property: json["property"],
//     // prospectId: json["prospectID"],
//     // prospect: json["prospect"],
//     // spouseId: json["spouseID"],
//     // spouse: json["spouse"],
//     firstName: json["firstName"] ?? "",
//     middleName: json["middleName"] ?? "",
//     lastName: json["lastName"] ?? "",
//     // contactStatus: json["contactStatus"],
//     // tenant: json["tenant"],
//     // phone: json["phone"],
//     // phone2: json["phone2"],
//     // mobilePhone: json["mobilePhone"],
//     // fax: json["fax"],
//     // otherPhone: json["otherPhone"],
//     // email1: json["email1"],
//     // email2: json["email2"],
//     // optOut: json["optOut"],
//     // optOutDate: json["optOutDate"],
//     // messengerClient: json["messengerClient"],
//     // messengerId: json["messengerID"],
//     // ssn: json["ssn"],
//     // dob: DateTime.parse(json["dob"]),
//     // middleFicoScore: json["middleFicoScore"],
//     // maritalStatus: json["maritalStatus"],
//     // dependants: json["dependants"],
//     // usCitizen: json["usCitizen"],
//     // employer: json["employer"],
//     // position: json["position"],
//     // businessPhone: json["businessPhone"],
//     // typeOfBusiness: json["typeOfBusiness"],
//     // lengthEmployed: json["lengthEmployed"],
//     // yearsLineOfWork: json["yearsLineOfWork"],
//     // selfEmployed: json["selfEmployed"],
//     // prevEmployer: json["prevEmployer"],
//     // prevPosition: json["prevPosition"],
//     // prevBusinessPhone: json["prevBusinessPhone"],
//     // prevLengthEmployed: json["prevLengthEmployed"],
//     // currentYearAgi: json["currentYearAGI"],
//     // debtIncomeRatio: json["debtIncomeRatio"],
//     // grossMonthlyIncome: json["grossMonthlyIncome"],
//     // monthlyCashFlow: json["monthlyCashFlow"],
//     // monthlyHousingExpense: json["monthlyHousingExpense"],
//     // netMonthlyIncome: json["netMonthlyIncome"],
//     // otherIncomeExclChildSupport: json["otherIncomeExclChildSupport"],
//     // periodBeginning: json["periodBeginning"],
//     // periodEnding: json["periodEnding"],
//     // previousYrAgi: json["previousYrAGI"],
//     // revolvingResourcesBalance: json["revolvingResourcesBalance"],
//     // revolvingResourcesLimit: json["revolvingResourcesLimit"],
//     // bankruptcy: json["bankruptcy"],
//     // bkComments: json["bkComments"],
//     // bkDischargeDate: json["bkDischargeDate"],
//     // creditReportDate: json["creditReportDate"],
//     // contractorLicense: json["contractorLicense"],
//     // contractorState: json["contractorState"],
//     // newImport: json["newImport"],
//     // title: json["title"],
//     // type: json["type"],
//     // id: json["id"],
//     // roleId: json["roleId"],
//     // pageNumber: json["pageNumber"],
//     // pageSize: json["pageSize"],
//     // totalRecords: json["totalRecords"],
//     // createdBy: json["createdBy"],
//     // createdOn: json["createdOn"],
//     // modifiedBy: json["modifiedBy"],
//     // modifiedOn: DateTime.parse(json["modifiedOn"]),
//     // isActive: json["isActive"],
//     // isDeleted: json["isDeleted"],
//     // createdUser: json["createdUser"],
//     // modifiedUser: json["modifiedUser"],
//   );
//
//   /*Map<String, dynamic> toJson() => {
//     "contactID": contactId,
//     "companyId": companyId,
//     "company": company,
//     "contactTypeId": contactTypeId,
//     "contactType": contactType,
//     "contactCategoryId": contactCategoryId,
//     "contactCategory": contactCategory.toJson(),
//     "customerId": customerId,
//     "customer": customer,
//     "areaOfInterestId": areaOfInterestId,
//     "areaOfInterest": areaOfInterest,
//     "propertyID": propertyId,
//     "property": property,
//     "prospectID": prospectId,
//     "prospect": prospect,
//     "spouseID": spouseId,
//     "spouse": spouse,
//     "firstName": firstName,
//     "middleName": middleName,
//     "lastName": lastName,
//     "contactStatus": contactStatus,
//     "tenant": tenant,
//     "phone": phone,
//     "phone2": phone2,
//     "mobilePhone": mobilePhone,
//     "fax": fax,
//     "otherPhone": otherPhone,
//     "email1": email1,
//     "email2": email2,
//     "optOut": optOut,
//     "optOutDate": optOutDate,
//     "messengerClient": messengerClient,
//     "messengerID": messengerId,
//     "ssn": ssn,
//     "dob": dob.toIso8601String(),
//     "middleFicoScore": middleFicoScore,
//     "maritalStatus": maritalStatus,
//     "dependants": dependants,
//     "usCitizen": usCitizen,
//     "employer": employer,
//     "position": position,
//     "businessPhone": businessPhone,
//     "typeOfBusiness": typeOfBusiness,
//     "lengthEmployed": lengthEmployed,
//     "yearsLineOfWork": yearsLineOfWork,
//     "selfEmployed": selfEmployed,
//     "prevEmployer": prevEmployer,
//     "prevPosition": prevPosition,
//     "prevBusinessPhone": prevBusinessPhone,
//     "prevLengthEmployed": prevLengthEmployed,
//     "currentYearAGI": currentYearAgi,
//     "debtIncomeRatio": debtIncomeRatio,
//     "grossMonthlyIncome": grossMonthlyIncome,
//     "monthlyCashFlow": monthlyCashFlow,
//     "monthlyHousingExpense": monthlyHousingExpense,
//     "netMonthlyIncome": netMonthlyIncome,
//     "otherIncomeExclChildSupport": otherIncomeExclChildSupport,
//     "periodBeginning": periodBeginning,
//     "periodEnding": periodEnding,
//     "previousYrAGI": previousYrAgi,
//     "revolvingResourcesBalance": revolvingResourcesBalance,
//     "revolvingResourcesLimit": revolvingResourcesLimit,
//     "bankruptcy": bankruptcy,
//     "bkComments": bkComments,
//     "bkDischargeDate": bkDischargeDate,
//     "creditReportDate": creditReportDate,
//     "contractorLicense": contractorLicense,
//     "contractorState": contractorState,
//     "newImport": newImport,
//     "title": title,
//     "type": type,
//     "id": id,
//     "roleId": roleId,
//     "pageNumber": pageNumber,
//     "pageSize": pageSize,
//     "totalRecords": totalRecords,
//     "createdBy": createdBy,
//     "createdOn": createdOn,
//     "modifiedBy": modifiedBy,
//     "modifiedOn": modifiedOn.toIso8601String(),
//     "isActive": isActive,
//     "isDeleted": isDeleted,
//     "createdUser": createdUser,
//     "modifiedUser": modifiedUser,
//   };*/
// }
//
// /*class ContactRoleClass {
//   int contactCategoryId;
//   String contactCategorys;
//   int customerId;
//   dynamic customer;
//   int pageNumber;
//   int pageSize;
//   int totalRecords;
//   String createdBy;
//   DateTime createdOn;
//   String modifiedBy;
//   DateTime modifiedOn;
//   bool isActive;
//   bool isDeleted;
//   dynamic createdUser;
//   dynamic modifiedUser;
//   int contactRoleId;
//   String name;
//
//   ContactRoleClass({
//     this.contactCategoryId,
//     this.contactCategorys,
//     this.customerId,
//     this.customer,
//     this.pageNumber,
//     this.pageSize,
//     this.totalRecords,
//     this.createdBy,
//     this.createdOn,
//     this.modifiedBy,
//     this.modifiedOn,
//     this.isActive,
//     this.isDeleted,
//     this.createdUser,
//     this.modifiedUser,
//     this.contactRoleId,
//     this.name,
//   });
//
//   factory ContactRoleClass.fromJson(Map<String, dynamic> json) => ContactRoleClass(
//     contactCategoryId: json["contactCategoryId"],
//     contactCategorys: json["contactCategorys"],
//     customerId: json["customerId"],
//     customer: json["customer"],
//     pageNumber: json["pageNumber"],
//     pageSize: json["pageSize"],
//     totalRecords: json["totalRecords"],
//     createdBy: json["createdBy"],
//     createdOn: DateTime.parse(json["createdOn"]),
//     modifiedBy: json["modifiedBy"],
//     modifiedOn: DateTime.parse(json["modifiedOn"]),
//     isActive: json["isActive"],
//     isDeleted: json["isDeleted"],
//     createdUser: json["createdUser"],
//     modifiedUser: json["modifiedUser"],
//     contactRoleId: json["contactRoleID"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "contactCategoryId": contactCategoryId,
//     "contactCategorys": contactCategorys,
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
//     "contactRoleID": contactRoleId,
//     "name": name,
//   };
// }*/


import 'dart:convert';

ContactListModel contactListModelFromJson(String str) => ContactListModel.fromJson(json.decode(str));

String contactListModelToJson(ContactListModel data) => json.encode(data.toJson());

class ContactListModel {
  int statusCode;
  Data data;

  ContactListModel({
    required this.statusCode,
    required this.data,
  });

  factory ContactListModel.fromJson(Map<String, dynamic> json) => ContactListModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": data.toJson(),
  };
}

class Data {
  // int pageNumber;
  // int pageSize;
  // dynamic firstPage;
  // dynamic lastPage;
  // int totalPages;
  // int totalRecords;
  // dynamic nextPage;
  // dynamic previousPage;
  List<ContactDetails> data;
  // bool succeeded;
  String errors;
  String message;

  Data({
    // this.pageNumber,
    // this.pageSize,
    // this.firstPage,
    // this.lastPage,
    // this.totalPages,
    // this.totalRecords,
    // this.nextPage,
    // this.previousPage,
    required this.data,
    // this.succeeded,
    required this.errors,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    // pageNumber: json["pageNumber"],
    // pageSize: json["pageSize"],
    // firstPage: json["firstPage"],
    // lastPage: json["lastPage"],
    // totalPages: json["totalPages"],
    // totalRecords: json["totalRecords"],
    // nextPage: json["nextPage"],
    // previousPage: json["previousPage"],
    data: List<ContactDetails>.from((json["data"] ?? []).map((x) => ContactDetails.fromJson(x ?? {}))),
    // succeeded: json["succeeded"],
    errors: json["errors"] ?? "",
    message: json["message"] ?? "",
  );

}

class ContactDetails {
  // int mtmCompanyContactId;
  // dynamic companyId;
  // dynamic company;
  // int contactId;
  Contact contact;
  // dynamic contactRoleId;
  // dynamic contactRole;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // dynamic createdBy;
  // dynamic createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  ContactDetails({
    // this.mtmCompanyContactId,
    // this.companyId,
    // this.company,
    // this.contactId,
    required this.contact,
    // this.contactRoleId,
    // this.contactRole,
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

  factory ContactDetails.fromJson(Map<String, dynamic> json) => ContactDetails(
    // mtmCompanyContactId: json["mtmCompanyContactId"],
    // companyId: json["companyID"],
    // company: json["company"],
    // contactId: json["contactID"],
    contact: Contact.fromJson(json["contact"] ?? {}),
    // contactRoleId: json["contactRoleID"],
    // contactRole: json["contactRole"],
    // pageNumber: json["pageNumber"],
    // pageSize: json["pageSize"],
    // totalRecords: json["totalRecords"],
    // createdBy: json["createdBy"],
    // createdOn: json["createdOn"],
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    // isActive: json["isActive"],
    // isDeleted: json["isDeleted"],
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );


}

class Contact {
  // int contactId;
  // dynamic companyId;
  // dynamic company;
  // dynamic contactTypeId;
  // dynamic contactType;
  // dynamic contactCategoryId;
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
  String firstName;
  String middleName;
  String lastName;
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
  // dynamic createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  // bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  Contact({
    // this.contactId,
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
    required this.firstName,
    required this.middleName,
    required this.lastName,
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

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    // contactId: json["contactID"],
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
    middleName: json["middleName"] ?? "",
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
    // modifiedOn: json["modifiedOn"],
    // isActive: json["isActive"],
    // isDeleted: json["isDeleted"],
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

}
