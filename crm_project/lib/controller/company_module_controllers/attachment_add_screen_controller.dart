import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/models/attachment_list_screen_models/attachment_type_list_model.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:dio/dio.dart'as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AttachmentAddScreenController extends GetxController{
  RxBool isLoading = false.obs;

  final dioRequest = dio.Dio();
  RxInt isSuccessStatusCode = 0.obs;
  
  GlobalKey<FormState> attachmentKey = GlobalKey<FormState>();
  final descriptionTextFieldController = TextEditingController();
  RxString attachmentTypeSelected = 'Select Attachment Type'.obs;
  RxString attachmentTypeId = ''.obs;


//<>List Type Model list name
  List<attachmentTypeList> attachmentTypeListDropDown = [];


//Get Attachment Type List
  Future<void> getAttachmentTypeList()async{
    isLoading(true);
    final url = "${ApiUrl.companyAttachmentTypeList}${AppMessage.customerId}";
    log('Attachment List Type URL: $url');
    try{
      final response = await dioRequest.get(url,options: dio.Options(
          headers: {"Authorization": "Bearer ${AppMessage.token}"}
      ));
      AttachmentTypeListModel attachmentTypeListModel = AttachmentTypeListModel.fromJson(response.data);
      log('Attachment response: ${response.data}');
    }
    catch(e){
      log('Catch attachment type list: $e');
    }
    isLoading(false);
  }


  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod()async{
      await getAttachmentTypeList();
  }
}