import 'dart:developer';

import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:crm_project/constants/extension.dart';
import 'package:crm_project/controller/company_module_controllers/work_order_module_controllers/detail_work_order_screen_controller.dart';
import 'package:crm_project/models/work_order_screen_models/details_work_order_screen_models/work_order_company_list_model.dart';
import 'package:crm_project/models/work_order_screen_models/details_work_order_screen_models/work_order_status_list_model.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_textfield_header_module.dart';
import '../../../../constants/colors.dart';
import '../../../../models/work_order_screen_models/details_work_order_screen_models/work_order_property_list_model.dart';
import '../../../../models/work_order_screen_models/details_work_order_screen_models/work_order_type_list_model.dart';
import '../../../../utils/decorations.dart';
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
        detailWorkOrderScreenController.isLoading.value
            ? Container()
            : DropdownButtonHideUnderline(
                child: DropdownButtonFormField<WorkOrderTypeData>(
                  isExpanded: true,
                  decoration: dropdownInputDecoration,
                  hint: Text(
                    AppMessage.selectWorkOrderType,
                    style: const TextStyle(color: AppColors.appColors),
                  ),
                  value: detailWorkOrderScreenController.workOrderTypeListValue,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.type == AppMessage.selectWorkOrderType) {
                      return "Please ${AppMessage.selectWorkOrderType}";
                    }
                    return null;
                  },
                  onChanged: (newValue) async {
                    detailWorkOrderScreenController.workOrderTypeListValue =
                        newValue!;
                    log('new Type :  ${detailWorkOrderScreenController.workOrderTypeListValue.toJson()}');
                    log('new typeType :  ${detailWorkOrderScreenController.workOrderTypeListValue.type}');
                    log('new Type id :  ${detailWorkOrderScreenController.workOrderTypeListValue.workOrderTypeId}');
                  },
                  // Getting From Controller
                  items: detailWorkOrderScreenController
                      .workOrderTypeListDropDown
                      .map((value) {
                    return DropdownMenuItem<WorkOrderTypeData>(
                      value: value,
                      child: Text(value.type!),
                    );
                  }).toList(),
                ),
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
        detailWorkOrderScreenController.isLoading.value
            ? Container()
            : DropdownButtonHideUnderline(
                child: DropdownButtonFormField<WorkOrderStatusData>(
                  isExpanded: true,
                  decoration: dropdownInputDecoration,
                  hint: Text(
                    AppMessage.selectWorkOrderStatus,
                    style: const TextStyle(color: AppColors.appColors),
                  ),
                  value:
                      detailWorkOrderScreenController.workOrderStatusListValue,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.name == AppMessage.selectWorkOrderStatus) {
                      return "Please ${AppMessage.selectWorkOrderStatus}";
                    }
                    return null;
                  },
                  onChanged: (newValue) async {
                    detailWorkOrderScreenController.workOrderStatusListValue =
                        newValue!;
                    log('new workOrder Status :  ${detailWorkOrderScreenController.workOrderStatusListValue.toJson()}');
                    log('new workOrder Status name :  ${detailWorkOrderScreenController.workOrderStatusListValue.name}');
                    log('new workOrder Status Type id :  ${detailWorkOrderScreenController.workOrderStatusListValue.workOrderStatusId}');
                  },
                  // Getting From Controller
                  items: detailWorkOrderScreenController
                      .workOrderStatusListDropDown
                      .map((value) {
                    return DropdownMenuItem<WorkOrderStatusData>(
                      value: value,
                      child: Text(value.name!),
                    );
                  }).toList(),
                ),
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
          fieldController:
              detailWorkOrderScreenController.detailsTextFieldController,
          keyboardType: TextInputType.name,
          onChange: (p0) {
            log(detailWorkOrderScreenController
                .detailsTextFieldController.text);
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
        CommonTextFieldHeaderModule(
            header: AppMessage.property, required: false),
        const SizedBox(
          height: 5,
        ),
        detailWorkOrderScreenController.isLoading.value
            ? Container()
            : DropdownButtonHideUnderline(
                child: DropdownButtonFormField<WorkOrderPropertyData>(
                isExpanded: true,
                decoration: dropdownInputDecoration,
                hint: Text(
                  AppMessage.selectWorkOrderProperty,
                  style: const TextStyle(color: AppColors.appColors),
                ),
                value:
                    detailWorkOrderScreenController.workOrderPropertyListValue,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.propertyName ==
                      AppMessage.selectWorkOrderProperty) {
                    return "Please ${AppMessage.selectWorkOrderProperty}";
                  }
                  return null;
                },
                onChanged: (newValue) async {
                  detailWorkOrderScreenController.workOrderPropertyListValue =
                      newValue!;
                  log('new Property Type :  ${detailWorkOrderScreenController.workOrderPropertyListValue}');
                  log('new Property Type :  ${detailWorkOrderScreenController.workOrderPropertyListValue.propertyName}');
                  log('new Property id :  ${detailWorkOrderScreenController.workOrderPropertyListValue.propertyId}');
                },
                // Getting From Controller
                items: detailWorkOrderScreenController
                    .workOrderPropertyListDropDown
                    .map((value) {
                  return DropdownMenuItem<WorkOrderPropertyData>(
                    value: value,
                    child: Text(value.propertyName!),
                  );
                }).toList(),
              ))
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
        CommonTextFieldHeaderModule(header: AppMessage.unit, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
          hintText: AppMessage.unit,
          fieldController:
              detailWorkOrderScreenController.unitTextFieldController,
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
        detailWorkOrderScreenController.isLoading.value
            ? Container()
            : DropdownButtonHideUnderline(
                child: DropdownButtonFormField<WorkOrderCompanyData>(
                  isExpanded: true,
                  decoration: dropdownInputDecoration,
                  hint: Text(
                    AppMessage.selectWorkOrderCompany,
                    style: const TextStyle(color: AppColors.appColors),
                  ),
                  value:
                      detailWorkOrderScreenController.workOrderCompanyListValue,
                  validator: (value) {
                    if (value!.companyName ==
                        AppMessage.selectWorkOrderCompany) {
                      return "Please ${AppMessage.selectWorkOrderCompany}";
                    }
                    return null;
                  },
                  onChanged: (newValue) async {
                    detailWorkOrderScreenController.workOrderCompanyListValue =
                        newValue!;
                    log('new Company Data :  ${detailWorkOrderScreenController.workOrderCompanyListValue.toJson()}');
                    log('new Company Name :  ${detailWorkOrderScreenController.workOrderCompanyListValue.companyName}');
                    log('new Company id :  ${detailWorkOrderScreenController.workOrderCompanyListValue.companyId}');
                  },
                  // Getting From Controller
                  items: detailWorkOrderScreenController
                      .workOrderCompanyListDropDown
                      .map((value) {
                    return DropdownMenuItem<WorkOrderCompanyData>(
                      value: value,
                      child: Text(value.companyName!),
                    );
                  }).toList(),
                ),
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
        CommonTextFieldHeaderModule(header: AppMessage.budget, required: false),
        const SizedBox(height: 5),
        TextFieldModule(
          hintText: AppMessage.budget,
          fieldController:
              detailWorkOrderScreenController.budgetTextFieldController,
          keyboardType: TextInputType.number,
          prifixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Text(
              '\$',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ).commonOnlyPadding(right: 5),
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
          fieldController:
              detailWorkOrderScreenController.perDiemBonusTextFieldController,
          keyboardType: TextInputType.number,
          prifixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Text(
              '\$',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ).commonOnlyPadding(right: 5),
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
          fieldController: detailWorkOrderScreenController
              .percentageOfBudgetTextFieldController,
          keyboardType: TextInputType.number,
          prifixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Text(
              '\$',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ).commonOnlyPadding(right: 5),
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
                  detailWorkOrderScreenController.showSelectedDueDate.value,
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
          fieldController:
              detailWorkOrderScreenController.perDiemPenaltyTextFieldController,
          keyboardType: TextInputType.number,
          prifixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Text(
              '\$',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ).commonOnlyPadding(right: 5),
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
          fieldController:
              detailWorkOrderScreenController.actualCostTextFieldController,
          keyboardType: TextInputType.number,
          prifixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Text(
              '\$',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ).commonOnlyPadding(right: 5),
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
          fieldController:
              detailWorkOrderScreenController.projectedCostTextFieldController,
          keyboardType: TextInputType.number,
          prifixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Text(
              '\$',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ).commonOnlyPadding(right: 5),
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
          fieldController:
              detailWorkOrderScreenController.costOverRunsTextFieldController,
          keyboardType: TextInputType.number,
          prifixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Text(
              '\$',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ).commonOnlyPadding(right: 5),
          onChange: (p0) {
            log(detailWorkOrderScreenController
                .costOverRunsTextFieldController.text);
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
          fieldController:
              detailWorkOrderScreenController.specialTermsTextFieldController,
          keyboardType: TextInputType.number,
          onChange: (p0) {
            log(detailWorkOrderScreenController
                .specialTermsTextFieldController.text);
          },
        ),
      ],
    );
  }
}
