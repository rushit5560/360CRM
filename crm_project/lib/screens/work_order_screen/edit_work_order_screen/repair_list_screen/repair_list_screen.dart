import 'dart:developer';
import 'package:crm_project/common_modules/common_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_modules/common_textfield.dart';
import '../../../../common_modules/common_textfield_header_module.dart';
import '../../../../common_modules/custom_submit_button.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/work_order_module_controllers/repair_list_screen_controller.dart';
import '../../../../models/repair_screen_models/active_repair_area_list_model.dart';
import '../../../../models/repair_screen_models/repair_item_model.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/decorations.dart';
import '../../../../utils/messaging.dart';



class RepairListScreen extends StatelessWidget {
  RepairListScreen({Key? key}) : super(key: key);
  final repairListScreenController = Get.put(RepairListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
        titleText: AppMessage.repairListLabel,
        leadingShow: false,
        actionShow: false,
      ),
      body: Obx(
        () => repairListScreenController.isLoading.value
            ? CommonLoader().showLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount:
                          repairListScreenController.mainRepairDataList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {

                        RepairItemModel singleItem = repairListScreenController.mainRepairDataList[i];

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.appColors, width: 1.5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              // Close button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      log('Close');
                                      repairListScreenController.mainRepairDataList.removeAt(i);
                                      repairListScreenController.loadUI();
                                    },
                                    child: Icon(Icons.close_rounded,
                                      color: AppColors.redColor,
                                      size: 18.sp,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),


                              // Qty & Area Module
                              Row(
                                children: [
                                  // Qty Module
                                  Expanded(
                                    flex: 25,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonTextFieldHeaderModule(
                                          header: AppMessage.qty,
                                          required: true,
                                        ).paddingOnly(bottom: 5),
                                        TextFieldModule(
                                          fieldController: singleItem.qtyFieldController,
                                          hintText: AppMessage.qty,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Area Dropdown module
                                  Expanded(
                                    flex: 75,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonTextFieldHeaderModule(
                                          header: AppMessage.areaLabel,
                                          required: true,
                                        ),
                                        const SizedBox(height: 5),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField<RepairAreaData>(
                                            isExpanded: true,
                                            decoration: dropdownInputDecoration,
                                            hint: Text(
                                              AppMessage.selectPropertyLabel,
                                              style: const TextStyle(color: AppColors.appColors),
                                            ),
                                            value: singleItem.repairAreaDataValue,
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            validator: (value) {
                                              if(value!.repairAreas == "Select Area") {
                                                return "Please select area";
                                              }
                                              return null;
                                            },
                                            onChanged: (newValue) async {
                                              singleItem.repairAreaDataValue = newValue!;
                                              // loadUI getting from controller
                                              repairListScreenController.loadUI();
                                            },
                                            // Getting From Controller
                                            items: repairListScreenController.repairAreaList.map((value) {
                                              return DropdownMenuItem<RepairAreaData>(
                                                value: value,
                                                child: Text(value.repairAreas!),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Item module
                              /*CommonTextFieldHeaderModule(
                                header: AppMessage.itemLabel,
                                required: true,
                              ),
                              const SizedBox(height: 5),
                              DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<RepairAreaData>(
                                  isExpanded: true,
                                  decoration: dropdownInputDecoration,
                                  hint: Text(
                                    AppMessage.selectPropertyLabel,
                                    style: const TextStyle(color: AppColors.appColors),
                                  ),
                                  value: singleItem.repairAreaDataValue,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if(value!.repairAreas == "Select Area") {
                                      return "Please select area";
                                    }
                                    return null;
                                  },
                                  onChanged: (newValue) async {
                                    singleItem.repairAreaDataValue = newValue!;
                                    // loadUI getting from controller
                                    repairListScreenController.loadUI();
                                  },
                                  // Getting From Controller
                                  items: repairListScreenController.repairAreaList.map((value) {
                                    return DropdownMenuItem<RepairAreaData>(
                                      value: value,
                                      child: Text(value.repairAreas!),
                                    );
                                  }).toList(),
                                ),
                              ),*/

                              // Description Module
                              CommonTextFieldHeaderModule(
                                header: AppMessage.description,
                                required: true,
                              ).paddingOnly(bottom: 5),
                              TextFieldModule(
                                fieldController: singleItem.descriptionFieldController,
                                hintText: AppMessage.description,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 8),

                              // Unit & Total module
                              Row(
                                children: [
                                  // Unit cost Module
                                  Expanded(
                                    // flex: 25,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonTextFieldHeaderModule(
                                          header: AppMessage.unitCostLabel,
                                          required: true,
                                        ).paddingOnly(bottom: 5),
                                        TextFieldModule(
                                          fieldController: singleItem.unitCostFieldController,
                                          hintText: AppMessage.unitCostLabel,
                                          keyboardType: TextInputType.number,
                                          prifixIcon: Align(
                                            widthFactor: 1.0,
                                            heightFactor: 1.0,
                                            child: Text(
                                              '\$',
                                              style:
                                              TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                            ),
                                          ).paddingOnly(right: 5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),

                                  // Total Module
                                  Expanded(
                                    // flex: 75,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonTextFieldHeaderModule(
                                          header: AppMessage.totalLabel,
                                          required: true,
                                        ).paddingOnly(bottom: 5),
                                        TextFieldModule(
                                          fieldController: singleItem.totalFieldController,
                                          hintText: AppMessage.totalLabel,
                                          keyboardType: TextInputType.number,
                                          prifixIcon: Align(
                                            widthFactor: 1.0,
                                            heightFactor: 1.0,
                                            child: Text(
                                              '\$',
                                              style:
                                              TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                            ),
                                          ).paddingOnly(right: 5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Due Date Module
                              CommonTextFieldHeaderModule(
                                header: AppMessage.dueDateLabel,
                                required: true,
                              ).paddingOnly(bottom: 5),
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
                                          DateFormatChanger().dateFormat(singleItem.dueDate),
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
                                      await selectDate(
                                        context: context,
                                        initialDate: singleItem.dueDate,
                                        index: i,
                                        // index: index,
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
                              ),
                              const SizedBox(height: 8),

                              //Completed Date Module
                              Row(
                                children: [
                                  Expanded(
                                    flex: 25,
                                    child: Column(
                                      children: [
                                        CommonTextFieldHeaderModule(
                                          header: AppMessage.completedLabel,
                                          required: false,
                                        )/*.paddingOnly(bottom: 5)*/,
                                        Checkbox(
                                          value: singleItem.isCompleted,
                                          onChanged: (value) {
                                            singleItem.isCompleted = value!;
                                            repairListScreenController.loadUI();
                                          },
                                          activeColor: AppColors.appColors,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 75,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonTextFieldHeaderModule(
                                          header: AppMessage.completedDate,
                                          required: true,
                                        ).paddingOnly(bottom: 5),
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
                                                    DateFormatChanger().dateFormat(singleItem.dueDate),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.bold,
                                                      color: singleItem.isCompleted == true
                                                        ? AppColors.blackColor : AppColors.greyColor
                                                      // color: AppColors.greyColor,
                                                    ),
                                                  ).paddingOnly(left: 10)),
                                              GestureDetector(
                                                onTap: () async => singleItem.isCompleted == false
                                                    ? null
                                                    : await selectDate(
                                                        context: context,
                                                        initialDate:
                                                            singleItem.dueDate,
                                                        index: i,
                                                        // index: index,
                                                      ),
                                                child: SizedBox(
                                                  child: Center(
                                                    child: Icon(Icons
                                                            .calendar_today_outlined,
                                                        color: singleItem.isCompleted == true
                                                            ? AppColors.blackColor : AppColors.greyColor
                                                    )
                                                        .paddingAll(12),
                                                  ), //Text(AppMessage.chooseFile,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: AppColors.appColors),)).paddingAll(5)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ).paddingAll(8),
                        ).paddingSymmetric(vertical: 10);
                      },
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appColors),
                      onPressed: () {
                        repairListScreenController.addMainRepairDataItem();
                        repairListScreenController.loadUI();
                        // if (repairListScreenController.formKey.currentState!.validate()) {

                          // if(screenController.ledgerOption == LedgerOption.create) {
                          //   await screenController.addLedgerFunction();
                          // } else {
                          //   await screenController.updateLedgerFunction();
                          // }
                        // }
                      },
                      child: const Center(child: Text(AppMessage.add)),
                    ).paddingSymmetric(horizontal: 35.w),


                  ],
                ).paddingOnly(left: 10, right: 10),
              ),
      ),

      bottomNavigationBar: CustomSubmitButton(
        labelText: AppMessage.submitLabel,
        onPress: () {},
      ).paddingSymmetric(horizontal: 30.w),

    );
  }

  Future<void> selectDate({
    required BuildContext context,
    required DateTime initialDate,
    required int index,
    // required SelectedDateType selectedDateType
  }) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      repairListScreenController.mainRepairDataList[index].dueDate = picked;
      repairListScreenController.loadUI();
      // singleItem.paymentDate = picked;
    }
  }


}
