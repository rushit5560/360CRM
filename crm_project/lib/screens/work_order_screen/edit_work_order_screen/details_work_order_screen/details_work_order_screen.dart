import 'dart:developer';

import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/screens/work_order_screen/edit_work_order_screen/details_work_order_screen/detais_work_order_screen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_loader.dart';
import '../../../../common_modules/common_textfield_header_module.dart';
import '../../../../common_modules/common_toast_module.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/work_order_module_controllers/detail_work_order_screen_controller.dart';
import '../../../../utils/messaging.dart';

class DetailWorkOrderScreen extends StatelessWidget {
  DetailWorkOrderScreen({Key? key}) : super(key: key);
  final detailWorkOrderScreenController =
      Get.put(DetailWorkOrderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            titleText: 'Work Order Details',
            leadingShow: false,
            actionShow: false),
        body: Obx(
          () => detailWorkOrderScreenController.isLoading.value
              ? CommonLoader().showLoader()
              : SingleChildScrollView(
                  child: Form(
                    key: detailWorkOrderScreenController.detailWorkOrderKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        TypeWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        DateWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        StatusWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        ProjectStartDateWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        DetailsWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        PropertyWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        UnitWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        CompanyWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        BudgetWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        PerDiemBonusWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        PercentageOfBugetWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: DueDateWorkOrderDetailsScreenWidget()),
                            const SizedBox(width: 10),
                            Expanded(
                                child:
                                    completeDateWorkOrderDetailsScreenWidget()),
                          ],
                        ),
                        const SizedBox(height: 10),
                        PerDiemPenaltyWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        ActualCostWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        ProjectedCostWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        CostOverRunsWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        SpecialTermsWorkOrderDetailsScreenWidget(),
                        const SizedBox(height: 10),
                        //status Tongal button
                        Row(
                          children: [
                            Text('Active',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                    color:
                                        AppColors.blackColor.withOpacity(0.6))),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Transform.scale(
                                  alignment: AlignmentDirectional.centerEnd,
                                  scale: 0.8,
                                  child: CupertinoSwitch(
                                    activeColor: AppColors.appColors,
                                    trackColor: AppColors.appColorsSecondry,
                                    value: detailWorkOrderScreenController
                                        .workOrderIsActive.value,
                                    onChanged: (value) {
                                      detailWorkOrderScreenController
                                          .workOrderIsActive.value = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        //Update Button
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: SizedBox(
                              height: 5.5.h,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.appColors),
                                  onPressed: () async {
                                    if (detailWorkOrderScreenController
                                        .detailWorkOrderKey.currentState!
                                        .validate()) {
                                      if (detailWorkOrderScreenController
                                          .showSelectedDueDate.isNotEmpty) {
                                        if (detailWorkOrderScreenController
                                            .showSelectedCompleteDate
                                            .isNotEmpty) {
                              //Update Api Call
                                          detailWorkOrderScreenController
                                              .updateWorkOrderFunction();
                                        } else {
                                          CommonToastModule(
                                              msg:
                                                  'Please Select Complete Date!',
                                              backgroundColor:
                                                  AppColors.redColor);
                                        }
                                      } else {
                                        CommonToastModule(
                                            msg: 'Please Select Due Date!',
                                            backgroundColor:
                                                AppColors.redColor);
                                      }
                                    }else{
                                    }
                                  },
                                  child: const Text(AppMessage.update))),
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                ),
        ));
  }
}
