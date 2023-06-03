import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/invoice_list_screen_controller.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/common_loader.dart';
import '../../common_modules/common_textfield.dart';
import '../../common_modules/divider.dart';
import '../../constants/colors.dart';
import '../../utils/enums.dart';
import 'invoice_list_screen_widget.dart';
import 'manage_invoice_screen/invoice_manage_screen.dart';

class InvoiceListScreen extends StatelessWidget {
   InvoiceListScreen({Key? key}) : super(key: key);
   final invoiceListScreenController = Get.put(InvoiceListScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: AppMessage.invoice, leadingShow: false, actionShow: false),
      body: Obx(() => invoiceListScreenController.isLoading.value
          ? Center(
        child: CommonLoader().showLoader(),
      )
          : Column(
        children: [
          TextFieldModule(
              fieldController: invoiceListScreenController
                  .searchTextFieldController,
              hintText: 'Search...',
              onChange: (text) {
                // log(text.toString());
              },
              backgroundColor: AppColors.whiteColor,
              icon: GestureDetector(
                  onTap: () {
                    // log('Search... ${companyListScreenController.searchTextFieldController.text}');
                  },
                  child: const Icon(Icons.search)
                      .paddingOnly(left: 5, right: 5)),
              keyboardType: TextInputType.text)
              .paddingOnly(bottom: 5),
        // Heading & Export button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  AppMessage.invoiceList,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColors.appColors,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.w),
                    border: Border.all(
                        color: AppColors.appColors, width: 1)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_download,
                      size: 4.w,
                      color: AppColors.appColors,
                    ),
                    const SizedBox(width: 5),

                    Text(
                      AppMessage.export,
                      style: TextStyle(
                          color: AppColors.appColors,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp),
                    )
                  ],
                ).paddingAll(4),
              ),
            ],
          ).paddingOnly(top: 8),
          const CustomDivider(),
          InvoiceListWidget()
        ],
      ).paddingOnly(left: 15, top: 20, right: 15)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appColors,
        onPressed: () {
          Get.to(() => InvoiceManageScreen(),
              arguments: [
                InvoiceOption.create,
                '',
                invoiceListScreenController.invoiceComingFrom,
              ]
          )!.then((value) async{
            invoiceListScreenController.isLoading(true);
            invoiceListScreenController.hasMore = true;
            invoiceListScreenController.pageIndex = 1;
            invoiceListScreenController.invoiceList.clear();
            await invoiceListScreenController.getInvoiceListFunction();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
