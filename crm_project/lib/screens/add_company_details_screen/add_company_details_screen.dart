import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/constants/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../controller/add_company_details_screen_controller.dart';
import '../../utils/validator.dart';

class AddCompanyDetailsScreen extends StatelessWidget {
  AddCompanyDetailsScreen({Key? key}) : super(key: key);

  final addCompanyDetailsScreenController =
      Get.put(AddCompanyDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
          actionShow: false, leadingShow: false, titleText: "Add Company"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Form(
                key: addCompanyDetailsScreenController.addCompanyKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company Details',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColors.blackColor),
                    ),
                    Text(
                      'Enter Your Company Details.',
                      style:
                          TextStyle(fontSize: 9.sp, color: AppColors.greyColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldModule(
                        fieldController: addCompanyDetailsScreenController
                            .companyNameTextField,
                        hintText: 'Company Name',
                        keyboardType: TextInputType.text,
                        validate: (value) => FieldValidation()
                            .validateEmpty(value, 'gross monthly revenue')),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldModule(
                        fieldController:
                            addCompanyDetailsScreenController.phoneTextField,
                        hintText: 'Phone',
                        prifixIcon: Text(
                          'US(+1)',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.text,
                        validate: (value) =>
                            FieldValidation().validateMobileNumber(value)),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldModule(
                        fieldController:
                            addCompanyDetailsScreenController.phone2TextField,
                        hintText: 'Phone 2',
                        prifixIcon: Text(
                          'US(+1)',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.text,
                        validate: (value) =>
                            FieldValidation().validateMobileNumber(value)),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldModule(
                        fieldController:
                            addCompanyDetailsScreenController.faxTextField,
                        hintText: 'Fax',
                        prifixIcon: Text(
                          'US(+1)',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.text,
                        validate: (value) =>
                            FieldValidation().validateFaxNumber(value)),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldModule(
                        fieldController:
                            addCompanyDetailsScreenController.fax2TextField,
                        hintText: 'Fax 2',
                        prifixIcon: Text(
                          'US(+1)',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.text,
                        validate: (value) =>
                            FieldValidation().validateFaxNumber(value)),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldModule(
                        fieldController:
                            addCompanyDetailsScreenController.websiteTextField,
                        hintText: 'Website',
                        keyboardType: TextInputType.text),

                    SizedBox(
                      height: 10,
                    ),
                    TextFieldModule(
                        fieldController:
                            addCompanyDetailsScreenController.emailTextField,
                        hintText: 'Email',
                        keyboardType: TextInputType.text,
                        validate: (value) =>
                            FieldValidation().validateEmail(value)),
                    SizedBox(height: 10),
                    Text('Company Type',style: TextStyle(fontSize: 9.sp),),
                    SizedBox(height: 5,),
                    CustomDropdown.search(listItemStyle: TextStyle(),

                      hintText: 'Company Type',
                      controller: addCompanyDetailsScreenController.companyTypeTextField,
                      items: addCompanyDetailsScreenController.companyTypeListDropDown,
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: AppColors.appColors,width: 1),
                      onChanged: (val){
                        print(addCompanyDetailsScreenController.companyTypeTextField.text);
                      },

                    ),

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
                    //     textController: addCompanyDetailsScreenController
                    //         .companyTypeTextField,
                    //     items: addCompanyDetailsScreenController
                    //         .companyTypeListDropDown,
                    //     dropdownHeight: Get.height*.5,
                    //   ).paddingOnly(left: 5),
                    // ),

                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Container(
                          height: 5.5.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.appColors),
                              onPressed: () {
                                print(addCompanyDetailsScreenController
                                    .companyTypeTextField.text);
                              },
                              child: Text('Submit'))),
                    )
                  ],
                ).paddingAll(10),
              ),
            ).paddingAll(10)
          ],
        ),
      ),
    );
  }
}
