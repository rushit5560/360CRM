import 'dart:developer';
import 'package:crm_project/common_modules/common_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_modules/common_textfield.dart';
import '../../../../common_modules/divider.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/ledger_list_screen_controller.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/messaging.dart';
import '../ledger_manage_screen/ledger_manage_screen.dart';
import 'ledger_list_screen_widgets.dart';



class LedgerListScreen extends StatelessWidget {
  LedgerListScreen({Key? key}) : super(key: key);
  final ledgerListScreenController = Get.put(LedgerListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
        titleText: AppMessage.ledgerList,
        leadingShow: false,
        actionShow: false,
      ),
      body: Obx(
        () => ledgerListScreenController.isLoading.value
            ? CommonLoader().showLoader()
            : Column(
                children: [

                  // Search Field Module
                  TextFieldModule(
                          fieldController: ledgerListScreenController
                              .searchTextFieldController,
                          hintText: AppMessage.searchFieldText,
                          onChange: (text) {
                            log(text.toString());
                          },
                          backgroundColor: AppColors.whiteColor,
                          icon: GestureDetector(
                              onTap: () {
                                log('Search... ${ledgerListScreenController.searchTextFieldController.text}');
                              },
                              child: const Icon(Icons.search)
                                  .paddingOnly(left: 5, right: 5)),
                          keyboardType: TextInputType.text)
                      .paddingOnly(top: 20, bottom: 5),

                  // Heading & Export button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          AppMessage.ledgerList,
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

                  Expanded(child: LedgerListWidget()),

                ],
              ).paddingOnly(left: 10, right: 10),
      ),

      floatingActionButton: FloatingActionButton(
        heroTag: AppMessage.addLedger,
        onPressed: () {
          Get.to(() => LedgerManageScreen(),
              arguments: [
                LedgerOption.create,
                "",
                ledgerListScreenController.companyId.toString(),
                LedgerComingFrom.company,
              ],
              transition: Transition.zoom)!.then((value) async {
            ledgerListScreenController.isLoading(true);
            ledgerListScreenController.hasMore = true;
            ledgerListScreenController.pageIndex = 1;
            ledgerListScreenController.ledgerList.clear();
            await ledgerListScreenController.getLedgersFunction();
          });
        },
        backgroundColor: AppColors.appColors,
        child: const Icon(Icons.add),
      ),

    );
  }
}
