import 'dart:developer';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../constants/api_url.dart';
import '../../utils/messaging.dart';

class NotesListScreenController extends GetxController {
  String companyId = Get.arguments[0];
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  final dioRequest = dio.Dio();


  int pageIndex = 1;
  int pageCount = 10;



  Future<void> getNotesFunction() async {
    isLoading(true);
    String url = "${ApiUrl.companyNotesListApi}?CompanyID=$companyId&PageNumber=$pageIndex&PageSize=$pageCount";
    log('Get Notes Api Url :$url');

    try {

      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}
        ),
      );
      log('Get Notes Api Response : ${response.data}');

    } catch(e) {
      log('Get Notes Function Error :$e');
      rethrow;
    }
    isLoading(false);
  }


  @override
  void onInit() {
    initMethod();
    super.onInit();
  }


  Future<void> initMethod() async {
    await getNotesFunction();
  }
}