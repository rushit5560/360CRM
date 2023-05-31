import 'dart:developer';

// import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:crm_project/common_modules/common_textfield_header_module.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/constants/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/manage_company_details_screen_controller.dart';
import '../../../utils/enums.dart';
import '../../../utils/messaging.dart';
import '../../../utils/validator.dart';

class ManageCompanyDetailsScreen extends StatelessWidget {
  ManageCompanyDetailsScreen({Key? key}) : super(key: key);

  final manageCompanyDetailsScreenController =
      Get.put(ManageCompanyDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
          actionShow: false,
          leadingShow: false,
          titleText: AppMessage.companyDetails),
      body: Obx(
        ()=> manageCompanyDetailsScreenController.isLoading.value ? CommonLoader().showLoader() : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Form(
                  key: manageCompanyDetailsScreenController.addCompanyKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CompanyOption.update ==
                                manageCompanyDetailsScreenController.companyOption
                            ? manageCompanyDetailsScreenController.titleName
                            : 'Company Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.blackColor),
                      ),
                      Text(
                        AppMessage.enterYourCompanyDetails,
                        style:
                            TextStyle(fontSize: 9.sp, color: AppColors.greyColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonTextFieldHeaderModule(header: AppMessage.companyName,required: true),
                      const SizedBox(height: 5,),
                      TextFieldModule(
                        fieldController: manageCompanyDetailsScreenController
                            .companyNameTextField,
                        hintText: AppMessage.companyName,
                        keyboardType: TextInputType.text,

                        validate: (value) => FieldValidation()
                            .validateEmpty(value, 'gross monthly revenue'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextFieldHeaderModule(header: AppMessage.phone,required: false),
                      const SizedBox(height: 5,),
                      TextFieldModule(
                        fieldController:
                            manageCompanyDetailsScreenController.phoneTextField,
                        hintText: AppMessage.phone,
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            'US(+1)',
                            style:
                            TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 8,left: 8),

                        keyboardType: TextInputType.text,
                        // validate: (value) =>
                        //     FieldValidation().validateMobileNumber(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextFieldHeaderModule(header: 'Phone 2',required: false),
                      const SizedBox(height: 5,),
                      TextFieldModule(
                        fieldController:
                            manageCompanyDetailsScreenController.phone2TextField,
                        hintText: 'Phone 2',
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            'US(+1)',
                            style:
                            TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 8,left: 8),
                        keyboardType: TextInputType.text,
                        // validate: (value) =>
                        //     FieldValidation().validateMobileNumber(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextFieldHeaderModule(header: 'Fax',required: false),
                      const SizedBox(height: 5,),
                      TextFieldModule(
                        fieldController:
                            manageCompanyDetailsScreenController.faxTextField,
                        hintText: 'Fax',
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            'US(+1)',
                            style:
                            TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 8,left: 8),
                        keyboardType: TextInputType.text,
                        // validate: (value) =>
                        //     FieldValidation().validateFaxNumber(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextFieldHeaderModule(header: 'Fax 2',required: false),
                      const SizedBox(height: 5,),
                      TextFieldModule(
                        fieldController:
                            manageCompanyDetailsScreenController.fax2TextField,
                        hintText: 'Fax 2',
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            'US(+1)',
                            style:
                            TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 8,left: 8),
                        keyboardType: TextInputType.text,
                        // validate: (value) =>
                        //     FieldValidation().validateFaxNumber(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextFieldHeaderModule(header: 'Website',required: false),
                      const SizedBox(height: 5,),
                      TextFieldModule(
                          fieldController: manageCompanyDetailsScreenController
                              .websiteTextField,
                          hintText: 'Website',
                          keyboardType: TextInputType.text),

                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextFieldHeaderModule(header: 'Email',required: false),
                      const SizedBox(height: 5,),
                      TextFieldModule(
                        fieldController:
                            manageCompanyDetailsScreenController.emailTextField,
                        hintText: 'Email',
                        keyboardType: TextInputType.text,
                        // validate: (value) =>
                        //     FieldValidation().validateEmail(value),
                      ),
                      const SizedBox(height: 10),
                      CommonTextFieldHeaderModule(header: 'Select company Type',required: true),
                      const SizedBox(height: 5,),

                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: AppColors.appColors, width: 1),
                          ),
                          child: manageCompanyDetailsScreenController
                                  .isLoading.value
                              ? Container()
                              : DropdownButtonFormField(
                                  decoration:
                                     const InputDecoration(border: InputBorder.none),
                                  hint: Text(
                                    manageCompanyDetailsScreenController
                                        .companyTypeSelect.value,
                                    style: const TextStyle(
                                        color: AppColors.appColors),
                                  ),
                                  // Not necessary for Option 1
                                  onChanged: (newValue) async {
                                    manageCompanyDetailsScreenController
                                            .companyTypeSelect.value =
                                        newValue!.companyTypes.toString();
                                    manageCompanyDetailsScreenController
                                        .companyTypeIdFindFunction();
                                    log('new Company Type :  ${manageCompanyDetailsScreenController.companyTypeSelect.value}');
                                  },
                                  items: manageCompanyDetailsScreenController
                                      .companyTypeListDropDown
                                      .map((location) {
                                    return DropdownMenuItem(
                                      value: location,
                                      child: Text(location.companyTypes),
                                    );
                                  }).toList(),
                                ).paddingOnly(left: 8, right: 8),
                        ),
                      ).paddingOnly(left: 5, right: 5, bottom: 10),
                      Text(
                        "Active",
                        style: TextStyle(fontSize: 9.sp),
                      ),

                      // CustomDropdown.search(
                      //   listItemStyle: const TextStyle(),
                      //   hintText: 'Company Type',
                      //   controller: manageCompanyDetailsScreenController
                      //       .companyTypeTextField,
                      //   items: manageCompanyDetailsScreenController
                      //       .companyTypeListDropDown,
                      //   borderRadius: BorderRadius.circular(5),
                      //   borderSide: const BorderSide(
                      //       color: AppColors.appColors, width: 1),
                      //   onChanged: (val) {
                      //     log(manageCompanyDetailsScreenController
                      //         .companyTypeTextField.text);
                      //   },
                      // ),

                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(5),
                      //       border:
                      //           Border.all(width: 1, color: AppColors.appColors)),
                      //   child: FlutterDropdownSearch(
                      //     hintText: 'Company Type',
                      //     hintStyle: TextStyle(color: AppColors.appColors),
                      //     suffixIcon: Icons.arrow_drop_down_rounded,
                      //     textFieldBorder:
                      //         OutlineInputBorder(borderSide: BorderSide.none,),
                      //     textController: manageCompanyDetailsScreenController
                      //         .companyTypeTextField,
                      //     items: manageCompanyDetailsScreenController
                      //         .companyTypeListDropDown,
                      //     dropdownHeight: Get.height*.5,
                      //   ).paddingOnly(left: 5),
                      // ),

                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => manageCompanyDetailsScreenController
                                    .isLoading.value
                                ? Container()
                                : Transform.scale(
                                    alignment: AlignmentDirectional.centerStart,
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                      activeColor: AppColors.appColors,
                                      trackColor: AppColors.appColorsSecondry,
                                      value: manageCompanyDetailsScreenController
                                          .isCompanyStatus.value,
                                      onChanged: (value) async {
                                        manageCompanyDetailsScreenController
                                            .isCompanyStatus.value = value;
                                      },
                                    ),
                                  ),
                          ),
                          SizedBox(
                              height: 5.5.h,
                              child: Obx(
                                () => ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.appColors),
                                    onPressed: () {
                                      if (manageCompanyDetailsScreenController
                                          .addCompanyKey.currentState!
                                          .validate()) {
                                        if(manageCompanyDetailsScreenController.companyTypeId.value == "") {
                                          Fluttertoast.showToast(msg: 'Please select company type.',backgroundColor: AppColors.redColor);
                                        } else {
                                          CompanyOption.update ==
                                              manageCompanyDetailsScreenController
                                                  .companyOption
                                              ? manageCompanyDetailsScreenController
                                              .updateCompanyDetails()
                                              : manageCompanyDetailsScreenController
                                              .addCompanyDetails();
                                        }
                                      }
                                    },
                                    child: manageCompanyDetailsScreenController
                                            .isLoading.value
                                        ? Center(child: CommonLoader().showLoader(),).paddingAll(5)
                                        : CompanyOption.update ==
                                                manageCompanyDetailsScreenController
                                                    .companyOption
                                            ? const Text('Update')
                                            : const Text('Submit')),
                              )),
                        ],
                      )
                    ],
                  ).paddingAll(10),
                ),
              ).paddingAll(10)
            ],
          ),
        ),
      ),
    );
  }
}
