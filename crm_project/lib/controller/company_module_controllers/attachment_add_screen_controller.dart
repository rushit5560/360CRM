import 'dart:developer';
import 'dart:io';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/models/attachment_list_screen_models/attachment_type_list_model.dart';
import 'package:crm_project/models/success_model/success_model.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class AttachmentAddScreenController extends GetxController {

  String companyId = Get.arguments[0];
  RxBool isLoading = false.obs;

  final dioRequest = dio.Dio();
  RxInt isSuccessStatusCode = 0.obs;

  GlobalKey<FormState> attachmentKey = GlobalKey<FormState>();
  final descriptionTextFieldController = TextEditingController();
  RxBool attachmentIsActive = true.obs;
  RxString attachmentTypeSelected = AppMessage.selectAttachmentType.obs;
  RxString attachmentTypeId = ''.obs;
  List<attachmentTypeList> attachmentTypeListDropDown = [];
  // attachmentTypeList attachmentTypeValue = attachmentTypeList();

  RxString filePath = ''.obs;
  RxString fileName = ''.obs;

//file Pick PDF, JPG, JPEG
  Future<void> filePickFunction() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg'],
    );
    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      filePath.value = '${file.path}';
      fileName.value = '${file.name}';
      log('File path: ${file.path}');
      log('File size: ${file.size}');
      log('File bytes: ${file.bytes}');
      log('File name: ${file.name}');

      // File e = File(result.files.single.path!);
      // log('_File path: ${e.path}');
    } else {
      log("else picking the file Cancel");
    }
  }

//Get Attachment Type List
  Future<void> getAttachmentTypeList() async {
    isLoading(true);
    final url = "${ApiUrl.companyAttachmentTypeList}?customerId=${AppMessage.customerId}";
    log('Attachment List Type URL: $url');
    try {
      final response = await dioRequest.get(url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      AttachmentTypeListModel attachmentTypeListModel =
          AttachmentTypeListModel.fromJson(response.data);
      isSuccessStatusCode.value = attachmentTypeListModel.statusCode;
      log('Attachment response: ${response.data}');
      if (isSuccessStatusCode.value == 200) {
        attachmentTypeListDropDown.addAll(attachmentTypeListModel.data);
        log('Attachment type list Api: $isSuccessStatusCode');
      } else {
        log('Else attachment type list Api');
      }
    } catch (e) {
      log('Catch attachment type list: $e');
    }
    isLoading(false);
  }

//add Attachment
  Future<void> addAttachmentFunction() async {
    isLoading(true);
    final url = ApiUrl.companyAttachmentAddApi;
    log('Add Attachment URL: $url');

    try {

      final formData = dio.FormData.fromMap({
        'Description': descriptionTextFieldController.text.toString(),
        'CompanyID': companyId.toString(),
        'IsActive': attachmentIsActive.toString(),
        'AttachmentTypeId':attachmentTypeId.toString(),
        'type': 'company',
        'file': await dio.MultipartFile.fromFile(filePath.toString(), filename: fileName.toString()),
      });

      log('Add Attachment URL: $url');
      final response = await dioRequest.post(url,
          data: formData,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}));
      log('Attachment Add Responce >>> : ${response.data}');

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;
      if(isSuccessStatusCode.value == 200){
        Get.back();
        Fluttertoast.showToast(msg: successModel.message,
            backgroundColor: AppColors.greenColor);
        log('Attachment Add : ${successModel.message}');
      }
      else{
        log('else Attachment Add : ${successModel.message}');
      }
    } catch (e) {
      log('catch Add Attachment : $e');
    }
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    log("Company ID 121212: $companyId");
    super.onInit();
  }

  Future<void> initMethod() async {
    await getAttachmentTypeList();
  }
}
