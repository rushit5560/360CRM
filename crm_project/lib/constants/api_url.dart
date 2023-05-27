class ApiUrl {
  static String database = "http://5.189.147.159:7003/";
  static String baseUrl = "http://5.189.147.159:7003/api";

  //company Type List
  static String companyTypeList =
      '$baseUrl/CompanyType/GetAllActiveCompanyType?customerId=';

  // Company Api
  static String companyDetailsGetApi = "$baseUrl/Company/GetById?CompanyId=";
  static String companyAddApi = "$baseUrl/Company/AddCompany";
  static String companyUpdateApi = "$baseUrl/Company/UpdateCompany";
  static String companyDeleteApi = "$baseUrl/Company/SoftDeleteCompany";
  static String companyChangeStatusApi = "$baseUrl/Company/ChangeStatus";
  static String allCompanyListApi = "$baseUrl/Company/Filter";

  // Notes Api
  static String companyNotesListApi = "$baseUrl/Note/Filter";
  static String companyNotesDetailsGetApi = "$baseUrl/Note/GetById";
  static String companyNotesAddApi = "$baseUrl/Note/AddNote";
  static String companyNotesUpdateApi = "$baseUrl/Note/UpdateNote";
  static String companyNotesDeleteApi = "$baseUrl/Note/SoftDeleteNote";
  static String companyNotesChangeStatusApi = "$baseUrl/Note/ChangeStatus";

  //company address Api
  static String companyGetAddressApi = "$baseUrl/Address/Filter";
  static String companyGetByIdAddressApi = "$baseUrl/Address/GetById";
  static String companyDeleteAddressApi = "$baseUrl/Address/SoftDeleteAddress";
  static String companyUpdateAddressApi = "$baseUrl/Address/UpdateAddress";
  static String companyAddAddressApi = "$baseUrl/Address/AddAddress";
  static String companyAddressChangeStatusApi = "$baseUrl/Address/ChangeStatus";
  static String getAllAddress = "$baseUrl/AddressType/GetAllActiveAddressType";

  // get city state
  static String getAllState = "$baseUrl/State/GetAllActiveState";
  static String getAllCity = "$baseUrl/City/GetAllActiveCity";
  static String cityGetById = "$baseUrl/City/GetCityByState";

  // company contact Api
  static String companyContactListApi = "$baseUrl/MTMCompanyContact/Filter";
  static String companyContactDetailsGetApi =
      "$baseUrl/MTMCompanyContact/GetMTMCompanyContacts";
  static String companyContactDeleteApi =
      "$baseUrl/MTMCompanyContact/SoftDeleteMTMCompanyContact";
  static String companyContactUpdateApi =
      "$baseUrl/MTMCompanyContact/UpdateMTMCompanyContact";
  static String companyContactAddApi =
      "$baseUrl/MTMCompanyContact/AddMTMCompanyContact";
  static String companyContactStatusChangeApi =
      "$baseUrl/MTMCompanyContact/ChangeStatus";

  // Company Ledger Api
  static String companyGetAllLedgerApi = "$baseUrl/AccountLedger/Filter";
  static String companyLedgerStatusChangeApi =
      "$baseUrl/AccountLedger/ChangeStatus";
  static String companyLedgerGetByIdApi = "$baseUrl/AccountLedger/GetById";
  static String companyLedgerUpdateApi =
      "$baseUrl/AccountLedger/UpdateAccountLedger";
  static String companyLedgerDeleteApi =
      "$baseUrl/AccountLedger/SoftDeleteAccountLedger";
  static String companyLedgerAddApi = "$baseUrl/AccountLedger/AddAccountLedger";

  // Add Ledger Field API - DD using
  static String activeAccountCategoryGetAllApi =
      "$baseUrl/AccountCategory/GetAllActiveAccountCategory";
  static String activePropertyGetAllApi =
      "$baseUrl/Property/GetAllActiveProperty";
  static String activeCompanyGetAllApi = "$baseUrl/Company/GetAllActiveCompany";
  static String activeWorkOrderGetAllApi =
      "$baseUrl/WorkOrder/GetAllActiveWorkOrder";
  static String activeCampaignGetAllApi =
      "$baseUrl/Campaign/GetAllActiveCampaign";
  static String activeContactGetAllApi = "$baseUrl/Contact/GetAllActiveContact";
  static String activeMortgageGetAllApi =
      "$baseUrl/Mortgage/GetAllActiveMortgage";
  static String activeLeaseGetAllApi = "$baseUrl/Lease/GetAllActiveLease";
  static String activePropertyManagementGetAllApi =
      "$baseUrl/PropertyManagement/GetAllActivePropertyManagementNew";
  static String activeProspectsManagementGetAllApi =
      "$baseUrl/Prospect/GetAllActiveProspect";

  //company Attachment Api
  static String companyAttachmentListApi =
      "$baseUrl/Attachment/PaginationByType";
  static String companyAttachmentDeleteApi =
      "$baseUrl/Attachment/SoftDeleteAttachment";
  static String companyAttachmentChangeStatusApi =
      "$baseUrl/Attachment/ChangeStatus";
  static String companyAttachmentAddApi = "$baseUrl/Attachment/AddAttach";
  static String companyAttachmentTypeList =
      "$baseUrl/AttachmentType/GetAllActiveAttachmentType";

  //work order Api
  static String companyWorkOrderList="$baseUrl/WorkOrder/Filter";
  static String companyWorkOrderSoftDeleteApi="$baseUrl/WorkOrder/SoftDeleteWorkOrder";
  static String companyWorkOrderChangeStatusApi="$baseUrl/WorkOrder/ChangeStatus";
  //under Management Api
  static String companyUnderManagementListApi="$baseUrl/PropertyManagement/ListBy";

}
