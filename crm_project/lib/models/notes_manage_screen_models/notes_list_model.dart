import 'dart:convert';

NotesListModel notesListModelFromJson(String str) => NotesListModel.fromJson(json.decode(str));

String notesListModelToJson(NotesListModel data) => json.encode(data.toJson());

class NotesListModel {
  int statusCode;
  Data data;

  NotesListModel({
    required this.statusCode,
    required this.data,
  });

  factory NotesListModel.fromJson(Map<String, dynamic> json) => NotesListModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data.toJson(),
  };
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
  List<NoteDetails> data;
  bool succeeded;
  String errors;
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
    required this.errors,
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
    data: List<NoteDetails>.from((json["data"] ?? []).map((x) => NoteDetails.fromJson(x ?? {}))),
    succeeded: json["succeeded"] ?? false,
    errors: json["errors"] ?? "",
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    // "firstPage": firstPage,
    // "lastPage": lastPage,
    "totalPages": totalPages,
    "totalRecords": totalRecords,
    // "nextPage": nextPage,
    // "previousPage": previousPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "succeeded": succeeded,
    "errors": errors,
    "message": message,
  };
}

class NoteDetails {
  int noteId;
  String notes;
  // dynamic parentId;
  // dynamic contactId;
  // dynamic contact;
  // dynamic propertyId;
  // dynamic property;
  // int companyId;
  // dynamic company;
  // dynamic offerId;
  // dynamic legalId;
  // dynamic legal;
  // dynamic workOrderId;
  // dynamic workOrder;
  // dynamic campaignId;
  // dynamic campaign;
  // dynamic prospectId;
  // dynamic prospect;
  // dynamic propertyManagementId;
  // dynamic propertyManagement;
  // dynamic mortgageId;
  // dynamic mortgage;
  // String type;
  // int pageNumber;
  // int pageSize;
  // int totalRecords;
  // String createdBy;
  DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  NoteDetails({
    required this.noteId,
    required this.notes,
    // this.parentId,
    // this.contactId,
    // this.contact,
    // this.propertyId,
    // this.property,
    // this.companyId,
    // this.company,
    // this.offerId,
    // this.legalId,
    // this.legal,
    // this.workOrderId,
    // this.workOrder,
    // this.campaignId,
    // this.campaign,
    // this.prospectId,
    // this.prospect,
    // this.propertyManagementId,
    // this.propertyManagement,
    // this.mortgageId,
    // this.mortgage,
    // this.type,
    // this.pageNumber,
    // this.pageSize,
    // this.totalRecords,
    // this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory NoteDetails.fromJson(Map<String, dynamic> json) => NoteDetails(
    noteId: json["noteID"] ?? 0,
    notes: json["notes"] ?? "",
    // parentId: json["parentID"],
    // contactId: json["contactID"],
    // contact: json["contact"],
    // propertyId: json["propertyID"],
    // property: json["property"],
    // companyId: json["companyID"],
    // company: json["company"],
    // offerId: json["offerID"],
    // legalId: json["legalID"],
    // legal: json["legal"],
    // workOrderId: json["workOrderId"],
    // workOrder: json["workOrder"],
    // campaignId: json["campaignID"],
    // campaign: json["campaign"],
    // prospectId: json["prospectID"],
    // prospect: json["prospect"],
    // propertyManagementId: json["propertyManagementID"],
    // propertyManagement: json["propertyManagement"],
    // mortgageId: json["mortgageID"],
    // mortgage: json["mortgage"],
    // type: json["type"],
    // pageNumber: json["pageNumber"],
    // pageSize: json["pageSize"],
    // totalRecords: json["totalRecords"],
    // createdBy: json["createdBy"],
    createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"] ?? false,
    isDeleted: json["isDeleted"] ?? false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  Map<String, dynamic> toJson() => {
    "noteID": noteId,
    "notes": notes,
    // "parentID": parentId,
    // "contactID": contactId,
    // "contact": contact,
    // "propertyID": propertyId,
    // "property": property,
    // "companyID": companyId,
    // "company": company,
    // "offerID": offerId,
    // "legalID": legalId,
    // "legal": legal,
    // "workOrderId": workOrderId,
    // "workOrder": workOrder,
    // "campaignID": campaignId,
    // "campaign": campaign,
    // "prospectID": prospectId,
    // "prospect": prospect,
    // "propertyManagementID": propertyManagementId,
    // "propertyManagement": propertyManagement,
    // "mortgageID": mortgageId,
    // "mortgage": mortgage,
    // "type": type,
    // "pageNumber": pageNumber,
    // "pageSize": pageSize,
    // "totalRecords": totalRecords,
    // "createdBy": createdBy,
    "createdOn": createdOn.toIso8601String(),
    // "modifiedBy": modifiedBy,
    // "modifiedOn": modifiedOn,
    "isActive": isActive,
    "isDeleted": isDeleted,
    // "createdUser": createdUser,
    // "modifiedUser": modifiedUser,
  };
}
