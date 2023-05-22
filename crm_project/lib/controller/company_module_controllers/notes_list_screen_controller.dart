import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../constants/api_url.dart';
import '../../models/notes_manage_screen_models/notes_list_model.dart';
import '../../models/notes_manage_screen_models/success_model.dart';
import '../../utils/messaging.dart';

class NotesListScreenController extends GetxController {
  String companyId = Get.arguments[0];
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  final dioRequest = dio.Dio();

  List<NoteDetails> notesList = [];

  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int pageIndex = 1;
  int pageCount = 10;



  // Get Notes List Function
  Future<void> getNotesFunction() async {

    if(hasMore == true) {
      // isLoading(true);
      String url = "${ApiUrl
          .companyNotesListApi}?id=$companyId&PageNumber=$pageIndex&PageSize=$pageCount&type=company";
      log('Get Notes Api Url :$url');

      try {
        final response = await dioRequest.get(
          url,
          options: dio.Options(
              headers: {"Authorization": "Bearer ${AppMessage.token}"}
          ),
        );
        log('Get Notes Api Response : ${jsonEncode(response.data)}');

        NotesListModel notesListModel = NotesListModel.fromJson(response.data);
        isSuccessStatusCode.value = notesListModel.statusCode;

        if (isSuccessStatusCode.value == 200) {
          notesList.addAll(notesListModel.data.data);

          if (notesListModel.data.data.length < 10) {
            hasMore = false;
          }
        } else {
          log('Get Notes Function Else ${notesListModel.data.message}');
        }


      } catch (e) {
        log('Get Notes Function Error :$e');
        rethrow;
      }
      loadUI();
      // isLoading(false);
    } else {
      isLoading(false);
    }
    isLoading(false);
  }

  // Change notes status function
  Future<void> changeNoteFunction({required String noteId, required bool status, required int index}) async {
    isLoading(true);
    String url = ApiUrl.companyNotesChangeStatusApi;

    Map<String, dynamic> bodyData = {
      "NoteID": noteId,
      "IsActive": status
    };

    final response = await dioRequest.put(
      url,
      data: bodyData,
      options: dio.Options(
          headers: {"Authorization": "Bearer ${AppMessage.token}"}
      ),
    );

    log('Change Status Response :${jsonEncode(response.data)}');
    SuccessModel successModel = SuccessModel.fromJson(response.data);
    isSuccessStatusCode.value = successModel.statusCode;

    if(isSuccessStatusCode.value == 200) {

      Fluttertoast.showToast(msg: successModel.message);
      notesList[index].isActive = status;
    } else {
     log('Change Status Function Else');
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

    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        //api call for more pet
        if (hasMore == true) {
          pageIndex++;
        }
        log("pageIndex : $pageIndex");
        await getNotesFunction();
      }
    });

  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}