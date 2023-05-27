import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/work_order_list_screen_controller.dart';
import 'package:crm_project/screens/work_order_screen/add_work_order_screen/add_work_order_screen.dart';
import 'package:crm_project/screens/work_order_screen/work_order_list_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/common_textfield.dart';
import '../../../common_modules/divider.dart';
import '../../../constants/colors.dart';
import '../../../utils/messaging.dart';

class WorkOrderScreen extends StatelessWidget {
  WorkOrderScreen({Key? key}) : super(key: key);
  final workOrderListScreenController =
      Get.put(WorkOrderListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: AppMessage.workOrder,
          leadingShow: false,
          actionShow: false),
      body: Obx(() => workOrderListScreenController.isLoading.value
          ? Center(
              child: CommonLoader().showLoader(),
            )
          : Column(
              children: [
                TextFieldModule(
                        fieldController: workOrderListScreenController
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        AppMessage.workOrderList,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.appColors,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.w),
                        border: Border.all(
                          color: AppColors.appColors,
                          width: 1,
                        ),
                      ),
                    )
                  ],
                ).paddingOnly(top: 8),
                const CustomDivider(),
                WorkOrderListWidget()
              ],
            ).paddingOnly(left: 15, top: 20, right: 15)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appColors,
        onPressed: () {
          Get.to(() => AddWorkOrderScreen(),
              arguments: [workOrderListScreenController.companyId.toString()])!.then((value) async {
          workOrderListScreenController.isLoading(true);
          workOrderListScreenController.hasMore = true;
          workOrderListScreenController.pageIndex = 1;
          workOrderListScreenController.workOrderList.clear();
          await workOrderListScreenController.getWorkOrderList();

          });;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
