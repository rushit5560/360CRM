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
  // contact notes
  static String contactNotesGetApi="$baseUrl/Note/Filter";
  // Ledger Api
  static String getAllLedgerApi = "$baseUrl/AccountLedger/Filter";
  static String ledgerStatusChangeApi = "$baseUrl/AccountLedger/ChangeStatus";
  static String ledgerGetByIdApi = "$baseUrl/AccountLedger/GetById";
  static String ledgerUpdateApi = "$baseUrl/AccountLedger/UpdateAccountLedger";
  static String ledgerDeleteApi = "$baseUrl/AccountLedger/SoftDeleteAccountLedger";
  static String ledgerAddApi = "$baseUrl/AccountLedger/AddAccountLedger";
  // Get Active List  API - DD using
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
  static String activeContactTypeGetAllApi =
      "$baseUrl/ContactType/GetAllActiveContactType";
  static String getAllActivePaymentTypeApi = "$baseUrl/PaymentType/GetAllActivePaymentType";
  static String getAllActivePaymentMethodApi = "$baseUrl/PaymentMethod/GetAllActivePaymentMethod";
  static String getAllActiveRepairAreaApi = "$baseUrl/RepairArea/GetAllActiveRepairArea";
  //  company contact api
  static String activeContactCategoryGetAllApi =
      "$baseUrl/ContactCategory/GetAllActiveContactCategory";
  static String activeAreaOfInterestGetAllApi =
      "$baseUrl/AreaOfInterest/GetAllActiveAreaOfInterest";
  static String contactRoleGetAllApi =
      "$baseUrl/ContactRole/GetAllActiveContactRole";
  static String contactAddApi = "$baseUrl/Contact/AddContact";
  static String deleteContactApi =
      "$baseUrl/MTMCompanyContact/SoftDeleteMTMCompanyContact";
  static String getByIdContactApi = "$baseUrl/MTMCompanyContact/GetMTMCompanyContactByContactID";
  static String contactUpdateApi = "$baseUrl/Contact/UpdateContact";
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
  // contact attachment api
  static String contactAttachmentApi="$baseUrl/Attachment/PaginationByType";
  //work order Api
  static String companyWorkOrderAddApi = "$baseUrl/WorkOrder/AddWorkOrder";
  static String companyWorkOrderList = "$baseUrl/WorkOrder/Filter";
  static String companyWorkOrderSoftDeleteApi =
      "$baseUrl/WorkOrder/SoftDeleteWorkOrder";
  static String companyWorkOrderChangeStatusApi =
      "$baseUrl/WorkOrder/ChangeStatus";
  static String companyWorkOrderAddTypeListApi =
      "$baseUrl/WorkOrder/GetAllActiveWorkOrder";
  // Bill Api
  static String getAllBillApi = "$baseUrl/Bill/Filter";
  static String getAllBillByIdApi = "$baseUrl/Bill/GetById";
  static String changeBillStatusApi = "$baseUrl/Bill/ChangeStatus";
  static String updateBillApi = "$baseUrl/Bill/UpdateBill";
  static String addBillApi = "$baseUrl/Bill/AddBill";
  static String deleteBillApi = "$baseUrl/Bill/SoftDeleteBill";
  //under Management Api
  static String companyUnderManagementListApi =
      "$baseUrl/PropertyManagement/ListBy";
  // contact preQualificationChecklist
  static String getPreQualificationListApi="$baseUrl/PreQualificationCheckList/Filter";
  static String preQualificationAddApi="$baseUrl/PreQualificationCheckList/AddPreQualificationCheckList";
  static String deletePreQualificationCheckListApi="$baseUrl/PreQualificationCheckList/SoftDeletePreQualificationCheckList";
  //Work order Details Api
  static String  workOrderDetailsApi = "$baseUrl/WorkOrder/GetWorkOrderById";
  static String workOrderTypeApi  = "$baseUrl/WorkOrderType/GetAllActiveWorkOrderType";
  static String workOrderStatusApi = "$baseUrl/WorkOrderStatus/GetAllActiveWorkOrderStatus";
  static String workOrderPropertyApi = "$baseUrl/Property/GetAllActiveProperty";
  static String workOrderCompanyApi = "$baseUrl/Company/GetAllActiveCompany";
  static String workOrderUpdateApi = "$baseUrl/WorkOrder/UpdateWorkOrder";
  //invoice Api
  static String invoiceListApi = "$baseUrl/Invoice/Filter";
  static String invoiceStatusChangeApi = "$baseUrl/Invoice/ChangeStatus";
  static String invoiceSoftDeleteApi = "$baseUrl/Invoice/SoftDeleteInvoice";
  static String addInvoiceApi = "$baseUrl/Invoice/AddInvoice";
  static String updateInvoiceApi = "$baseUrl/Invoice/UpdateInvoice";

  //activity Api
  static String activityListApi = "$baseUrl/Activity/Filter";
  static String activitySoftDeleteApi = "$baseUrl/Activity/SoftDeleteActivity";
  static String activityStatusChangeApi = "$baseUrl/Activity/ChangeStatus";
  static String activityTypeListApi = "$baseUrl/ActivityType/GetAllActiveActivityType";
  static String activityPriorityListApi = "$baseUrl/Priority/GetAllActivePriority";
  static String activityStatusListApi = "$baseUrl/ActivityStatus/GetAllActiveActivityStatus";
  static String getActivityDetailsApi = "$baseUrl/Activity/GetById";
  static String updateActivityApi = "$baseUrl/Activity/UpdateActivity";
  static String addActivityApi = "$baseUrl/Activity/AddActivity";

  static String userListApi = "$baseUrl/MTMActivityUser/Filter";
  static String userChangeStatusApi = "$baseUrl/MTMActivityUser/ChangeStatus";
  static String userSoftDeleteApi = "$baseUrl/MTMActivityUser/SoftDeleteMTMActivityUser";

  static String getActiveUserListApi = "$baseUrl/SystemUsers/GetAllActiveUsers";


}
