class ApiUrl {
  static String database = "http://5.189.147.159:7003/";
  static String baseUrl = "http://5.189.147.159:7003/api";

  //company Type List
  static String companyTypeList = '$baseUrl/CompanyType/GetAllActiveCompanyType?customerId=';

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
  static String companyGetByIdAddressApi="$baseUrl/Address/GetById";
  static String companyDeleteAddressApi="$baseUrl/Address/SoftDeleteAddress";
  static String companyUpdateAddressApi="$baseUrl/Address/UpdateAddress";
  static String companyAddAddressApi="$baseUrl/Address/AddAddress";

  //company Attachment Api
  static String companyAttachmentListApi="$baseUrl/Attachment/PaginationByType";
  static String companyAttachmentDeleteApi="$baseUrl/Attachment/SoftDeleteAttachment";
  static String companyAttachmentChangeStatusApi="$baseUrl/Attachment/ChangeStatus";
  static String companyAttachmentAddApi="$baseUrl/Attachment/AddAttach";
  static String companyAttachmentTypeList="$baseUrl/AttachmentType/GetAllActiveAttachmentType?customerId=";

}