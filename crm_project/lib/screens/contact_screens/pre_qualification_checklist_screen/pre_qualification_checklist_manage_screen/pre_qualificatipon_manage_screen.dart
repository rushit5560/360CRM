import 'package:crm_project/screens/contact_screens/pre_qualification_checklist_screen/pre_qualification_checklist_manage_screen/pre_qualification_manage_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/contact_module_controller/pre_qualification_checklist_manage_screen_controller.dart';

class PreQualificationCheckListManageScreen extends StatelessWidget {
  PreQualificationCheckListManageScreen({Key? key}) : super(key: key);
  final preQualificationChecklistMangeScreenController =
      Get.put(PreQualificationChecklistMangeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
        actionShow: false,
        leadingShow: false,
        titleText:
            preQualificationChecklistMangeScreenController.appBarHeader.value,
      ),
      body: Column(
        children: [
          PreQualificationDatePickerModule(),
          const SizedBox(height: 10),
          CheckboxListModule(),
        ],
      ).paddingSymmetric(horizontal: 8, vertical: 8),
    );
  }
}
