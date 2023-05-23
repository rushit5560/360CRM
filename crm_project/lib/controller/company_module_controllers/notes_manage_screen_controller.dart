import 'dart:convert';
import 'dart:developer';

import 'package:crm_project/constants/api_url.dart';
import 'package:crm_project/models/success_model/success_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../models/notes_manage_screen_models/notes_details_model.dart';
import '../../utils/enums.dart';
import '../../utils/messaging.dart';

class NotesManageScreenController extends GetxController {
  NotesOption notesOption = Get.arguments[0];
  String notesId = Get.arguments[1];
  String companyId = Get.arguments[2];

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  final dioRequest = dio.Dio();

  RxString appBarHeader = "".obs;

  TextEditingController notesFieldController = TextEditingController();
  RxBool isStatusSelected = true.obs;

  changeStatusFunction() {
    isStatusSelected.value = !isStatusSelected.value;
    loadUI();
  }

  // Create Notes Function
  Future<void> createNotesFunction() async {
    isLoading(true);
    String url = ApiUrl.companyNotesAddApi;
    log('Create Notes Api Url :$url');

    try {

      Map<String, dynamic> bodyData = {
        "Notes": notesFieldController.text.trim(),
        "customerId": AppMessage.customerId,
        "type": "company",
        "CompanyID": companyId,
        "isActive": isStatusSelected.value
      };

      final response = await dioRequest.post(
        url,
        data: bodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}
        ),
      );
      log('Notes Create Response :${jsonEncode(response.data)}');
      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value = successModel.statusCode;

      if(isSuccessStatusCode.value == 201) {
        Fluttertoast.showToast(msg: successModel.message);
        Get.back();
      } else {
        log('Notes Create Else');
      }

    } catch(e) {
      log('Create Notes Error :$e');
      // rethrow;
    }
    isLoading(false);
  }

  // Get Notes Details By Id Function
  Future<void> getNotesDetailsFunction() async {
    isLoading(true);
    String url = "${ApiUrl.companyNotesDetailsGetApi}?noteId=$notesId";
    log('Get Notes Details By Id Api Url :$url');

    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}
        ),
      );
      log('Get Notes Details Response : ${jsonEncode(response.data)}');

      NoteDetailsModel noteDetailsModel = NoteDetailsModel.fromJson(response.data);
      isSuccessStatusCode.value = noteDetailsModel.statusCode;

      if(isSuccessStatusCode.value == 200) {
        notesFieldController.text = noteDetailsModel.data.notes;
        isStatusSelected.value = noteDetailsModel.data.isActive;
      } else {
        log('Get Notes Details Else');
      }

    } catch(e) {
      log('Get Notes Details By Id Error :$e');
    }
    isLoading(false);
  }


  // Update Notes Function
  Future<void> updateNotesFunction() async {
    isLoading(true);
    String url = ApiUrl.companyNotesUpdateApi;
    log('Update Note Function Api Url : $url');

    try {
      Map<String, dynamic> bodyData = {
        "Notes": notesFieldController.text.trim(),
        "customerId": AppMessage.customerId,
        "type": "company",
        "CompanyID": companyId,
        "isActive": isStatusSelected.value,
        "NoteID": notesId
      };
      log('Update Body Data : $bodyData');


      final response = await dioRequest.put(
        url,
        data: bodyData,
        options: dio.Options(
            headers: {"Authorization": "Bearer ${AppMessage.token}"}
        ),
      );
      log('Update Notes Response : ${jsonEncode(response.data)}');

      SuccessModel successModel = SuccessModel.fromJson(response.data);
      isSuccessStatusCode.value == successModel.statusCode;

      if(isSuccessStatusCode.value == 200) {
        Fluttertoast.showToast(msg: successModel.message);
        Get.back();
      } else {
        log('Update Notes Function Else');
      }

    } catch(e) {
      log('Update Notes Function Error :$e');
    }

    isLoading(false);
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    log('notesId :$notesId');
    bool isCreate = notesOption == NotesOption.create ? true : false;
    appBarHeader.value = isCreate == true ? AppMessage.addNotes : AppMessage.notesDetails;
    // appBarHeader.value = notesOption == NotesOption.create ? AppMessage.addNotes : AppMessage.notesDetails;
    // appBarHeader.value = "";

    if(notesOption == NotesOption.update) {
      await getNotesDetailsFunction();
    }

  }

}