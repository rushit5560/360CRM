import 'dart:developer';

import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:crm_project/controller/company_module_controllers/work_order_module_controllers/detail_work_order_screen_controller.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_textfield_header_module.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/messaging.dart';

//type
class TypeWorkOrderDetailsScreenWidget extends StatelessWidget {
  TypeWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);
  final detailWorkOrderScreenController =
      Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(header: AppMessage.type, required: true),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1),
          ),
          child: detailWorkOrderScreenController.isLoading.value
              ? Container()
              : DropdownButtonFormField(
                  //<WorkOrderListData>(
                  decoration: const InputDecoration(border: InputBorder.none),
                  hint: Text(
                    "",
                    //detailWorkOrderScreenController.workOrderTypeValue.workOrderDetails.toString(),
                    style: const TextStyle(color: AppColors.appColors),
                  ),
                  // value: addWorkOrderScreenController.workOrderTypeValue,
                  // Not necessary for Option 1
                  onChanged: (newValue) async {
                    // addWorkOrderScreenController
                    //     .workOrderTypeValue = newValue!;
                    // log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.toJson()}');
                    // log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderDetails}');
                    // log('new Attachment Type id :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderTypeId}');
                  },
                  items: [] //detailWorkOrderScreenController
                  //     .workOrderListDropDown
                  //     .map((e) {
                  //   return DropdownMenuItem(
                  //     value: e,
                  //     child: Text(e.workOrderDetails.toString()),
                  //   );
                  // }).toList(),
                  ).paddingOnly(left: 8, right: 8),
        ),
      ],
    );
  }
}

//date
class DateWorkOrderDetailsScreenWidget extends StatelessWidget {
  DateWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
      Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFieldHeaderModule(header: AppMessage.date, required: false),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.appColors, width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  detailWorkOrderScreenController.showSelectedDate.value,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.greyColor,
                  ),
                ).paddingOnly(left: 10)),
                GestureDetector(
                  onTap: () async {
                    detailWorkOrderScreenController.selectedDateType =
                        WorkOrderDetailsDate.date;
                    await detailWorkOrderScreenController.selectDate(context);
                  },
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
        ],
      ),
    );
  }
}

//status
class StatusWorkOrderDetailsScreenWidget extends StatelessWidget {
  StatusWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);
  final detailWorkOrderScreenController =
      Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(header: AppMessage.status, required: true),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1),
          ),
          child: detailWorkOrderScreenController.isLoading.value
              ? Container()
              : DropdownButtonFormField(
                  //<WorkOrderListData>(
                  decoration: const InputDecoration(border: InputBorder.none),
                  hint: Text(
                    "",
                    // detailWorkOrderScreenController.workOrderTypeValue.workOrderDetails.toString(),
                    style: const TextStyle(color: AppColors.appColors),
                  ),
                  // value: addWorkOrderScreenController.workOrderTypeValue,
                  // Not necessary for Option 1
                  onChanged: (newValue) async {
                    // addWorkOrderScreenController
                    //     .workOrderTypeValue = newValue!;
                    // log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.toJson()}');
                    // log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderDetails}');
                    // log('new Attachment Type id :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderTypeId}');
                  },
                  items: [] //detailWorkOrderScreenController
                  //     .workOrderListDropDown
                  //     .map((e) {
                  //   return DropdownMenuItem(
                  //     value: e,
                  //     child: Text(e.workOrderDetails.toString()),
                  //   );
                  // }).toList(),
                  ).paddingOnly(left: 8, right: 8),
        ),
      ],
    );
  }
}

//project start Date
class ProjectStartDateWorkOrderDetailsScreenWidget extends StatelessWidget {
  ProjectStartDateWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
      Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFieldHeaderModule(
              header: AppMessage.projectStartDate, required: false),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.appColors, width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  detailWorkOrderScreenController
                      .showSelectedProjectStartDate.value,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.greyColor,
                  ),
                ).paddingOnly(left: 10)),
                GestureDetector(
                  onTap: () async {
                    detailWorkOrderScreenController.selectedDateType =
                        WorkOrderDetailsDate.projectStartDate;
                    await detailWorkOrderScreenController.selectDate(context);
                  },
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
        ],
      ),
    );
  }
}

//details
class DetailsWorkOrderDetailsScreenWidget extends StatelessWidget {
  DetailsWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
      Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFieldHeaderModule(
              header: AppMessage.details, required: false),
          const SizedBox(height: 5),
          TextFieldModule(
              hintText: AppMessage.details,
              fieldController: detailWorkOrderScreenController.detailsTextFieldController,
              keyboardType: TextInputType.name,

          onChange: (p0) {
            log(detailWorkOrderScreenController.detailsTextFieldController.text);
          },
          ),
        ],
    );
  }
}

//property
class PropertyWorkOrderDetailsScreenWidget extends StatelessWidget {
  PropertyWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);
  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(header: AppMessage.property, required: false),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1),
          ),
          child: detailWorkOrderScreenController.isLoading.value
              ? Container()
              : DropdownButtonFormField(
            //<WorkOrderListData>(
              decoration: const InputDecoration(border: InputBorder.none),
              hint: Text(
                "",
                // detailWorkOrderScreenController.workOrderTypeValue.workOrderDetails.toString(),
                style: const TextStyle(color: AppColors.appColors),
              ),
              // value: addWorkOrderScreenController.workOrderTypeValue,
              // Not necessary for Option 1
              onChanged: (newValue) async {
                // addWorkOrderScreenController
                //     .workOrderTypeValue = newValue!;
                // log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.toJson()}');
                // log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderDetails}');
                // log('new Attachment Type id :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderTypeId}');
              },
              items: [] //detailWorkOrderScreenController
            //     .workOrderListDropDown
            //     .map((e) {
            //   return DropdownMenuItem(
            //     value: e,
            //     child: Text(e.workOrderDetails.toString()),
            //   );
            // }).toList(),
          ).paddingOnly(left: 8, right: 8),
        ),
      ],
    );
  }
}

//unit
class UnitWorkOrderDetailsScreenWidget extends StatelessWidget {
  UnitWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
      Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFieldHeaderModule(
              header: AppMessage.unit, required: false),
          const SizedBox(height: 5),
          TextFieldModule(
              hintText: AppMessage.unit,
              fieldController: detailWorkOrderScreenController.unitTextFieldController,
              keyboardType: TextInputType.number,

          onChange: (p0) {
            log(detailWorkOrderScreenController.unitTextFieldController.text);
          },
          ),
        ],
    );
  }
}

//company
class CompanyWorkOrderDetailsScreenWidget extends StatelessWidget {
  CompanyWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);
  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(header: AppMessage.company, required: true),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1),
          ),
          child: detailWorkOrderScreenController.isLoading.value
              ? Container()
              : DropdownButtonFormField(
            //<WorkOrderListData>(
              decoration: const InputDecoration(border: InputBorder.none),
              hint: Text(
                "",
                // detailWorkOrderScreenController.workOrderTypeValue.workOrderDetails.toString(),
                style: const TextStyle(color: AppColors.appColors),
              ),
              // value: addWorkOrderScreenController.workOrderTypeValue,
              // Not necessary for Option 1
              onChanged: (newValue) async {
                // addWorkOrderScreenController
                //     .workOrderTypeValue = newValue!;
                // log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.toJson()}');
                // log('new Attachment Type :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderDetails}');
                // log('new Attachment Type id :  ${addWorkOrderScreenController.workOrderTypeValue.workOrderTypeId}');
              },
              items: [] //detailWorkOrderScreenController
            //     .workOrderListDropDown
            //     .map((e) {
            //   return DropdownMenuItem(
            //     value: e,
            //     child: Text(e.workOrderDetails.toString()),
            //   );
            // }).toList(),
          ).paddingOnly(left: 8, right: 8),
        ),
      ],
    );
  }
}

//budget
class BudgetWorkOrderDetailsScreenWidget extends StatelessWidget {
  BudgetWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(
            header: AppMessage.budget, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
          hintText: AppMessage.budget,
          fieldController: detailWorkOrderScreenController.budgetTextFieldController,
          keyboardType: TextInputType.number,
          prifixIcon: Text(
            '\$',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ).paddingOnly(top: 5, bottom: 5, right: 10, left: 0),
          onChange: (p0) {
            log(detailWorkOrderScreenController.budgetTextFieldController.text);
          },
        ),
      ],
    );
  }
}

//Per Diem Bonus
class PerDiemBonusWorkOrderDetailsScreenWidget extends StatelessWidget {
  PerDiemBonusWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(
            header: AppMessage.perDiemBonus, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
          hintText: AppMessage.perDiemBonus,
          fieldController: detailWorkOrderScreenController.perDiemBonusTextFieldController,
          keyboardType: TextInputType.number,

          onChange: (p0) {
            log(detailWorkOrderScreenController.unitTextFieldController.text);
          },
        ),
      ],
    );
  }
}

//Percentage Of Buget
class PercentageOfBugetWorkOrderDetailsScreenWidget extends StatelessWidget {
  PercentageOfBugetWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(
            header: AppMessage.percentageOfBudget, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
          hintText: AppMessage.percentageOfBudget,
          fieldController: detailWorkOrderScreenController.percentageOfBudgetTextFieldController,
          keyboardType: TextInputType.number,

          onChange: (p0) {
            log(detailWorkOrderScreenController.unitTextFieldController.text);
          },
        ),
      ],
    );
  }
}


//Due Date
class DueDateWorkOrderDetailsScreenWidget extends StatelessWidget {
  DueDateWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFieldHeaderModule(
              header: AppMessage.dueDate, required: true),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.appColors, width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                      detailWorkOrderScreenController
                          .showSelectedDueDate.value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        // color: AppColors.greyColor,
                      ),
                    ).paddingOnly(left: 10)),
                GestureDetector(
                  onTap: () async {
                    detailWorkOrderScreenController.selectedDateType =
                        WorkOrderDetailsDate.dueDate;
                    await detailWorkOrderScreenController.selectDate(context);
                  },
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
        ],
      ),
    );
  }
}
//complete Date
class completeDateWorkOrderDetailsScreenWidget extends StatelessWidget {
  completeDateWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFieldHeaderModule(
              header: AppMessage.completeDate, required: true),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.appColors, width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                      detailWorkOrderScreenController
                          .showSelectedCompleteDate.value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        // color: AppColors.greyColor,
                      ),
                    ).paddingOnly(left: 10)),
                GestureDetector(
                  onTap: () async {
                    detailWorkOrderScreenController.selectedDateType =
                        WorkOrderDetailsDate.completeDate;
                    await detailWorkOrderScreenController.selectDate(context);
                  },
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
        ],
      ),
    );
  }
}

//Per Diem Penalty
class PerDiemPenaltyWorkOrderDetailsScreenWidget extends StatelessWidget {
  PerDiemPenaltyWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(
            header: AppMessage.perDiemPenalty, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
          hintText: AppMessage.perDiemPenalty,
          fieldController: detailWorkOrderScreenController.perDiemPenaltyTextFieldController,
          keyboardType: TextInputType.number,

          onChange: (p0) {
            log(detailWorkOrderScreenController.unitTextFieldController.text);
          },
        ),
      ],
    );
  }
}

//Actual Cost
class ActualCostWorkOrderDetailsScreenWidget extends StatelessWidget {
  ActualCostWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(
            header: AppMessage.actualCost, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
          hintText: AppMessage.actualCost,
          fieldController: detailWorkOrderScreenController.actualCostTextFieldController,
          keyboardType: TextInputType.number,

          onChange: (p0) {
            log(detailWorkOrderScreenController.unitTextFieldController.text);
          },
        ),
      ],
    );
  }
}

//Projected Cost
class ProjectedCostWorkOrderDetailsScreenWidget extends StatelessWidget {
  ProjectedCostWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(
            header: AppMessage.projectedCost, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
          hintText: AppMessage.projectedCost,
          fieldController: detailWorkOrderScreenController.projectedCostTextFieldController,
          keyboardType: TextInputType.number,

          onChange: (p0) {
            log(detailWorkOrderScreenController.unitTextFieldController.text);
          },
        ),
      ],
    );
  }
}

//Cost Over Runs
class CostOverRunsWorkOrderDetailsScreenWidget extends StatelessWidget {
  CostOverRunsWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(
            header: AppMessage.costOverRuns, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
          hintText: AppMessage.costOverRuns,
          fieldController: detailWorkOrderScreenController.costOverRunsTextFieldController,
          keyboardType: TextInputType.number,

          onChange: (p0) {
            log(detailWorkOrderScreenController.costOverRunsTextFieldController.text);
          },
        ),
      ],
    );
  }
}

//Special Terms
class SpecialTermsWorkOrderDetailsScreenWidget extends StatelessWidget {
  SpecialTermsWorkOrderDetailsScreenWidget({Key? key}) : super(key: key);

  final detailWorkOrderScreenController =
  Get.find<DetailWorkOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFieldHeaderModule(
            header: AppMessage.specialTerms, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
          hintText: AppMessage.specialTerms,
          fieldController: detailWorkOrderScreenController.specialTermsTextFieldController,
          keyboardType: TextInputType.number,

          onChange: (p0) {
            log(detailWorkOrderScreenController.specialTermsTextFieldController.text);
          },
        ),
      ],
    );
  }
}
