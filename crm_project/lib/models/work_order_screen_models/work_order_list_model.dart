// To parse this JSON data, do
//
//     final workOrderListModel = workOrderListModelFromJson(jsonString);

import 'dart:convert';

WorkOrderListModel workOrderListModelFromJson(String str) =>
    WorkOrderListModel.fromJson(json.decode(str));

// String workOrderListModelToJson(WorkOrderListModel data) => json.encode(data.toJson());

class WorkOrderListModel {
  int statusCode;
  Data data;

  WorkOrderListModel({
    required this.statusCode,
    required this.data,
  });

  factory WorkOrderListModel.fromJson(Map<String, dynamic> json) =>
      WorkOrderListModel(
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
      );

// Map<String, dynamic> toJson() => {
//     "statusCode": statusCode,
//     "data": data.toJson(),
// };
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
  List<WorkOrderData> data;
  bool succeeded;
  // dynamic errors;
  // dynamic message;

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
    // this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageNumber: json["pageNumber"]??0,
        pageSize: json["pageSize"]??0,
        // firstPage: json["firstPage"],
        // lastPage: json["lastPage"],
        totalPages: json["totalPages"]??0,
        totalRecords: json["totalRecords"]??0,
        // nextPage: json["nextPage"],
        // previousPage: json["previousPage"],
        data: List<WorkOrderData>.from(
            (json["data"]??{}).map((x) => WorkOrderData.fromJson(x))),
        succeeded: json["succeeded"]??false,
        // errors: json["errors"],
        // message: json["message"],
      );

// Map<String, dynamic> toJson() => {
//     "pageNumber": pageNumber,
//     "pageSize": pageSize,
//     "firstPage": firstPage,
//     "lastPage": lastPage,
//     "totalPages": totalPages,
//     "totalRecords": totalRecords,
//     "nextPage": nextPage,
//     "previousPage": previousPage,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "succeeded": succeeded,
//     "errors": errors,
//     "message": message,
// };
}

class WorkOrderData {
  int workOrderId; ////
  // DateTime workOrderDate;
  // int workOrderStatusId;
  WorkOrder workOrderStatus;
  String workOrderDetails; /////
  // int propertyId;
  // Property property;
  // int companyId;
  // Company company;
  DateTime projectStartDate; /////
  DateTime projectDueDate; //////
  // DateTime completeDate;
  // dynamic perDiemPenalty;
  // dynamic perDiemBonus;
  // dynamic projectedCost;
  // dynamic unit;
  // dynamic budget;
  // dynamic actualCost;
  // dynamic percentOfBudget;
  // int costOverRuns;
  // dynamic parentId;
  // int workOrderTypeId;
  // WorkOrder workOrderType;
  // String specialTerms;
  // dynamic contractorVerification;
  // int customerId;
  // dynamic customer;
  String type; /////
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // DateTime modifiedOn;
  bool isActive; /////
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  WorkOrderData({
    required this.workOrderId,
    // required this.workOrderDate,
    // required this.workOrderStatusId,
    required this.workOrderStatus,
    required this.workOrderDetails,
    // required this.propertyId,
    // required this.property,
    // required this.companyId,
    // required this.company,
    required this.projectStartDate,
    required this.projectDueDate,
    // required this.completeDate,
    // this.perDiemPenalty,
    // this.perDiemBonus,
    // this.projectedCost,
    // this.unit,
    // this.budget,
    // this.actualCost,
    // this.percentOfBudget,
    // required this.costOverRuns,
    // this.parentId,
    // required this.workOrderTypeId,
    // required this.workOrderType,
    // required this.specialTerms,
    // this.contractorVerification,
    // required this.customerId,
    // this.customer,
    required this.type,
    // required this.pageNumber,
    // required this.pageSize,
    // required this.totalRecords,
    // required this.createdBy,
    // required this.createdOn,
    // this.modifiedBy,
    // required this.modifiedOn,
    required this.isActive,
    // required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory WorkOrderData.fromJson(Map<String, dynamic> json) => WorkOrderData(
        workOrderId: json["workOrderID"] ?? 0,
        // workOrderDate: DateTime.parse(json["workOrderDate"]),
        // workOrderStatusId: json["workOrderStatusID"],
        workOrderStatus: WorkOrder.fromJson(json["workOrderStatus"]??{}),
        workOrderDetails: json["workOrderDetails"] ?? "",
        // propertyId: json["propertyID"],
        // property: Property.fromJson(json["property"]),
        // companyId: json["companyID"],
        // company: Company.fromJson(json["company"]),
        projectStartDate:
            DateTime.parse(json["projectStartDate"] ?? DateTime.now().toString()),
        projectDueDate:
            DateTime.parse(json["projectDueDate"] ?? DateTime.now().toString()),
        // completeDate: DateTime.parse(json["completeDate"]),
        // perDiemPenalty: json["perDiemPenalty"],
        // perDiemBonus: json["perDiemBonus"],
        // projectedCost: json["projectedCost"],
        // unit: json["unit"],
        // budget: json["budget"],
        // actualCost: json["actualCost"],
        // percentOfBudget: json["percentOfBudget"],
        // costOverRuns: json["costOverRuns"],
        // parentId: json["parentID"],
        // workOrderTypeId: json["workOrderTypeID"],
        // workOrderType: WorkOrder.fromJson(json["workOrderType"]),
        // specialTerms: json["specialTerms"],
        // contractorVerification: json["contractorVerification"],
        // customerId: json["customerId"],
        // customer: json["customer"],
        type: json["type"] ?? "",

        ///
        // pageNumber: json["pageNumber"],
        // pageSize: json["pageSize"],
        // totalRecords: json["totalRecords"],
        // createdBy: json["createdBy"],
        // createdOn: DateTime.parse(json["createdOn"]),
        // modifiedBy: json["modifiedBy"],
        // modifiedOn: DateTime.parse(json["modifiedOn"]),
        isActive: json["isActive"] ?? false,
        // isDeleted: json["isDeleted"],
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
      );

// Map<String, dynamic> toJson() => {
//     "workOrderID": workOrderId,
//     "workOrderDate": workOrderDate.toIso8601String(),
//     "workOrderStatusID": workOrderStatusId,
//     "workOrderStatus": workOrderStatus.toJson(),
//     "workOrderDetails": workOrderDetails,
//     "propertyID": propertyId,
//     "property": property.toJson(),
//     "companyID": companyId,
//     "company": company.toJson(),
//     "projectStartDate": projectStartDate.toIso8601String(),
//     "projectDueDate": projectDueDate.toIso8601String(),
//     "completeDate": completeDate.toIso8601String(),
//     "perDiemPenalty": perDiemPenalty,
//     "perDiemBonus": perDiemBonus,
//     "projectedCost": projectedCost,
//     "unit": unit,
//     "budget": budget,
//     "actualCost": actualCost,
//     "percentOfBudget": percentOfBudget,
//     "costOverRuns": costOverRuns,
//     "parentID": parentId,
//     "workOrderTypeID": workOrderTypeId,
//     "workOrderType": workOrderType.toJson(),
//     "specialTerms": specialTerms,
//     "contractorVerification": contractorVerification,
//     "customerId": customerId,
//     "customer": customer,
//     "type": type,
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
// };
}

// class Company {
//     int companyId;
//     String companyName;
//     int companyTypeId;
//     String phone;
//     String phone2;
//     String fax;
//     String website;
//     String email;
//     dynamic companyType;
//     int customerId;
//     dynamic customer;
//     int pageNumber;
//     int pageSize;
//     int totalRecords;
//     dynamic createdBy;
//     DateTime createdOn;
//     dynamic modifiedBy;
//     DateTime modifiedOn;
//     bool isActive;
//     bool isDeleted;
//     dynamic createdUser;
//     dynamic modifiedUser;

//     Company({
//         required this.companyId,
//         required this.companyName,
//         required this.companyTypeId,
//         required this.phone,
//         required this.phone2,
//         required this.fax,
//         required this.website,
//         required this.email,
//         this.companyType,
//         required this.customerId,
//         this.customer,
//         required this.pageNumber,
//         required this.pageSize,
//         required this.totalRecords,
//         this.createdBy,
//         required this.createdOn,
//         this.modifiedBy,
//         required this.modifiedOn,
//         required this.isActive,
//         required this.isDeleted,
//         this.createdUser,
//         this.modifiedUser,
//     });

//     factory Company.fromJson(Map<String, dynamic> json) => Company(
//         companyId: json["companyId"],
//         companyName: json["companyName"],
//         companyTypeId: json["companyTypeId"],
//         phone: json["phone"],
//         phone2: json["phone2"],
//         fax: json["fax"],
//         website: json["website"],
//         email: json["email"],
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
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "companyId": companyId,
//     //     "companyName": companyName,
//     //     "companyTypeId": companyTypeId,
//     //     "phone": phone,
//     //     "phone2": phone2,
//     //     "fax": fax,
//     //     "website": website,
//     //     "email": email,
//     //     "companyType": companyType,
//     //     "customerId": customerId,
//     //     "customer": customer,
//     //     "pageNumber": pageNumber,
//     //     "pageSize": pageSize,
//     //     "totalRecords": totalRecords,
//     //     "createdBy": createdBy,
//     //     "createdOn": createdOn.toIso8601String(),
//     //     "modifiedBy": modifiedBy,
//     //     "modifiedOn": modifiedOn.toIso8601String(),
//     //     "isActive": isActive,
//     //     "isDeleted": isDeleted,
//     //     "createdUser": createdUser,
//     //     "modifiedUser": modifiedUser,
//     // };
// }

// class Property {
//     int propertyId;
//     String propertyName;
//     String address;
//     String unitNumber;
//     int cityId;
//     dynamic city;
//     int stateId;
//     dynamic state;
//     String zip;
//     int prospectId;
//     dynamic prospect;
//     int propertyTypeId;
//     dynamic propertyType;
//     int propertyStatusId;
//     dynamic propertyStatus;
//     String unitType;
//     bool rented;
//     int customerId;
//     dynamic customer;
//     dynamic activityId;
//     dynamic activity;
//     dynamic checkListId;
//     dynamic checkList;
//     dynamic documentTemplateId;
//     dynamic documentTemplate;
//     String lotSize;
//     String stories;
//     String parking;
//     bool garage;
//     dynamic garageTypeId;
//     dynamic garageType;
//     String bedrooms;
//     String bathrooms;
//     String numberRooms;
//     String squareFeet;
//     String propertyLot;
//     String propertyBlock;
//     String propertyTaxNumber;
//     dynamic purchasePrice;
//     dynamic askingPrice;
//     dynamic offerPrice;
//     dynamic anticipatedArv;
//     dynamic afterRepairValue;
//     dynamic arvPercent;
//     bool onLockbox;
//     String combination;
//     dynamic monthlyPayment;
//     dynamic interestRate;
//     dynamic annualTaxes;
//     dynamic taxYear;
//     dynamic outstandingTaxes;
//     dynamic currentYearExpenses;
//     dynamic insurance;
//     dynamic parentId;
//     dynamic appraisalAmount;
//     dynamic appraisalDate;
//     dynamic appraisalOrderDate;
//     String numberOfUnits;
//     String referralSource;
//     dynamic currentValue;
//     dynamic escrowBalance;
//     dynamic expectedPayoffDate;
//     dynamic listingExpiration;
//     dynamic netRealizableValue;
//     dynamic payoffGoodThrough;
//     dynamic propertyManagerFees;
//     dynamic realEstateAgent;
//     String realatorCommission;
//     dynamic secured;
//     dynamic taxesOwed;
//     String comments;
//     int pageNumber;
//     int pageSize;
//     int totalRecords;
//     String createdBy;
//     DateTime createdOn;
//     dynamic modifiedBy;
//     dynamic modifiedOn;
//     bool isActive;
//     bool isDeleted;
//     dynamic createdUser;
//     dynamic modifiedUser;

//     Property({
//         required this.propertyId,
//         required this.propertyName,
//         required this.address,
//         required this.unitNumber,
//         required this.cityId,
//         this.city,
//         required this.stateId,
//         this.state,
//         required this.zip,
//         required this.prospectId,
//         this.prospect,
//         required this.propertyTypeId,
//         this.propertyType,
//         required this.propertyStatusId,
//         this.propertyStatus,
//         required this.unitType,
//         required this.rented,
//         required this.customerId,
//         this.customer,
//         this.activityId,
//         this.activity,
//         this.checkListId,
//         this.checkList,
//         this.documentTemplateId,
//         this.documentTemplate,
//         required this.lotSize,
//         required this.stories,
//         required this.parking,
//         required this.garage,
//         this.garageTypeId,
//         this.garageType,
//         required this.bedrooms,
//         required this.bathrooms,
//         required this.numberRooms,
//         required this.squareFeet,
//         required this.propertyLot,
//         required this.propertyBlock,
//         required this.propertyTaxNumber,
//         this.purchasePrice,
//         this.askingPrice,
//         this.offerPrice,
//         this.anticipatedArv,
//         this.afterRepairValue,
//         this.arvPercent,
//         required this.onLockbox,
//         required this.combination,
//         this.monthlyPayment,
//         this.interestRate,
//         this.annualTaxes,
//         this.taxYear,
//         this.outstandingTaxes,
//         this.currentYearExpenses,
//         this.insurance,
//         this.parentId,
//         this.appraisalAmount,
//         this.appraisalDate,
//         this.appraisalOrderDate,
//         required this.numberOfUnits,
//         required this.referralSource,
//         this.currentValue,
//         this.escrowBalance,
//         this.expectedPayoffDate,
//         this.listingExpiration,
//         this.netRealizableValue,
//         this.payoffGoodThrough,
//         this.propertyManagerFees,
//         this.realEstateAgent,
//         required this.realatorCommission,
//         this.secured,
//         this.taxesOwed,
//         required this.comments,
//         required this.pageNumber,
//         required this.pageSize,
//         required this.totalRecords,
//         required this.createdBy,
//         required this.createdOn,
//         this.modifiedBy,
//         this.modifiedOn,
//         required this.isActive,
//         required this.isDeleted,
//         this.createdUser,
//         this.modifiedUser,
//     });

//     factory Property.fromJson(Map<String, dynamic> json) => Property(
//         propertyId: json["propertyId"],
//         propertyName: json["propertyName"],
//         address: json["address"],
//         unitNumber: json["unitNumber"],
//         cityId: json["cityId"],
//         city: json["city"],
//         stateId: json["stateId"],
//         state: json["state"],
//         zip: json["zip"],
//         prospectId: json["prospectID"],
//         prospect: json["prospect"],
//         propertyTypeId: json["propertyTypeID"],
//         propertyType: json["propertyType"],
//         propertyStatusId: json["propertyStatusID"],
//         propertyStatus: json["propertyStatus"],
//         unitType: json["unitType"],
//         rented: json["rented"],
//         customerId: json["customerId"],
//         customer: json["customer"],
//         activityId: json["activityID"],
//         activity: json["activity"],
//         checkListId: json["checkListId"],
//         checkList: json["checkList"],
//         documentTemplateId: json["documentTemplateId"],
//         documentTemplate: json["documentTemplate"],
//         lotSize: json["lotSize"],
//         stories: json["stories"],
//         parking: json["parking"],
//         garage: json["garage"],
//         garageTypeId: json["garageTypeID"],
//         garageType: json["garageType"],
//         bedrooms: json["bedrooms"],
//         bathrooms: json["bathrooms"],
//         numberRooms: json["numberRooms"],
//         squareFeet: json["squareFeet"],
//         propertyLot: json["propertyLot"],
//         propertyBlock: json["propertyBlock"],
//         propertyTaxNumber: json["propertyTaxNumber"],
//         purchasePrice: json["purchasePrice"],
//         askingPrice: json["askingPrice"],
//         offerPrice: json["offerPrice"],
//         anticipatedArv: json["anticipatedARV"],
//         afterRepairValue: json["afterRepairValue"],
//         arvPercent: json["arvPercent"],
//         onLockbox: json["onLockbox"],
//         combination: json["combination"],
//         monthlyPayment: json["monthlyPayment"],
//         interestRate: json["interestRate"],
//         annualTaxes: json["annualTaxes"],
//         taxYear: json["taxYear"],
//         outstandingTaxes: json["outstandingTaxes"],
//         currentYearExpenses: json["currentYearExpenses"],
//         insurance: json["insurance"],
//         parentId: json["parentID"],
//         appraisalAmount: json["appraisalAmount"],
//         appraisalDate: json["appraisalDate"],
//         appraisalOrderDate: json["appraisalOrderDate"],
//         numberOfUnits: json["numberOfUnits"],
//         referralSource: json["referralSource"],
//         currentValue: json["currentValue"],
//         escrowBalance: json["escrowBalance"],
//         expectedPayoffDate: json["expectedPayoffDate"],
//         listingExpiration: json["listingExpiration"],
//         netRealizableValue: json["netRealizableValue"],
//         payoffGoodThrough: json["payoffGoodThrough"],
//         propertyManagerFees: json["propertyManagerFees"],
//         realEstateAgent: json["realEstateAgent"],
//         realatorCommission: json["realatorCommission"],
//         secured: json["secured"],
//         taxesOwed: json["taxesOwed"],
//         comments: json["comments"],
//         pageNumber: json["pageNumber"],
//         pageSize: json["pageSize"],
//         totalRecords: json["totalRecords"],
//         createdBy: json["createdBy"],
//         createdOn: DateTime.parse(json["createdOn"]),
//         modifiedBy: json["modifiedBy"],
//         modifiedOn: json["modifiedOn"],
//         isActive: json["isActive"],
//         isDeleted: json["isDeleted"],
//         createdUser: json["createdUser"],
//         modifiedUser: json["modifiedUser"],
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "propertyId": propertyId,
//     //     "propertyName": propertyName,
//     //     "address": address,
//     //     "unitNumber": unitNumber,
//     //     "cityId": cityId,
//     //     "city": city,
//     //     "stateId": stateId,
//     //     "state": state,
//     //     "zip": zip,
//     //     "prospectID": prospectId,
//     //     "prospect": prospect,
//     //     "propertyTypeID": propertyTypeId,
//     //     "propertyType": propertyType,
//     //     "propertyStatusID": propertyStatusId,
//     //     "propertyStatus": propertyStatus,
//     //     "unitType": unitType,
//     //     "rented": rented,
//     //     "customerId": customerId,
//     //     "customer": customer,
//     //     "activityID": activityId,
//     //     "activity": activity,
//     //     "checkListId": checkListId,
//     //     "checkList": checkList,
//     //     "documentTemplateId": documentTemplateId,
//     //     "documentTemplate": documentTemplate,
//     //     "lotSize": lotSize,
//     //     "stories": stories,
//     //     "parking": parking,
//     //     "garage": garage,
//     //     "garageTypeID": garageTypeId,
//     //     "garageType": garageType,
//     //     "bedrooms": bedrooms,
//     //     "bathrooms": bathrooms,
//     //     "numberRooms": numberRooms,
//     //     "squareFeet": squareFeet,
//     //     "propertyLot": propertyLot,
//     //     "propertyBlock": propertyBlock,
//     //     "propertyTaxNumber": propertyTaxNumber,
//     //     "purchasePrice": purchasePrice,
//     //     "askingPrice": askingPrice,
//     //     "offerPrice": offerPrice,
//     //     "anticipatedARV": anticipatedArv,
//     //     "afterRepairValue": afterRepairValue,
//     //     "arvPercent": arvPercent,
//     //     "onLockbox": onLockbox,
//     //     "combination": combination,
//     //     "monthlyPayment": monthlyPayment,
//     //     "interestRate": interestRate,
//     //     "annualTaxes": annualTaxes,
//     //     "taxYear": taxYear,
//     //     "outstandingTaxes": outstandingTaxes,
//     //     "currentYearExpenses": currentYearExpenses,
//     //     "insurance": insurance,
//     //     "parentID": parentId,
//     //     "appraisalAmount": appraisalAmount,
//     //     "appraisalDate": appraisalDate,
//     //     "appraisalOrderDate": appraisalOrderDate,
//     //     "numberOfUnits": numberOfUnits,
//     //     "referralSource": referralSource,
//     //     "currentValue": currentValue,
//     //     "escrowBalance": escrowBalance,
//     //     "expectedPayoffDate": expectedPayoffDate,
//     //     "listingExpiration": listingExpiration,
//     //     "netRealizableValue": netRealizableValue,
//     //     "payoffGoodThrough": payoffGoodThrough,
//     //     "propertyManagerFees": propertyManagerFees,
//     //     "realEstateAgent": realEstateAgent,
//     //     "realatorCommission": realatorCommission,
//     //     "secured": secured,
//     //     "taxesOwed": taxesOwed,
//     //     "comments": comments,
//     //     "pageNumber": pageNumber,
//     //     "pageSize": pageSize,
//     //     "totalRecords": totalRecords,
//     //     "createdBy": createdBy,
//     //     "createdOn": createdOn.toIso8601String(),
//     //     "modifiedBy": modifiedBy,
//     //     "modifiedOn": modifiedOn,
//     //     "isActive": isActive,
//     //     "isDeleted": isDeleted,
//     //     "createdUser": createdUser,
//     //     "modifiedUser": modifiedUser,
//     // };
// }

class WorkOrder {
    // int? workOrderStatusId;
    String? name;
    // int customerId;
    // dynamic customer;
    // int pageNumber;
    // int pageSize;
    // int totalRecords;
    // String createdBy;
    // DateTime createdOn;
    // dynamic modifiedBy;
    // dynamic modifiedOn;
    bool isActive;
    bool isDeleted;
    // dynamic createdUser;
    // dynamic modifiedUser;
    // int? workOrderTypeId;
    String? type;

    WorkOrder({
        // this.workOrderStatusId,
        this.name,
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
        required this.isDeleted,
        // this.createdUser,
        // this.modifiedUser,
        // this.workOrderTypeId,
        this.type,
    });

    factory WorkOrder.fromJson(Map<String, dynamic> json) => WorkOrder(
        // workOrderStatusId: json["workOrderStatusID"]??0,
        name: json["name"]??'',
        // customerId: json["customerId"]??0,
        // customer: json["customer"],
        // pageNumber: json["pageNumber"]??0,
        // pageSize: json["pageSize"]??0,
        // totalRecords: json["totalRecords"]??0,
        // createdBy: json["createdBy"]??'',
        // createdOn: DateTime.parse(json["createdOn"]??DateTime.now().toString()),
        // modifiedBy: json["modifiedBy"],
        // modifiedOn: json["modifiedOn"],
        isActive: json["isActive"]??false,
        isDeleted: json["isDeleted"]??false,
        // createdUser: json["createdUser"],
        // modifiedUser: json["modifiedUser"],
        // workOrderTypeId: json["workOrderTypeId"]??0,
        type: json["type"]??'',
    );

    // Map<String, dynamic> toJson() => {
    //     "workOrderStatusID": workOrderStatusId,
    //     "name": name,
    //     "customerId": customerId,
    //     "customer": customer,
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
    //     "workOrderTypeId": workOrderTypeId,
    //     "type": type,
    // };
}
