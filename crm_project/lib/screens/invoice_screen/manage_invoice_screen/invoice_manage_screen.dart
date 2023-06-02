import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/common_modules/custom_submit_button.dart';
import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/controller/company_module_controllers/invoice_manage_screen_controller.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/divider.dart';
import 'invoice_manage_screen_widget.dart';

class InvoiceManageScreen extends StatelessWidget {
  InvoiceManageScreen({Key? key}) : super(key: key);

  final invoiceManageScreenController =
      Get.put(InvoiceManageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: InvoiceOption.update ==
                  invoiceManageScreenController.invoiceManageOption
              ? 'Edit Invoice'
              : 'Add Invoice',
          leadingShow: false,
          actionShow: false),
      body: SafeArea(
        child: Obx(
          () => invoiceManageScreenController.isLoading.value
              ? Center(child: CommonLoader().showLoader())
              : SingleChildScrollView(
                  child: Form(
                    key: invoiceManageScreenController.invoiceKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Bill To",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17.sp),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: InvoiceBillToWidget().paddingAll(5)),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Ship To",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17.sp),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: InvoiceShipToWidget().paddingAll(5)),
                        const SizedBox(height: 10),
                        InvoiceDatePickerWidget(),
                        const SizedBox(height: 10),

                        //Item & Payment Tab bar
                        const CustomDivider(),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: invoiceManageScreenController
                                        .isItemModuleShow.value
                                    ? AppColors.whiteColor
                                    : null,
                                child: GestureDetector(
                                  onTap: () {
                                    invoiceManageScreenController
                                        .isItemModuleShow.value = true;
                                  },
                                  child: SizedBox(
                                    width: Get.width,
                                    child: invoiceManageScreenController
                                            .isItemModuleShow.value
                                        ? const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.list,
                                                  color: AppColors.appColors),
                                              SizedBox(width: 5),
                                              Text(
                                                'Item',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.appColors,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.list,
                                                  color:
                                                      AppColors.grey700Color),
                                              const SizedBox(width: 5),
                                              Text(
                                                'Item',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.grey700Color,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: invoiceManageScreenController
                                            .isItemModuleShow.value ==
                                        false
                                    ? AppColors.whiteColor
                                    : null,
                                child: GestureDetector(
                                  onTap: () {
                                    invoiceManageScreenController
                                        .isItemModuleShow.value = false;
                                  },
                                  child: SizedBox(
                                    width: Get.width,
                                    child: invoiceManageScreenController
                                                .isItemModuleShow.value ==
                                            false
                                        ? const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.note,
                                                  color: AppColors.appColors),
                                              SizedBox(width: 5),
                                              Text(
                                                'Payment',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.appColors,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.note,
                                                  color:
                                                      AppColors.grey700Color),
                                              const SizedBox(width: 5),
                                              Text(
                                                'Payment',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.grey700Color,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const CustomDivider(),
                        // item & payment Widget
                        // SizedBox(
                        //   // height: billManageScreenController.mainItemList.length * 200,
                        //   height: 400,
                        //   child: invoiceManageScreenController.isItemModuleShow.value
                        //       ? InvoiceItemListModule()
                        //       : null,//InvoicePaymentListModule(),
                        // ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 40000),
                          child: invoiceManageScreenController
                                  .isItemModuleShow.value
                              ? InvoiceItemListModule()
                              : InvoicePaymentListModule(),
                        ),
                        const SizedBox(height: 10),
                        //paid printed switch Button
                        InvoiceSwitchButtonWidget(),
                        const SizedBox(height: 10),
                        //balance Text Field
                        InvoiceBalanceWidget(),
                        const SizedBox(height: 10),
                        //Total Text Field
                        InvoiceTotalWidget(),
                        const SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                                height: 45,
                                width: Get.width,
                                child: CustomSubmitButton(
                                    onPress: () {
                                      labelText: invoiceManageScreenController
                                          .invoiceManageOption ==
                                          InvoiceOption.create ? invoiceManageScreenController.addInvoiceFunction() : invoiceManageScreenController.updateInvoiceFunction();
                                    },
                                    labelText: invoiceManageScreenController
                                                .invoiceManageOption ==
                                            InvoiceOption.create
                                        ? 'Add Invoice'
                                        : 'Update Invoice'))),
                      ],
                    ).paddingAll(10),
                  ),
                ),
        ),
      ),
    );
  }
}
