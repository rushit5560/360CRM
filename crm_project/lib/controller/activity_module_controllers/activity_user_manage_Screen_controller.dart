import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:get/get.dart';

import '../../models/activity_list_screen_models/activity_details_screen_models/activity_user_list_screen_models/activity_manage_user_screen_models/get_all_active_role_model.dart';
import '../../utils/enums.dart';
import 'package:dio/dio.dart'as dio;
class ActivityUserManageScreenController extends GetxController{

  ActivityUserManageOption activityUserManageOption = Get.arguments[0];
  String activityUserId = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  final dioRequest = dio.Dio();
    RxBool isActive = true.obs;
  List<ActiveRoleData> activeRoleListDropDown =[];
  ActiveRoleData activeRoleSelectValue= ActiveRoleData();

//get user List
Future<void> getActiveRoleListFunction()async{
  isLoading(true);
  final url = "${ApiUrl.getActiveUserListApi}?CustomerId=${AppMessage.customerId}";
  log("get active role list URL: $url");
  try{
  final response = await dioRequest.get(url,options: dio.Options(headers: {"Authorization": "Bearer ${AppMessage.token}"}));
  // log("get active role list response: $response");
  GetAllActiveRoleModel getAllActiveRoleModel = GetAllActiveRoleModel.fromJson(response.data);
  isSuccessStatusCode.value = getAllActiveRoleModel.statusCode;
  if(isSuccessStatusCode.value == 200){
    activeRoleListDropDown.clear();
    activeRoleListDropDown.add(ActiveRoleData(emailAddress: ''.toString(),fullName: AppMessage.selectRole));
    activeRoleSelectValue = activeRoleListDropDown[0];
    activeRoleListDropDown.addAll(getAllActiveRoleModel.data);

    log("get active role list response : ${getAllActiveRoleModel.statusCode}");

  }else{
    log("else get active role list response : ${getAllActiveRoleModel.statusCode}");
  }


  }catch (e) {
    if (e is dio.DioError && e.response != null) {
      final response = e.response;
      final statusCode = response!.statusCode;
      if (statusCode == 400) {
        // CommonToastModule(msg: "Record Already Exist");
        log("Record Already Exist");
        isLoading(false);
      } else if(statusCode == 401) {
        log('Please login again!');
      }
    }
    log('Error :$e');
  }

  isLoading(false);
}

  @override
  void onInit() {
    log("Activity user manage Screen : $activityUserManageOption");
    log("Activity userId : $activityUserId");
    initMethod();
    super.onInit();
  }
  Future<void>initMethod()async{
    await getActiveRoleListFunction();
  }

}