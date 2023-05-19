class ApiUrl {
  static String database = "http://5.189.147.159:7003/";
  static String baseUrl = "http://5.189.147.159:7003/api";


  // Company Api
  static String companyDetailsGetApi = "$baseUrl/Company/GetById?CompanyId=";
  static String companyAddApi = "$baseUrl/Company/AddCompany";
  static String companyUpdateApi = "$baseUrl/Company/UpdateCompany";
  static String companyDeleteApi = "$baseUrl/Company/SoftDeleteCompany";
  static String companyChangeStatusApi = "$baseUrl/Company/ChangeStatus";

}