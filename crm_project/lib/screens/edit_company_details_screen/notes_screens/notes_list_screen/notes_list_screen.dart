import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/company_module_controllers/notes_list_screen_controller.dart';

class NotesListScreen extends StatelessWidget {
  NotesListScreen({Key? key}) : super(key: key);
  final notesListScreenController = Get.put(NotesListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
