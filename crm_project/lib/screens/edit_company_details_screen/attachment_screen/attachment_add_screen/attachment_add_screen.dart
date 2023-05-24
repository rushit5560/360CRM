import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/attachment_add_screen_controller.dart';
import 'package:crm_project/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';

class AttachmentAddScreen extends StatelessWidget {
  AttachmentAddScreen({Key? key}) : super(key: key);
  final attachmentAddScreenController =
      Get.put(AttachmentAddScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: 'Add Attachments', leadingShow: false, actionShow: false),
      body: SafeArea(
        child: Obx(
          () => attachmentAddScreenController.isLoading.value
              ? CommonLoader().showLoader()
              : SingleChildScrollView(
                  child: Form(
                    key: attachmentAddScreenController.attachmentKey,
                    child: Column(children: [
                      TextFieldModule(
                          fieldController: attachmentAddScreenController
                              .descriptionTextFieldController,
                          hintText: 'Description',
                          validate: (value) => FieldValidation().validateEmpty(value, 'Description'),
                          keyboardType: TextInputType.text),
                      const SizedBox(height: 10),
                      Align(alignment: Alignment.centerLeft,
                        child: Text(
                          'Attachment Type',
                          style: TextStyle(fontSize: 9.sp),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      Container(
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                              Border.all(color: AppColors.appColors, width: 1),
                            ),
                        child: attachmentAddScreenController
                            .isLoading.value
                            ? Container()
                            : DropdownButtonFormField(
                          decoration:
                          const InputDecoration(border: InputBorder.none),
                          hint: Text(attachmentAddScreenController.attachmentTypeSelected.value,
                            style: const TextStyle(
                                color: AppColors.appColors),
                          ),
                          // Not necessary for Option 1
                          onChanged: (newValue) async {
                            // manageCompanyDetailsScreenController
                            //     .companyTypeSelect.value =
                            //     newValue!.companyTypes.toString();
                            // manageCompanyDetailsScreenController
                            //     .companyTypeIdFindFunction();
                            // log('new Company Type :  ${manageCompanyDetailsScreenController.companyTypeSelect.value}');
                          },
                          items: attachmentAddScreenController.attachmentTypeListDropDown.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e.attachmentTypes),
                            );
                          }).toList(),
                        ).paddingOnly(left: 8, right: 8),
                      ),

                    ]).paddingOnly(left: 15, right: 15, top: 20),
                  ),
                ),
        ),
      ),
    );
  }
}
