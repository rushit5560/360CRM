import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/common_loader.dart';
import '../../../common_modules/common_textfield.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/colors.dart';
import '../../../controller/bill_manage_screen_controller.dart';
import '../../../utils/messaging.dart';
import '../../../utils/validator.dart';
import 'bill_manage_screen_widgets.dart';


class BillManageScreen extends StatelessWidget {
  BillManageScreen({Key? key}) : super(key: key);
  final billManageScreenController = Get.put(BillManageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
        actionShow: false,
        leadingShow: false,
        titleText: billManageScreenController.appBarHeader.value,
      ),

      body: Obx(
        () => billManageScreenController.isLoading.value
            ? CommonLoader().showLoader()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Company Module
                    BillCompanyDropDownModule(),

                    // Property Module
                    BillPropertyDropDownModule(),

                    // Date & Due date module
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Date module
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: AppMessage.dateLabel,
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
                                          billManageScreenController.showDate.value,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            // color: AppColors.greyColor,
                                          ),
                                        ).paddingOnly(left: 10)),
                                    GestureDetector(
                                      onTap: () async => await billManageScreenController.selectDate(context: context,
                                        initialDate: billManageScreenController.date,
                                        selectedDateType: SelectedDateType.date,
                                      ),
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
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Due Date module
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: AppMessage.dueDateLabel,
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
                                          billManageScreenController.showDueDate.value,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            // color: AppColors.greyColor,
                                          ),
                                        ).paddingOnly(left: 10)),
                                    GestureDetector(
                                      onTap: () async => await billManageScreenController.selectDate(context: context,
                                        initialDate: billManageScreenController.dueDate,
                                        selectedDateType: SelectedDateType.dueDate,
                                      ),
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
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Address TextField Module
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: AppMessage.address,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                                color: AppColors.blackColor.withOpacity(0.6)),
                            /*children: [
                              TextSpan(
                                text: " *",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                    color: AppColors.redColor),
                              ),
                            ],*/
                          ),
                        ).paddingOnly(bottom: 5),
                        TextFieldModule(
                          fieldController: billManageScreenController
                              .addressFieldController,
                          hintText: AppMessage.address,
                          keyboardType: TextInputType.text,
                          validate: (value) => FieldValidation()
                              .validateEmpty(value, AppMessage.address.toLowerCase()),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),

                    // Reference TextField Module
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: AppMessage.referenceLabel,
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
                          fieldController: billManageScreenController
                              .referenceFieldController,
                          hintText: AppMessage.referenceLabel,
                          keyboardType: TextInputType.text,
                          validate: (value) => FieldValidation()
                              .validateEmpty(value, AppMessage.referenceLabel.toLowerCase()),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),

                    // Balance TextField Module
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: AppMessage.balanceLabel,
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
                          fieldController: billManageScreenController
                              .balanceFieldController,
                          hintText: AppMessage.balanceLabel,
                          keyboardType: TextInputType.number,
                          validate: (value) => FieldValidation()
                              .validateAmount(value, AppMessage.balanceLabel.toLowerCase()),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),

                    // Total TextField Module
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: AppMessage.totalLabel,
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
                          fieldController: billManageScreenController
                              .totalFieldController,
                          hintText: AppMessage.totalLabel,
                          keyboardType: TextInputType.number,
                          validate: (value) => FieldValidation()
                              .validateAmount(value, AppMessage.totalLabel.toLowerCase()),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),


                  ],
                ).paddingSymmetric(horizontal: 8, vertical: 8),
              ),
      ),
    );
  }
}
