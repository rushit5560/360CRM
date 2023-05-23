import 'dart:convert';

NoteDetailsModel noteDetailsModelFromJson(String str) => NoteDetailsModel.fromJson(json.decode(str));

// String noteDetailsModelToJson(NoteDetailsModel data) => json.encode(data.toJson());

class NoteDetailsModel {
  int statusCode;
  Data data;

  NoteDetailsModel({
    required this.statusCode,
    required this.data,
  });

  factory NoteDetailsModel.fromJson(Map<String, dynamic> json) => NoteDetailsModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

  /*Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data.toJson(),
  };*/
}

class Data {
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
  // dynamic createdBy;
  // DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  // bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  Data({
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
    // this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    // this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    // createdOn: DateTime.parse(json["createdOn"]),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"] ?? false,
    // isDeleted: json["isDeleted"],
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

  /*Map<String, dynamic> toJson() => {
    "noteID": noteId,
    "notes": notes,
    "parentID": parentId,
    "contactID": contactId,
    "contact": contact,
    "propertyID": propertyId,
    "property": property,
    "companyID": companyId,
    "company": company,
    "offerID": offerId,
    "legalID": legalId,
    "legal": legal,
    "workOrderId": workOrderId,
    "workOrder": workOrder,
    "campaignID": campaignId,
    "campaign": campaign,
    "prospectID": prospectId,
    "prospect": prospect,
    "propertyManagementID": propertyManagementId,
    "propertyManagement": propertyManagement,
    "mortgageID": mortgageId,
    "mortgage": mortgage,
    "type": type,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "totalRecords": totalRecords,
    "createdBy": createdBy,
    "createdOn": createdOn.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "isActive": isActive,
    "isDeleted": isDeleted,
    "createdUser": createdUser,
    "modifiedUser": modifiedUser,
  };*/
}
