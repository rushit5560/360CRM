import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/company_module_controllers/contact_module_controller/pre_qualification_checklist_manage_screen_controller.dart';

class PreQualificationManageScreen extends StatelessWidget {
  PreQualificationManageScreen({Key? key}) : super(key: key);
  final preQualificationChecklistMangeScreenController =
      Get.put(PreQualificationChecklistMangeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
