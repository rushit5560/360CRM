import 'package:crm_project/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_loader.dart';
import '../../../../common_modules/common_textfield.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/ledger_manage_screen_controller.dart';
import 'ledger_manage_screen_widget.dart';

class LedgerManageScreen extends StatelessWidget {
  LedgerManageScreen({Key? key}) : super(key: key);
  final ledgerManageScreenController = Get.put(LedgerManageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
        actionShow: false,
        leadingShow: false,
        titleText: ledgerManageScreenController.appBarHeader.value,
      ),
      body: Obx(
        () => ledgerManageScreenController.isLoading.value
            ? CommonLoader().showLoader()
            : SingleChildScrollView(
                child: Form(
                  key: ledgerManageScreenController.ledgerGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date module
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              color: AppColors.blackColor.withOpacity(0.6)),
                          children: [
                            TextSpan(
                              text: " *",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                  color: AppColors.redColor),
                            ),
                          ],
                          /*children: [
                              // TextSpan(
                              //   text: ' *',
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 11.sp,
                              //       color: AppColors.redColor),
                              // ),
                            ],*/
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: AppColors.appColors, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              ledgerManageScreenController.showSelectedDate.value,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                // color: AppColors.greyColor,
                              ),
                            ).paddingOnly(left: 10)),
                            GestureDetector(
                              onTap: () async => await ledgerManageScreenController.selectDate(context),
                              child: SizedBox(
                                child: Center(
                                  child: const Icon(Icons.calendar_today_outlined)
                                      .paddingAll(12),
                                ), //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
                              ),
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 5),
                      //

                      // Amount TextField Module
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: "Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                  color: AppColors.blackColor.withOpacity(0.6)),
                              children: [
                                TextSpan(
                                  text: " *",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.sp,
                                      color: AppColors.redColor),
                                ),
                              ]
                            ),
                          ).paddingOnly(bottom: 5),
                          TextFieldModule(
                            fieldController: ledgerManageScreenController
                                .amountFieldController,
                            hintText: 'Amount',
                            // labelText: 'Amount',
                            keyboardType: TextInputType.number,
                            validate: (value) =>
                                FieldValidation().validateAmount(value, "amount"),
                          )
                        ],
                      ).paddingSymmetric(vertical: 10),

                      // Type Dropdown module
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: "Type",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                  color: AppColors.blackColor.withOpacity(0.6)),
                            ),
                          ).paddingOnly(bottom: 5),
                          TypeDropdownModule(),
                        ],
                      ).paddingSymmetric(vertical: 10),

                      // Reference TextField Module
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: "Reference",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                  color: AppColors.blackColor.withOpacity(0.6)),
                                children: [
                                  TextSpan(
                                    text: " *",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.sp,
                                        color: AppColors.redColor),
                                  ),
                                ],
                            ),
                          ).paddingOnly(bottom: 5),
                          TextFieldModule(
                            fieldController: ledgerManageScreenController
                                .referenceFieldController,
                            hintText: 'Reference',
                            keyboardType: TextInputType.text,
                            validate: (value) => FieldValidation()
                                .validateEmpty(value, "reference"),
                          )
                        ],
                      ).paddingSymmetric(vertical: 10),

                      // Details TextField Module
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: "Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                  color: AppColors.blackColor.withOpacity(0.6)),
                              children: [
                                TextSpan(
                                  text: " *",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.sp,
                                      color: AppColors.redColor),
                                ),
                              ],
                            ),
                          ).paddingOnly(bottom: 5),
                          TextFieldModule(
                            fieldController: ledgerManageScreenController
                                .detailsFieldController,
                            hintText: 'Details',
                            keyboardType: TextInputType.text,
                            validate: (value) =>
                                FieldValidation().validateEmpty(value, "details"),
                          )
                        ],
                      ).paddingSymmetric(vertical: 10),

                      // Account Category Module
                      AccountCategoryDropDownModule(),

                      // Property Module
                      PropertyDropDownModule(),

                      // Company Module
                      CompanyDropDownModule(),

                      // Work Order Module
                      WorkOrderDropDownModule(),

                      // Marketing Module
                      MarketingDropDownModule(),

                      // Contact Module
                      ContactDropDownModule(),

                      // Mortgage Module
                      MortgageDropDownModule(),
                      // Lease Module
                      LeaseDropDownModule(),

                      // property Management Module
                      PropertyManagementDropDownModule(),

                      // Prospect Module
                      ProspectDropDownModule(),

                      //CupertinoSwitch and button module
                      CupertinoSwitchAndbuttonmodule()

                    ],
                  ).paddingSymmetric(horizontal: 8, vertical: 8),
                ),
              ),
      ),
    );
  }
}
