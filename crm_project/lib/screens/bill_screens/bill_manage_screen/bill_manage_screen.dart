import 'dart:developer';

import 'package:crm_project/common_modules/divider.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/common_loader.dart';
import '../../../common_modules/common_textfield.dart';
import '../../../common_modules/common_textfield_header_module.dart';
import '../../../common_modules/common_toast_module.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/colors.dart';
import '../../../controller/bill_manage_screen_controller.dart';
import '../../../models/ledger_screen_model/active_category_type_list_model.dart';
import '../../../utils/messaging.dart';
import '../../../utils/validator.dart';
import 'bill_manage_screen_widgets.dart';

class BillManageScreen extends StatelessWidget {
  BillManageScreen({Key? key}) : super(key: key);
  final billManageScreenController = Get.put(BillManageScreenController());

  @override
  Widget build(BuildContext context) {
    log("BillManageScreen company id : ${billManageScreenController.companyId}");
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
            : Form(
                key: billManageScreenController.formKey,
                child: ListView(
                  shrinkWrap: true,
                  // physics  : AlwaysScrollableScrollPhysics(),
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,

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
                                      color: AppColors.blackColor
                                          .withOpacity(0.6)),
                                  // children: [
                                  //   TextSpan(
                                  //     text: " *",
                                  //     style: TextStyle(
                                  //         fontWeight: FontWeight.bold,
                                  //         fontSize: 11.sp,
                                  //         color: AppColors.redColor),
                                  //   ),
                                  // ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.appColors, width: 1.5),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      billManageScreenController
                                          .showDate.value,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        // color: AppColors.greyColor,
                                      ),
                                    ).paddingOnly(left: 10)),
                                    GestureDetector(
                                      onTap: () async =>
                                          await billManageScreenController
                                              .selectDate(
                                        context: context,
                                        initialDate:
                                            billManageScreenController.date,
                                        selectedDateType:
                                            SelectedDateType.date,
                                      ),
                                      child: SizedBox(
                                        child: Center(
                                          child: const Icon(Icons
                                                  .calendar_today_outlined)
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
                                      color: AppColors.blackColor
                                          .withOpacity(0.6)),
                                  // children: [
                                  //   TextSpan(
                                  //     text: " *",
                                  //     style: TextStyle(
                                  //         fontWeight: FontWeight.bold,
                                  //         fontSize: 11.sp,
                                  //         color: AppColors.redColor),
                                  //   ),
                                  // ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.appColors, width: 1.5),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      billManageScreenController
                                          .showDueDate.value,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        // color: AppColors.greyColor,
                                      ),
                                    ).paddingOnly(left: 10)),
                                    GestureDetector(
                                      onTap: () async =>
                                          await billManageScreenController
                                              .selectDate(
                                        context: context,
                                        initialDate:
                                            billManageScreenController
                                                .dueDate,
                                        selectedDateType:
                                            SelectedDateType.dueDate,
                                      ),
                                      child: SizedBox(
                                        child: Center(
                                          child: const Icon(Icons
                                                  .calendar_today_outlined)
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
                          // validate: (value) => FieldValidation()
                          //     .validateEmpty(
                          //         value, AppMessage.address.toLowerCase()),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),

                    const CustomDivider(),

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              billManageScreenController.isItemModuleShow.value = true;
                            },
                            child: SizedBox(
                              width: Get.width,
                              child: const Center(
                                child: Text(
                                  'Item',
                                  style: TextStyle(
                                    color: AppColors.appColors,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              billManageScreenController.isItemModuleShow.value = false;
                            },
                            child: SizedBox(
                              width: Get.width,
                              child: const Center(
                                child: Text(
                                  'Payment',
                                  style: TextStyle(
                                    color: AppColors.appColors,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    /*TabBar(
                      tabs: [
                        const Text(
                          "Item",
                          style: TextStyle(color: AppColors.blackColor),
                        ).paddingAll(8),
                        const Text(
                          "Payment",
                          style: TextStyle(color: AppColors.blackColor),
                        ).paddingAll(8),
                      ],
                    ),*/

                    KeepAliveWrapper(
                      child: Form(
                        key: billManageScreenController.itemFormKey,
                        child: SizedBox(
                          // height: billManageScreenController.mainItemList.length * 200,
                          height: 400,
                         child: billManageScreenController.isItemModuleShow.value
                          ? ItemListModule(
                           // formKey: billManageScreenController.formKeyList[0]
                         )
                          : PaymentListModule(
                           // formKey: billManageScreenController.formKeyList[1],
                         ),
                          /*child: TabBarView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              ItemListModule(
                                  // formKey: billManageScreenController.formKeyList[0],
                              ),
                              PaymentListModule(
                                  // formKey: billManageScreenController.formKeyList[1],
                              ),
                            ],
                          ),*/
                        ),
                      ),
                    ),

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
                              .validateEmpty(value,
                                  AppMessage.referenceLabel.toLowerCase()),
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
                          onChange: (value) {
                            billManageScreenController
                                .totalFieldController.text = value;
                          },
                          validate: (value) => FieldValidation()
                              .validateAmount(value,
                                  AppMessage.balanceLabel.toLowerCase()),
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
                            // children: [
                            //   TextSpan(
                            //     text: " *",
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 11.sp,
                            //         color: AppColors.redColor),
                            //   ),
                            // ],
                          ),
                        ).paddingOnly(bottom: 5),
                        TextFieldModule(
                          fieldController:
                              billManageScreenController.totalFieldController,
                          hintText: AppMessage.totalAmountLabel,
                          keyboardType: TextInputType.number,
                          onChange: (value) {
                            billManageScreenController
                                .balanceFieldController.text = value;
                          },
                          // validate: (value) => FieldValidation()
                          //     .validateAmount(
                          //         value, AppMessage.totalLabel.toLowerCase()),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),

                    Row(
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: AppMessage.paid,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                                color: AppColors.blackColor.withOpacity(0.6)),
                          ),
                        ).paddingOnly(bottom: 5),

                        Transform.scale(
                          alignment: AlignmentDirectional.centerStart,
                          scale: 0.8,
                          child: CupertinoSwitch(
                            activeColor: AppColors.appColors,
                            trackColor: AppColors.whiteColor1,
                            value: billManageScreenController.isPaidValue.value,
                            onChanged: (value) {
                              billManageScreenController.isPaidValue.value = value;
                              billManageScreenController.loadUI();
                            },
                          ),
                        ),

                      ],
                    ).paddingOnly(bottom: 10),

                    SizedBox(
                      height: 5.5.h,
                      child: Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.appColors),
                          onPressed: () async {

                            if(billManageScreenController.formKey.currentState!.validate()) {
                              if(billManageScreenController.itemFormKey.currentState!.validate()
                              /*&& billManageScreenController.formKeyList[1].currentState!.validate()*/) {
                                // if(billManageScreenController.formKeyList[1].currentState!.validate()) {
                                if(billManageScreenController.isItemModuleShow.value == true) {
                                  billManageScreenController.isItemModuleShow.value = false;
                                  billManageScreenController.loadUI();
                                } else {
                                  log('validate');
                                  if(billManageScreenController.billOption == BillOption.create) {
                                    await billManageScreenController
                                        .addBillFunction();
                                  } else {
                                    await billManageScreenController
                                        .updateBillFunction();
                                  }
                                }

                                // }
                              }
                            } else {
                              log('not validate');
                            }

                          },
                          child: billManageScreenController.isLoading.value
                              ? Center(
                                  child: CommonLoader().showLoader(),
                                ).paddingAll(5)
                              : BillOption.update ==
                                      billManageScreenController.billOption
                                  ? const Text(AppMessage.update)
                                  : const Text(AppMessage.submitLabel),
                        ),
                      ),
                    ),
                  ],
                  // ).paddingSymmetric(horizontal: 8, vertical: 8),
                ).paddingAll(10),
              ),
      ),
    );
  }
}


class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({Key? key, required this.child}) : super(key: key);

  @override
  __KeepAliveWrapperState createState() => __KeepAliveWrapperState();
}

class __KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}