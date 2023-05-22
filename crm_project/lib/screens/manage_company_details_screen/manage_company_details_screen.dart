import 'dart:developer';

// import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/constants/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../controller/manage_company_details_screen_controller.dart';
import '../../utils/enums.dart';
import '../../utils/messaging.dart';
import '../../utils/validator.dart';

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
        () => manageCompanyDetailsScreenController.isLoading.value
            ? CommonLoader().showLoader()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Form(
                          key: manageCompanyDetailsScreenController
                              .addCompanyKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                CompanyOption.update ==
                                        manageCompanyDetailsScreenController
                                            .companyOption
                                    ? manageCompanyDetailsScreenController
                                        .titleName
                                    : 'Company Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    color: AppColors.blackColor),
                              ),
                              Text(
                                AppMessage.enterYourCompanyDetails,
                                style: TextStyle(
                                    fontSize: 9.sp, color: AppColors.greyColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFieldModule(
                                  fieldController:
                                      manageCompanyDetailsScreenController
                                          .companyNameTextField,
                                  hintText: 'Company Name',
                                  keyboardType: TextInputType.text,
                                  validate: (value) => FieldValidation()
                                      .validateEmpty(
                                          value, 'gross monthly revenue')),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldModule(
                                  fieldController:
                                      manageCompanyDetailsScreenController
                                          .phoneTextField,
                                  hintText: 'Phone',
                                  prifixIcon: Text(
                                    'US(+1)',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ).commonOnlyPadding(right: 5),
                                  keyboardType: TextInputType.text,
                                  validate: (value) => FieldValidation()
                                      .validateMobileNumber(value)),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldModule(
                                  fieldController:
                                      manageCompanyDetailsScreenController
                                          .phone2TextField,
                                  hintText: 'Phone 2',
                                  prifixIcon: Text(
                                    'US(+1)',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ).commonOnlyPadding(right: 5),
                                  keyboardType: TextInputType.text,
                                  validate: (value) => FieldValidation()
                                      .validateMobileNumber(value)),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldModule(
                                  fieldController:
                                      manageCompanyDetailsScreenController
                                          .faxTextField,
                                  hintText: 'Fax',
                                  prifixIcon: Text(
                                    'US(+1)',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ).commonOnlyPadding(right: 5),
                                  keyboardType: TextInputType.text,
                                  validate: (value) => FieldValidation()
                                      .validateFaxNumber(value)),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldModule(
                                  fieldController:
                                      manageCompanyDetailsScreenController
                                          .fax2TextField,
                                  hintText: 'Fax 2',
                                  prifixIcon: Text(
                                    'US(+1)',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ).commonOnlyPadding(right: 5),
                                  keyboardType: TextInputType.text,
                                  validate: (value) => FieldValidation()
                                      .validateFaxNumber(value)),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldModule(
                                  fieldController:
                                      manageCompanyDetailsScreenController
                                          .websiteTextField,
                                  hintText: 'Website',
                                  keyboardType: TextInputType.text),

                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldModule(
                                  fieldController:
                                      manageCompanyDetailsScreenController
                                          .emailTextField,
                                  hintText: 'Email',
                                  keyboardType: TextInputType.text,
                                  validate: (value) =>
                                      FieldValidation().validateEmail(value)),
                              const SizedBox(height: 10),
                              Text(
                                'Company Type',
                                style: TextStyle(fontSize: 9.sp),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              Obx(
                                () => manageCompanyDetailsScreenController
                                        .isLoading.value
                                    ? Container()
                                    : DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: Text(
                                            manageCompanyDetailsScreenController
                                                .companyTypeSelect.value,
                                            style: const TextStyle(
                                                color: AppColors.appColors),
                                          ),
                                          // Not necessary for Option 1
                                          // value: selectedLocation.isNotEmpty ?  selectedLocation: null ,
                                          onChanged: (newValue) {
                                            manageCompanyDetailsScreenController
                                                .companyTypeSelect
                                                .value = newValue.toString();
                                            log(newValue.toString());
                                          },
                                          items:
                                              manageCompanyDetailsScreenController
                                                  .companyTypeListDropDown
                                                  .map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(e.toString()),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                              ).paddingOnly(left: 5, right: 5),
                              Obx(
                                    () => Transform.scale(
                                  alignment: AlignmentDirectional.centerEnd,
                                  scale: 0.8,
                                  child: CupertinoSwitch(
                                    activeColor: AppColors.appColors,
                                    trackColor: AppColors.appColorsSecondry,
                                    value: manageCompanyDetailsScreenController
                                        .isCompanyStatus.value,
                                    onChanged: (value) =>
                                    manageCompanyDetailsScreenController
                                        .isCompanyStatus.value = value,
                                  ),
                                ),
                              ),
                              // CustomDropdown.search(listItemStyle: const TextStyle(),
                              //
                              //   hintText: 'Select Company Type',
                              //   controller: manageCompanyDetailsScreenController.companyTypeTextField,
                              //   items: manageCompanyDetailsScreenController.companyTypeListDropDown,
                              //   borderRadius: BorderRadius.circular(5),
                              //   borderSide: const BorderSide(color: AppColors.appColors,width: 1),
                              //   onChanged: (val){
                              //     log(manageCompanyDetailsScreenController.companyTypeTextField.text);
                              //   },
                              //
                              // ),
                              //
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
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: SizedBox(
                                    height: 5.5.h,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.appColors),
                                        onPressed: () {
                                          log('Submit Button Taped');
                                          manageCompanyDetailsScreenController
                                              .updateCompanyDetails();
                                        },
                                        child: const Text('Submit'))),
                              )
                            ],
                          ).paddingAll(10),
                        ),
                      ).paddingAll(10)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
