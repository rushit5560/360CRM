import 'dart:convert';

AddDealAnalyzerModel addDealAnalyzerModelFromJson(String str) => AddDealAnalyzerModel.fromJson(json.decode(str));

class AddDealAnalyzerModel {
  int statusCode;
  bool success;
  // Data data;
  String message;

  AddDealAnalyzerModel({
    required this.statusCode,
    required this.success,
    // required this.data,
    required this.message,
  });

  factory AddDealAnalyzerModel.fromJson(Map<String, dynamic> json) => AddDealAnalyzerModel(
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    // data: Data.fromJson(json["data"] ?? {}),
    message: json["message"] ?? "",
  );

  /*Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data.toJson(),
    "message": message,
  };*/
}

/*class Data {
  int daid;
  String address;
  int cityId;
  // dynamic city;
  int stateId;
  // dynamic state;
  String zip;
  int campaignId;
  // dynamic campaign;
  int expectedArv;
  int landValue;
  int offerPrice;
  int grossMonthlyRevenue;
  int propertyMgmtFeesPercent;
  int propertyMgmtFeesAmount;
  int vacancyReplacementReserves;
  int vacancyReplacementAmount;
  int monthlyCondoFees;
  int monthlyTaxes;
  int monthlyRepairsMaintenance;
  int adminstrativeAllowance;
  int monthlyInsurance;
  int firstMortgagePayment;
  int secondMortgagePayment;
  int monthlyUtilities;
  int rehabCostsPaidOutPocket;
  int rehabCostsFinanced;
  int appraisal;
  int inspection;
  int survey;
  int wholeSaleFee;
  int firstMortgageDetailsId;
  MortgageDetails firstMortgageDetails;
  int secondMortgageDetailsId;
  MortgageDetails secondMortgageDetails;
  int effectiveGrossIncome;
  int operatingExpenses;
  int netOperatingIncome;
  int capitalizationRate;
  int annualDebtService;
  int debtCoverageRatio;
  int annualCashFlow;
  int totalOutPocket;
  int returnInvestment;
  int salesPrice;
  int purchasePrice;
  int acquisitionCosts;
  int carryingCosts;
  int rehabCost;
  int sellingExpenses;
  int totalProjectCost;
  int netProfit;
  int totalOutOfPocket;
  int annualizedRoi;
  int prospectId;
  Prospect prospect;
  String type;
  int pageNumber;
  int pageSize;
  int totalRecords;
  // dynamic createdBy;
  DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  Data({
    required this.daid,
    required this.address,
    required this.cityId,
    // this.city,
    required this.stateId,
    // this.state,
    required this.zip,
    required this.campaignId,
    // this.campaign,
    required this.expectedArv,
    required this.landValue,
    required this.offerPrice,
    required this.grossMonthlyRevenue,
    required this.propertyMgmtFeesPercent,
    required this.propertyMgmtFeesAmount,
    required this.vacancyReplacementReserves,
    required this.vacancyReplacementAmount,
    required this.monthlyCondoFees,
    required this.monthlyTaxes,
    required this.monthlyRepairsMaintenance,
    required this.adminstrativeAllowance,
    required this.monthlyInsurance,
    required this.firstMortgagePayment,
    required this.secondMortgagePayment,
    required this.monthlyUtilities,
    required this.rehabCostsPaidOutPocket,
    required this.rehabCostsFinanced,
    required this.appraisal,
    required this.inspection,
    required this.survey,
    required this.wholeSaleFee,
    required this.firstMortgageDetailsId,
    required this.firstMortgageDetails,
    required this.secondMortgageDetailsId,
    required this.secondMortgageDetails,
    required this.effectiveGrossIncome,
    required this.operatingExpenses,
    required this.netOperatingIncome,
    required this.capitalizationRate,
    required this.annualDebtService,
    required this.debtCoverageRatio,
    required this.annualCashFlow,
    required this.totalOutPocket,
    required this.returnInvestment,
    required this.salesPrice,
    required this.purchasePrice,
    required this.acquisitionCosts,
    required this.carryingCosts,
    required this.rehabCost,
    required this.sellingExpenses,
    required this.totalProjectCost,
    required this.netProfit,
    required this.totalOutOfPocket,
    required this.annualizedRoi,
    required this.prospectId,
    required this.prospect,
    required this.type,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    // this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    daid: json["daid"] ?? 0,
    address: json["address"] ?? "",
    cityId: json["cityId"] ?? 0,
    // city: json["city"],
    stateId: json["stateId"] ?? 0,
    // state: json["state"],
    zip: json["zip"] ?? "",
    campaignId: json["campaignId"] ?? 0,
    // campaign: json["campaign"],
    expectedArv: json["expectedARV"] ?? 0,
    landValue: json["landValue"] ?? 0,
    offerPrice: json["offerPrice"] ?? 0,
    grossMonthlyRevenue: json["grossMonthlyRevenue"] ?? 0,
    propertyMgmtFeesPercent: json["propertyMgmtFeesPercent"] ?? 0,
    propertyMgmtFeesAmount: json["propertyMgmtFeesAmount"] ?? 0,
    vacancyReplacementReserves: json["vacancyReplacementReserves"] ?? 0,
    vacancyReplacementAmount: json["vacancyReplacementAmount"] ?? 0,
    monthlyCondoFees: json["monthlyCondoFees"] ?? 0,
    monthlyTaxes: json["monthlyTaxes"] ?? 0,
    monthlyRepairsMaintenance: json["monthlyRepairsMaintenance"] ?? 0,
    adminstrativeAllowance: json["adminstrativeAllowance"] ?? 0,
    monthlyInsurance: json["monthlyInsurance"] ?? 0,
    firstMortgagePayment: json["firstMortgagePayment"] ?? 0,
    secondMortgagePayment: json["secondMortgagePayment"] ?? 0,
    monthlyUtilities: json["monthlyUtilities"] ?? 0,
    rehabCostsPaidOutPocket: json["rehabCostsPaidOutPocket"] ?? 0,
    rehabCostsFinanced: json["rehabCostsFinanced"] ?? 0,
    appraisal: json["appraisal"] ?? 0,
    inspection: json["inspection"] ?? 0,
    survey: json["survey"] ?? 0,
    wholeSaleFee: json["wholeSaleFee"] ?? 0,
    firstMortgageDetailsId: json["firstMortgageDetailsId"] ?? 0,
    firstMortgageDetails: MortgageDetails.fromJson(json["firstMortgageDetails"] ?? {}),
    secondMortgageDetailsId: json["secondMortgageDetailsId"] ?? 0,
    secondMortgageDetails: MortgageDetails.fromJson(json["secondMortgageDetails"] ?? {}),
    effectiveGrossIncome: json["effectiveGrossIncome"] ?? 0,
    operatingExpenses: json["operatingExpenses"] ?? 0,
    netOperatingIncome: json["netOperatingIncome"] ?? 0,
    capitalizationRate: json["capitalizationRate"] ?? 0,
    annualDebtService: json["annualDebtService"] ?? 0,
    debtCoverageRatio: json["debtCoverageRatio"] ?? 0,
    annualCashFlow: json["annualCashFlow"] ?? 0,
    totalOutPocket: json["totalOutPocket"] ?? 0,
    returnInvestment: json["returnInvestment"] ?? 0,
    salesPrice: json["salesPrice"] ?? 0,
    purchasePrice: json["purchasePrice"] ?? 0,
    acquisitionCosts: json["acquisitionCosts"] ?? 0,
    carryingCosts: json["carryingCosts"] ?? 0,
    rehabCost: json["rehabCost"] ?? 0,
    sellingExpenses: json["sellingExpenses"] ?? 0,
    totalProjectCost: json["totalProjectCost"] ?? 0,
    netProfit: json["netProfit"] ?? 0,
    totalOutOfPocket: json["totalOutOfPocket"] ?? 0,
    annualizedRoi: json["annualizedROI"] ?? 0,
    prospectId: json["prospectID"] ?? 0,
    prospect: Prospect.fromJson(json["prospect"] ?? {}),
    type: json["type"] ?? "",
    pageNumber: json["pageNumber"] ?? 0,
    pageSize: json["pageSize"] ?? 0,
    totalRecords: json["totalRecords"] ?? 0,
    // createdBy: json["createdBy"],
    createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"] ?? false,
    isDeleted: json["isDeleted"] ?? false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

}*/

class MortgageDetails {
  int mortgageDetailsId;
  int mortgageTerms;
  int paymentsPerYear;
  int downPaymentPercent;
  int downPaymentAmt;
  int financedAmount;
  int interestRate;
  bool interestOnly;
  int loanPoints;
  int pointsAmount;
  bool pointsFinanced;
  int closingCosts;
  bool closingCostsFinanced;
  int mortgageAmount;

  MortgageDetails({
    required this.mortgageDetailsId,
    required this.mortgageTerms,
    required this.paymentsPerYear,
    required this.downPaymentPercent,
    required this.downPaymentAmt,
    required this.financedAmount,
    required this.interestRate,
    required this.interestOnly,
    required this.loanPoints,
    required this.pointsAmount,
    required this.pointsFinanced,
    required this.closingCosts,
    required this.closingCostsFinanced,
    required this.mortgageAmount,
  });

  factory MortgageDetails.fromJson(Map<String, dynamic> json) => MortgageDetails(
    mortgageDetailsId: json["mortgageDetailsId"] ?? 0,
    mortgageTerms: json["mortgageTerms"] ?? 0,
    paymentsPerYear: json["paymentsPerYear"] ?? 0,
    downPaymentPercent: json["downPaymentPercent"] ?? 0,
    downPaymentAmt: json["downPaymentAmt"] ?? 0,
    financedAmount: json["financedAmount"] ?? 0,
    interestRate: json["interestRate"] ?? 0,
    interestOnly: json["interestOnly"] ?? false,
    loanPoints: json["loanPoints"] ?? 0,
    pointsAmount: json["pointsAmount"] ?? 0,
    pointsFinanced: json["pointsFinanced"] ?? false,
    closingCosts: json["closingCosts"] ?? 0,
    closingCostsFinanced: json["closingCostsFinanced"] ?? false,
    mortgageAmount: json["mortgageAmount"] ?? 0,
  );

}

class Prospect {
  int prospectId;
  String propertyAddress;
  int cityId;
  // dynamic city;
  int stateId;
  // dynamic state;
  String zip;
  String prospectType;
  String prospectSource;
  // dynamic prospectStatusId;
  // dynamic prospectStatus;
  // dynamic closingDate;
  String squareFeet;
  String bedrooms;
  String bathrooms;
  String garage;
  String pool;
  String occupied;
  // dynamic propertyTypeId;
  // dynamic propertyType;
  // dynamic firstMortgageBalance;
  // dynamic firstMortgageInterest;
  // dynamic firstMortgagePayment;
  // dynamic secondMortgageBalance;
  // dynamic secondMortgageInterest;
  // dynamic secondMortgagePayment;
  String listed;
  // dynamic listingPrice;
  // dynamic homeValue;
  // dynamic askingPrice;
  String knownRepairs;
  String sellingReason;
  String additional;
  String behind;
  // dynamic amountBehind;
  // dynamic quickClosePrice;
  String misc;
  int arv;
  int purchasePrice;
  int downPaymentPercent;
  int downPayment;
  bool interestOnly;
  int interestRate;
  int mortgageTerm;
  // dynamic holdingTerm;
  int condoAssocFees;
  int taxes;
  int insurance;
  // dynamic loanPayment;
  // dynamic utilities;
  // dynamic rentRate;
  String lotSize;
  String stories;
  String parking;
  // dynamic customerId;
  // dynamic customer;
  int pageNumber;
  int pageSize;
  int totalRecords;
  // dynamic createdBy;
  DateTime createdOn;
  // dynamic modifiedBy;
  // dynamic modifiedOn;
  bool isActive;
  bool isDeleted;
  // dynamic createdUser;
  // dynamic modifiedUser;

  Prospect({
    required this.prospectId,
    required this.propertyAddress,
    required this.cityId,
    // this.city,
    required this.stateId,
    // this.state,
    required this.zip,
    required this.prospectType,
    required this.prospectSource,
    // this.prospectStatusId,
    // this.prospectStatus,
    // this.closingDate,
    required this.squareFeet,
    required this.bedrooms,
    required this.bathrooms,
    required this.garage,
    required this.pool,
    required this.occupied,
    // this.propertyTypeId,
    // this.propertyType,
    // this.firstMortgageBalance,
    // this.firstMortgageInterest,
    // this.firstMortgagePayment,
    // this.secondMortgageBalance,
    // this.secondMortgageInterest,
    // this.secondMortgagePayment,
    required this.listed,
    // this.listingPrice,
    // this.homeValue,
    // this.askingPrice,
    required this.knownRepairs,
    required this.sellingReason,
    required this.additional,
    required this.behind,
    // this.amountBehind,
    // this.quickClosePrice,
    required this.misc,
    required this.arv,
    required this.purchasePrice,
    required this.downPaymentPercent,
    required this.downPayment,
    required this.interestOnly,
    required this.interestRate,
    required this.mortgageTerm,
    // this.holdingTerm,
    required this.condoAssocFees,
    required this.taxes,
    required this.insurance,
    // this.loanPayment,
    // this.utilities,
    // this.rentRate,
    required this.lotSize,
    required this.stories,
    required this.parking,
    // this.customerId,
    // this.customer,
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    // this.createdBy,
    required this.createdOn,
    // this.modifiedBy,
    // this.modifiedOn,
    required this.isActive,
    required this.isDeleted,
    // this.createdUser,
    // this.modifiedUser,
  });

  factory Prospect.fromJson(Map<String, dynamic> json) => Prospect(
    prospectId: json["prospectId"] ?? 0,
    propertyAddress: json["propertyAddress"] ?? "",
    cityId: json["cityId"] ?? 0,
    // city: json["city"],
    stateId: json["stateId"] ?? 0,
    // state: json["state"],
    zip: json["zip"] ?? "",
    prospectType: json["prospectType"] ?? "",
    prospectSource: json["prospectSource"] ?? "",
    // prospectStatusId: json["prospectStatusID"],
    // prospectStatus: json["prospectStatus"],
    // closingDate: json["closingDate"],
    squareFeet: json["squareFeet"] ?? "",
    bedrooms: json["bedrooms"] ?? "",
    bathrooms: json["bathrooms"] ?? "",
    garage: json["garage"] ?? "",
    pool: json["pool"] ?? "",
    occupied: json["occupied"] ?? "",
    // propertyTypeId: json["propertyTypeID"],
    // propertyType: json["propertyType"],
    // firstMortgageBalance: json["firstMortgageBalance"],
    // firstMortgageInterest: json["firstMortgageInterest"],
    // firstMortgagePayment: json["firstMortgagePayment"],
    // secondMortgageBalance: json["secondMortgageBalance"],
    // secondMortgageInterest: json["secondMortgageInterest"],
    // secondMortgagePayment: json["secondMortgagePayment"],
    listed: json["listed"] ?? "",
    // listingPrice: json["listingPrice"],
    // homeValue: json["homeValue"],
    // askingPrice: json["askingPrice"],
    knownRepairs: json["knownRepairs"] ?? "",
    sellingReason: json["sellingReason"] ?? "",
    additional: json["additional"] ?? "",
    behind: json["behind"] ?? "",
    // amountBehind: json["amountBehind"],
    // quickClosePrice: json["quickClosePrice"],
    misc: json["misc"] ?? "",
    arv: json["arv"] ?? 0,
    purchasePrice: json["purchasePrice"] ?? 0,
    downPaymentPercent: json["downPaymentPercent"] ?? 0,
    downPayment: json["downPayment"] ?? 0,
    interestOnly: json["interestOnly"],
    interestRate: json["interestRate"] ?? 0,
    mortgageTerm: json["mortgageTerm"] ?? 0,
    // holdingTerm: json["holdingTerm"],
    condoAssocFees: json["condoAssocFees"] ?? 0,
    taxes: json["taxes"] ?? 0,
    insurance: json["insurance"] ?? 0,
    // loanPayment: json["loanPayment"],
    // utilities: json["utilities"],
    // rentRate: json["rentRate"],
    lotSize: json["lotSize"] ?? "",
    stories: json["stories"] ?? "",
    parking: json["parking"] ?? "",
    // customerId: json["customerId"],
    // customer: json["customer"],
    pageNumber: json["pageNumber"] ?? 0,
    pageSize: json["pageSize"] ?? 0,
    totalRecords: json["totalRecords"] ?? 0,
    // createdBy: json["createdBy"],
    createdOn: DateTime.parse(json["createdOn"] ?? DateTime.now()),
    // modifiedBy: json["modifiedBy"],
    // modifiedOn: json["modifiedOn"],
    isActive: json["isActive"] ?? false,
    isDeleted: json["isDeleted"] ?? false,
    // createdUser: json["createdUser"],
    // modifiedUser: json["modifiedUser"],
  );

}
