import 'dart:convert';

ActiveMarketingListModel activeMarketingListModelFromJson(String str) => ActiveMarketingListModel.fromJson(json.decode(str));

String activeMarketingListModelToJson(ActiveMarketingListModel data) => json.encode(data.toJson());

class ActiveMarketingListModel {
  int statusCode;
  List<MarketingData> data;

  ActiveMarketingListModel({
    required this.statusCode,
    required this.data,
  });

  factory ActiveMarketingListModel.fromJson(Map<String, dynamic> json) => ActiveMarketingListModel(
    statusCode: json["statusCode"] ?? 0,
    data: List<MarketingData>.from((json["data"] ?? []).map((x) => MarketingData.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MarketingData {
  int? campaignId;
  // int campaignTypeId;
  // dynamic campaignType;
  String? campaignName;
  // int campaignStatusId;
  // int marketingChannelId;
  // dynamic marketingChannel;
  // dynamic campaignStatus;
  // DateTime startDate;
  // DateTime endDate;
  // int cost;
  // String parentCampaign;
  // String referralSource;
  // String ftpHostName;
  // String ftpUsername;
  // String ftpPassword;
  // dynamic ftpPort;
  // String ftpProxy;
  // bool ftpPassive;
  // String licenseCode;
  // String dataSourceName;
  // String driver;
  // String server;
  // dynamic serverPort;
  // String user;
  // String password;
  // String database;
  // dynamic lastId;
  // dynamic lastRightPanelId;
  // Type type;
  // int propertyId;
  // dynamic property;
  // dynamic prospectId;
  // dynamic prospect;
  // int customerId;
  // dynamic customer;
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

  MarketingData({
    this.campaignId,
    // this.campaignTypeId,
    // this.campaignType,
    this.campaignName,
    // this.campaignStatusId,
    // this.marketingChannelId,
    // this.marketingChannel,
    // this.campaignStatus,
    // this.startDate,
    // this.endDate,
    // this.cost,
    // this.parentCampaign,
    // this.referralSource,
    // this.ftpHostName,
    // this.ftpUsername,
    // this.ftpPassword,
    // this.ftpPort,
    // this.ftpProxy,
    // this.ftpPassive,
    // this.licenseCode,
    // this.dataSourceName,
    // this.driver,
    // this.server,
    // this.serverPort,
    // this.user,
    // this.password,
    // this.database,
    // this.lastId,
    // this.lastRightPanelId,
    // this.type,
    // this.propertyId,
    // this.property,
    // this.prospectId,
    // this.prospect,
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

  factory MarketingData.fromJson(Map<String, dynamic> json) => MarketingData(
    campaignId: json["campaignID"] ?? 0,
    // campaignTypeId: json["campaignTypeId"],
    // campaignType: json["campaignType"],
    campaignName: json["campaignName"] ?? "",
    // campaignStatusId: json["campaignStatusId"],
    // marketingChannelId: json["marketingChannelId"],
    // marketingChannel: json["marketingChannel"],
    // campaignStatus: json["campaignStatus"],
    // startDate: DateTime.parse(json["startDate"]),
    // endDate: DateTime.parse(json["endDate"]),
    // cost: json["cost"],
    // parentCampaign: json["parentCampaign"],
    // referralSource: json["referralSource"],
    // ftpHostName: json["ftpHostName"],
    // ftpUsername: json["ftpUsername"],
    // ftpPassword: json["ftpPassword"],
    // ftpPort: json["ftpPort"],
    // ftpProxy: json["ftpProxy"],
    // ftpPassive: json["ftpPassive"],
    // licenseCode: json["licenseCode"],
    // dataSourceName: json["dataSourceName"],
    // driver: json["driver"],
    // server: json["server"],
    // serverPort: json["serverPort"],
    // user: json["user"],
    // password: json["password"],
    // database: json["database"],
    // lastId: json["lastID"],
    // lastRightPanelId: json["lastRightPanelID"],
    // type: typeValues.map[json["type"]],
    // propertyId: json["propertyID"],
    // property: json["property"],
    // prospectId: json["prospectID"],
    // prospect: json["prospect"],
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
