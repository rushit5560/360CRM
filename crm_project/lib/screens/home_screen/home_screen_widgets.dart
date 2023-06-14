import 'dart:developer';
import 'package:crm_project/common_modules/common_textfield_header_module.dart';
import 'package:crm_project/common_modules/divider.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/constants/extension.dart';
import 'package:crm_project/controller/home_screen_controller.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/text_row.dart';
import '../../utils/validator.dart';

//Property Details
class PropertyDetails extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();
  String selectedLocation = '';

  PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Option 2
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: homeScreenController.propertyDetailsKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppMessage.propertyDetails,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 14.sp),
              ),
            ).paddingOnly(top: 5, bottom: 5),
            const CustomDivider(),
            CommonTextFieldHeaderModule(header: AppMessage.propertyAddress, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              hintText: AppMessage.propertyAddress,
              fieldController: homeScreenController.propertyAddressFieldController,
              keyboardType: TextInputType.streetAddress,
              validate: (value) => FieldValidation().validateEmpty(value, AppMessage.propertyAddress),
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(height: 10),

            //state city
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.state, required: true),
                      const SizedBox(height: 5),
                      Container(
                        width: Get.width * .5,
                        decoration: BoxDecoration(
                            // color: AppColors.appColors,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.appColors)),
                        child: Obx(
                          () => homeScreenController.isLoading.value
                              ? Container()
                              : DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text(
                                      homeScreenController.stateSelect.value,
                                      style: const TextStyle(
                                          color: AppColors.appColors),
                                    ),
                                    // Not necessary for Option 1
                                    // value: selectedLocation.isNotEmpty ?  selectedLocation: null ,
                                    onChanged: (newValue) {
                                      homeScreenController.stateSelect.value =
                                          newValue!;
                                      homeScreenController.loadUI();
                                      log(newValue);
                                    },
                                    items: homeScreenController
                                        .stateDropDownList
                                        .map((location) {
                                      return DropdownMenuItem(
                                        value: location,
                                        child: Text(location),
                                      );
                                    }).toList(),
                                  ),
                                ),
                        ).paddingOnly(left: 5, right: 5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.city, required: false),
                      const SizedBox(height: 5),
                      Container(
                        width: Get.width * .5,
                        decoration: BoxDecoration(
                            // color: AppColors.appColors,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.appColors)),
                        child: Obx(
                          () => homeScreenController.isLoading.value
                              ? Container()
                              : DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text(
                                      homeScreenController.citySelect.value,
                                      style: const TextStyle(
                                          color: AppColors.appColors),
                                    ),
                                    // Not necessary for Option 1
                                    // value: selectedLocation.isNotEmpty ?  selectedLocation: null ,
                                    onChanged: (newValue) {
                                      homeScreenController.citySelect.value =
                                          newValue!;
                                      homeScreenController.loadUI();
                                      log(newValue);
                                    },
                                    items: homeScreenController.cityDropDownList
                                        .map((location) {
                                      return DropdownMenuItem(
                                        value: location,
                                        child: Text(location),
                                      );
                                    }).toList(),
                                  ),
                                ),
                        ).paddingOnly(left: 5, right: 5),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            // zip & lead Source
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.zip, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        hintText: AppMessage.zip,
                        fieldController:
                            homeScreenController.zipFieldController,
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                        validate: (value) =>
                            FieldValidation().validateZip(value!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.leadSource, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                            homeScreenController.leadSourceFieldController,
                        hintText: AppMessage.leadSource,
                        validate: (value) => FieldValidation()
                            .validateEmpty(value, 'lead source'),
                        keyboardType: TextInputType.multiline,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //Expected After Repair value
            CommonTextFieldHeaderModule(
                header: AppMessage.expectedAfterRepairValue, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController:
                  homeScreenController.expectedAfterRepairValueFieldController,
              hintText: AppMessage.expectedAfterRepairValue,
              validate: (value) => FieldValidation()
                  .validateAmount(value, AppMessage.expectedAfterRepairValue),
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(height: 10),

            //land value & offer price
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.leadSource, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                            homeScreenController.landValueFieldController,
                        hintText: 'Land Value',
                        validate: (value) => FieldValidation()
                            .validateAmount(value, 'land value'),
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.offerPrice, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                        homeScreenController.offerPriceFieldController,
                        onChange: (val) {
                          homeScreenController.downPaymentAmountFunction();
                          homeScreenController.firstMortgageFinanceAmountCalculation();
                          homeScreenController.firstMortgageClosingCostCalculation();
                        },
                        hintText: AppMessage.offerPrice,
                        validate: (value) => FieldValidation()
                            .validateAmount(value, AppMessage.offerPrice),
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // CommonTextFieldHeaderModule(
            //     header: AppMessage.howDidYouFindThisProperty, required: false),
            // const SizedBox(height: 5),
            // Container(
            //   width: Get.width,
            //   decoration: BoxDecoration(
            //       // color: AppColors.appColors,
            //       borderRadius: BorderRadius.circular(5),
            //       border: Border.all(color: AppColors.appColors)),
            //   child: Obx(
            //     () => homeScreenController.isLoading.value
            //         ? Container()
            //         : DropdownButtonHideUnderline(
            //             child: DropdownButton(
            //               hint: Text(
            //                 homeScreenController.stateSelect.value,
            //                 style: const TextStyle(color: AppColors.appColors),
            //               ),
            //               // Not necessary for Option 1
            //               // value: selectedLocation.isNotEmpty ?  selectedLocation: null ,
            //               onChanged: (newValue) {
            //                 homeScreenController.stateSelect.value = newValue!;
            //                 homeScreenController.loadUI();
            //                 log(newValue);
            //               },
            //               items: homeScreenController.stateDropDownList
            //                   .map((location) {
            //                 return DropdownMenuItem(
            //                   value: location,
            //                   child: Text(location),
            //                 );
            //               }).toList(),
            //             ),
            //           ),
            //   ).paddingOnly(left: 5, right: 5),
            // ),
          ],
        ),
      ).paddingAll(5),
    );
  }
}

//Financial Details
class FinancialDetails extends StatelessWidget {
  FinancialDetails({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: homeScreenController.financialDetailsKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppMessage.financialDetails,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 14.sp),
              ),
            ).paddingOnly(top: 5, bottom: 5),
            const CustomDivider(),
            // const SizedBox(height: 10),
            CommonTextFieldHeaderModule(
                header: AppMessage.grossMonthlyRevenue, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController:
                  homeScreenController.grossMonthlyRevenueFieldController,
              hintText: AppMessage.grossMonthlyRevenue,
              validate: (value) => FieldValidation()
                  .validateAmount(value, AppMessage.grossMonthlyRevenue),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
              onChange: (text) {
                homeScreenController
                    .propertyManagementFeesAmountCountFunction();
                homeScreenController.vacancyAndReplacementAmountFunction();
                homeScreenController.effectiveGrossIncomeFunction();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
            ),
            const SizedBox(height: 10),
            //Property Mgmt % / Amt
            Column(
              children: [
                CommonTextFieldHeaderModule(
                    header: 'Property Mgmt Fees % / Amt', required: true),
                const SizedBox(height: 5),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFieldModule(
                    fieldController: homeScreenController
                        .propertyManagementFeesPercentageFieldController,
                    onChange: (text) {
                      homeScreenController
                          .propertyManagementFeesAmountCountFunction();
                      homeScreenController.effectiveGrossIncomeFunction();
                    },
                    hintText: 'Property Management Fees percentage',
                    prifixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Text(
                        '%',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ).commonOnlyPadding(right: 5),
                    validate: (value) => FieldValidation().validateAmount(
                        value, 'property management fees percentage'),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextFieldModule(
                    fieldController: homeScreenController
                        .propertyManagementFeesAmountFieldController,
                    hintText: 'Property Management Fees amount',
                    keyboardType: TextInputType.number,
                    prifixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Text(
                        '\$',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ).commonOnlyPadding(right: 5),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

//Vacancy and Replacement Reserves Allowance % / Amt
            CommonTextFieldHeaderModule(
                header: 'Vacancy and Replacement Reserves / %',
                required: true),
            const SizedBox(height: 5),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldModule(
                        fieldController: homeScreenController
                            .vacancyandReplacementReservesFieldController,
                        onChange: (val) {
                          homeScreenController.vacancyAndReplacementAmountFunction();
                          homeScreenController.operatingExpensesFunction();
                        },
                        hintText: 'Vacancy and Replacement Reserves',
                        validate: (value) => FieldValidation().validateAmount(
                            value, 'vacancy and replacement reserves'),
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '%',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldModule(
                        fieldController: homeScreenController
                            .vacancyandReplacementAmountFieldController,
                        hintText: 'Vacancy and Replacement amount',
                        keyboardType: TextInputType.number,
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
          //Monthly Condo /Association fees
            CommonTextFieldHeaderModule(
                header: AppMessage.condoAssociationFees, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController: homeScreenController.monthlyCondoFieldController,
              hintText: AppMessage.condoAssociationFees,
              validate: (value) => FieldValidation()
                  .validateAmount(value, AppMessage.condoAssociationFees),
              onChange: (value) {
                homeScreenController.operatingExpensesFunction();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 10,
            ),

//monthly Taxes
            CommonTextFieldHeaderModule(
                header: AppMessage.monthlyTaxes, required: true),
            const SizedBox(height: 5),

            TextFieldModule(
              fieldController: homeScreenController.monthlyTaxesFieldController,
              hintText: AppMessage.monthlyTaxes,
              validate: (value) => FieldValidation()
                  .validateAmount(value, AppMessage.monthlyTaxes),
              onChange: (value) {
                homeScreenController.operatingExpensesFunction();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(height: 10),
//monthly Repairs & maintenance
            CommonTextFieldHeaderModule(
                header: AppMessage.monthlyRepairsMaintenance, required: true),
            const SizedBox(height: 5),

            TextFieldModule(
              fieldController:
                  homeScreenController.monthlyRepairsMaintenanceFieldController,
              hintText: AppMessage.monthlyRepairsMaintenance,
              validate: (value) => FieldValidation()
                  .validateAmount(value, AppMessage.monthlyRepairsMaintenance),
              onChange: (value) {
                homeScreenController.operatingExpensesFunction();
              },
              keyboardType: TextInputType.number,
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
//Administrative allowance
                      CommonTextFieldHeaderModule(
                          header: AppMessage.administrativeAllowance,
                          required: true),
                      const SizedBox(height: 5),

                      TextFieldModule(
                        fieldController: homeScreenController
                            .adminstrativeAllowanceFieldController,
                        hintText: AppMessage.administrativeAllowance,
                        validate: (value) => FieldValidation().validateAmount(
                            value, AppMessage.administrativeAllowance),
                        onChange: (value) {
                          homeScreenController.operatingExpensesFunction();
                        },
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
//Monthly Insurance
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.monthlyInsurance, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController: homeScreenController
                            .monthlyInsuranceFieldController,
                        hintText: AppMessage.monthlyInsurance,
                        validate: (value) => FieldValidation()
                            .validateAmount(value, AppMessage.monthlyInsurance),
                        onChange: (value) {
                          homeScreenController.operatingExpensesFunction();
                        },
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
//1 st Mortgage Payment
                      CommonTextFieldHeaderModule(
                          header: '1 st Mortgage Payment', required: true),
                      const SizedBox(height: 5),

                      TextFieldModule(
                        fieldController: homeScreenController
                            .mortgagePayment1FieldController,
                        hintText: '1 st Mortgage Payment',
                        validate: (value) => FieldValidation()
                            .validateAmount(value, '1 st mortgage payment'),
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //2 st Mortgage Payment
                      CommonTextFieldHeaderModule(
                          header: '2 st Mortgage Payment', required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController: homeScreenController
                            .mortgagePayment2FieldController,
                        hintText: '2 st Mortgage Payment',
                        validate: (value) => FieldValidation()
                            .validateAmount(value, '2 st mortgage payment'),
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

//Monthly Utilities
            CommonTextFieldHeaderModule(
                header: AppMessage.monthlyUtilities, required: true),
            const SizedBox(height: 5),

            TextFieldModule(
              fieldController:
                  homeScreenController.monthlyUtilitiesFieldController,
              hintText: AppMessage.monthlyUtilities,
              validate: (value) => FieldValidation()
                  .validateAmount(value, AppMessage.monthlyUtilities),
              onChange: (value) {
                homeScreenController.operatingExpensesFunction();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
          ],
        ),
      ).paddingAll(5),
    );
  }
}

//project Costs
class ProjectCosts extends StatelessWidget {
  ProjectCosts({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: homeScreenController.projectCostsKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppMessage.projectCosts,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 14.sp),
              ).paddingOnly(top: 5, bottom: 5),
            ),
            const CustomDivider(),
            // const SizedBox(height: 10),

//rehab costs paid out of pocket
            CommonTextFieldHeaderModule(
                header: AppMessage.rehabCostsPaidOutOfPocket, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController:
                  homeScreenController.costsPaidoutPocketFieldController,
              hintText: AppMessage.rehabCostsPaidOutOfPocket,
              validate: (value) => FieldValidation()
                  .validateAmount(value, 'rehab costs paid out of pocket'),
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 10,
            ),

//rehab costs financed
            CommonTextFieldHeaderModule(
                header: 'Rehab Costs Financed', required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController: homeScreenController.costFinancedFieldController,
              hintText: 'Rehab Costs Financed',
              validate: (value) => FieldValidation()
                  .validateAmount(value, 'rehab costs financed'),
              onChange: (value) {
                homeScreenController.firstMortgageFinanceAmountCalculation();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
          ],
        ),
      ).paddingAll(5),
    );
  }
}

//acquisition cost
class AcquisitionCosts extends StatelessWidget {
  AcquisitionCosts({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: homeScreenController.acquisitionCostsKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppMessage.acquisitionCosts,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 5, top: 5),
            ),
            const CustomDivider(),
            // const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
//appraisal
                      CommonTextFieldHeaderModule(
                          header: AppMessage.appraisal, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                            homeScreenController.appraisalCostsFieldController,
                        hintText: AppMessage.appraisal,
                        validate: (value) => FieldValidation()
                            .validateAmount(value, AppMessage.appraisal),
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
//inspection
                      CommonTextFieldHeaderModule(
                          header: AppMessage.inspection, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                            homeScreenController.inspectionCostsFieldController,
                        hintText: AppMessage.inspection,
                        validate: (value) => FieldValidation()
                            .validateAmount(value, 'inspection'),
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.survey, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                            homeScreenController.surveyCostsFieldController,
                        hintText: AppMessage.survey,
                        validate: (value) =>
                            FieldValidation().validateAmount(value, 'survey'),
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.wholesaleFee, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController: homeScreenController
                            .wholesaleFeeCostsFieldController,
                        hintText: AppMessage.wholesaleFee,
                        validate: (value) => FieldValidation()
                            .validateAmount(value, 'wholesale fee'),
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ).paddingAll(5),
    );
  }
}

//1st Mortgage Details
class MortgageDetails1 extends StatelessWidget {
  MortgageDetails1({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: homeScreenController.mortgage1Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "1st Mortgage Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 5, top: 5),
            ),
            const CustomDivider(),
            // const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Mortgage Term
                      CommonTextFieldHeaderModule(
                          header: AppMessage.mortgageTermMonths, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                        homeScreenController.mortgageTermMonthsFieldController,
                        hintText: AppMessage.mortgageTermMonths,
                        validate: (value) => FieldValidation()
                            .validateAmount(value, 'mortgage term (months)'),
                        onChange: (value) {
                          homeScreenController.firstMortgagePmtCalculateFunction();
                        },
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // payments per year
                      CommonTextFieldHeaderModule(
                          header: AppMessage.paymentsPerYear, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                        homeScreenController.paymentsPerYearFieldController,
                        hintText: AppMessage.paymentsPerYear,
                        validate: (value) =>
                            FieldValidation().validateAmount(value, 'payments per year'),
                        onChange: (value) {
                          homeScreenController.firstMortgagePmtCalculateFunction();
                        },
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Down Payment Percentage
            CommonTextFieldHeaderModule(
                header: AppMessage.downPaymentPercentage, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController:
                  homeScreenController.downPaymentPercentageFieldController,
              hintText: AppMessage.downPaymentPercentage,
              validate: (value) => FieldValidation()
                  .validateAmount(value, 'down payment percentage'),
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '%',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              onChange: (val) {
                homeScreenController.downPaymentAmountFunction();
                homeScreenController.financedAmountFunction();
                homeScreenController.firstMortgageFinanceAmountCalculation();
                homeScreenController.firstMortgageClosingCostCalculation();
                homeScreenController.calculatePointsAmountFunction();
                // homeScreenController.closingCostFunction();
              },
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Down Payment Amount
                      CommonTextFieldHeaderModule(
                          header: AppMessage.downPaymentAmount, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                        homeScreenController.downPaymentAmountFieldController,
                        readOnly: true,
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style:
                            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        hintText: AppMessage.downPaymentAmount,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Financed Amount
                      CommonTextFieldHeaderModule(
                          header: AppMessage.financedAmount, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                        homeScreenController.financedAmountFieldController,
                        readOnly: true,
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style:
                            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        hintText: "Financed Amount",
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),


            //Interest Rate
            CommonTextFieldHeaderModule(
                header: AppMessage.interestRate, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController: homeScreenController.interestRateFieldController,
              hintText: AppMessage.interestRate,
              validate: (value) =>
                  FieldValidation().validateAmount(value, 'interest rate'),
              onChange: (value) {
                homeScreenController.firstMortgagePmtCalculateFunction();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '%',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),

            //radioButton Interest Only (0=Yes, 1=No)
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Interest Only',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value:
                            homeScreenController.interestOnlyButton.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController.interestOnlyButton.value = 0;
                              homeScreenController.firstMortgagePmtCalculateFunction();
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'Yes',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value:
                            homeScreenController.interestOnlyButton.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController.interestOnlyButton.value = 1;
                              homeScreenController.firstMortgagePmtCalculateFunction();
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'No',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //loan Points
            CommonTextFieldHeaderModule(
                header: AppMessage.loanPoints, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController: homeScreenController.loanPointsFieldController,
              hintText: AppMessage.loanPoints,
              validate: (value) =>
                  FieldValidation().validateAmount(value, 'loan points'),
              onChange: (val) {
                homeScreenController.pointsAmountFunction();
                // homeScreenController.financeAmountCalculation();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '%',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(height: 10),

            //Points Amount
            CommonTextFieldHeaderModule(
                header: AppMessage.pointsAmount, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController: homeScreenController.pointsAmountFieldController,
              hintText: AppMessage.pointsAmount,
              readOnly: true,
              onChange: (value) {
                // homeScreenController.financeAmountCalculation();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
            ),

            //Radio Button Points Financed (0=Yes, 1=No)
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Points Financed',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value:
                            homeScreenController.pointsFinancedButton.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController.pointsFinancedButton.value =
                              0;
                              homeScreenController.firstMortgageFinanceAmountCalculation();
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'Yes',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value:
                            homeScreenController.pointsFinancedButton.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController.pointsFinancedButton.value =
                              1;
                              homeScreenController.firstMortgageFinanceAmountCalculation();
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'No',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Closing Cost
            CommonTextFieldHeaderModule(
                header: AppMessage.closingCost, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController: homeScreenController.closingCostsFieldController,
              hintText: AppMessage.closingCost,
              onChange: (value) {
                // homeScreenController.financeAmountCalculation();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              readOnly: true,
              keyboardType: TextInputType.number,
            ),
            //Radio Button Closing Costs Financed (0=Yes, 1=No)
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Closing Costs Financed',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController
                                .closingCostsFinancedButton.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController
                                  .closingCostsFinancedButton.value = 0;
                              homeScreenController.firstMortgageFinanceAmountCalculation();
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'Yes',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController
                                .closingCostsFinancedButton.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController
                                  .closingCostsFinancedButton.value = 1;
                              homeScreenController.firstMortgageFinanceAmountCalculation();
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'No',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ).paddingAll(5),
    );
  }
}

//2nd Mortgage Details
class MortgageDetails2 extends StatelessWidget {
  MortgageDetails2({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
        key: homeScreenController.mortgage2Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "2st Mortgage Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 5, top: 5),
            ),
            const CustomDivider(),
            // const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  // Mortgage Term
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.mortgageTermMonths, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                        homeScreenController.mortgageTermMonths2FieldController,
                        hintText: "Mortgage Term (Months)",
                        validate: (value) => FieldValidation()
                            .validateAmount(value, 'mortgage term (months)'),
                        onChange: (value) {
                          homeScreenController.secondMortgagePmtCalculateFunction();
                        },
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  //payments Per Year
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.paymentsPerYear, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                        homeScreenController.paymentsPerYear2FieldController,
                        hintText: "Payments Per Year",
                        validate: (value) =>
                            FieldValidation().validateAmount(value, 'payments per year'),
                        onChange: (value) {
                          homeScreenController.secondMortgagePmtCalculateFunction();
                        },
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            //2nd Mortgage Amount
            CommonTextFieldHeaderModule(
                header: "2nd Mortgage Amount", required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController:
                  homeScreenController.mortgageAmount2FieldController,
              hintText: "2nd Mortgage Amount",
              validate: (value) => FieldValidation()
                  .validateAmount(value, '2nd mortgage amount'),
              onChange: (value) {
                homeScreenController.secondMortgageFinanceAmountCalculator();
                homeScreenController.secondFinanceClosingCostCalculator();
                homeScreenController.pointsAmountFunction2();
                homeScreenController.secondMortgagePmtCalculateFunction();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  //financed Amount
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.financedAmount, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                        homeScreenController.financedAmount2FieldController,
                        readOnly: true,
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '\$',
                            style:
                            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        onChange: (val) {
                          homeScreenController.pointsAmountFunction2();
                        },
                        hintText: "Financed Amount",
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  //Interest rate
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFieldHeaderModule(
                          header: AppMessage.interestRate, required: true),
                      const SizedBox(height: 5),
                      TextFieldModule(
                        fieldController:
                        homeScreenController.interestRate2FieldController,
                        hintText: "Interest Rate",
                        validate: (value) =>
                            FieldValidation().validateAmount(value, 'interest rate'),
                        onChange: (value) {
                          homeScreenController.secondMortgagePmtCalculateFunction();
                        },
                        prifixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            '%',
                            style:
                            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        ).commonOnlyPadding(right: 5),
                        keyboardType: TextInputType.number,
                        backgroundColor: AppColors.whiteColor1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //radioButton Interest Only (0=Yes, 1=No)
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Interest Only',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value:
                            homeScreenController.interestOnlyButton2.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController.interestOnlyButton2.value = 0;
                              homeScreenController.secondMortgagePmtCalculateFunction();
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'Yes',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value:
                            homeScreenController.interestOnlyButton2.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController.interestOnlyButton2.value = 1;
                              homeScreenController.secondMortgagePmtCalculateFunction();
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'No',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),


            //Loan Points
            CommonTextFieldHeaderModule(
                header: AppMessage.loanPoints, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController: homeScreenController.loanPoints2FieldController,
              hintText: "Loan Points",
              onChange: (val) {
                homeScreenController.pointsAmountFunction2();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '%',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              validate: (value) =>
                  FieldValidation().validateAmount(value, 'loan points'),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(height: 10),

            //Points Amount
            CommonTextFieldHeaderModule(
                header: AppMessage.pointsAmount, required: true),
            const SizedBox(height: 5),
            TextFieldModule(
              fieldController:
                  homeScreenController.pointsAmount2FieldController,
              hintText: "Points Amount",
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              readOnly: true,
              keyboardType: TextInputType.number,
            ),

            //Radio Button Points Financed (0=Yes, 1=No)
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Points Financed',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController
                                .pointsFinancedButton2.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController.pointsFinancedButton2.value = 0;
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'Yes',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController
                                .pointsFinancedButton2.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController.pointsFinancedButton2.value = 1;
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'No',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Closing cost
            CommonTextFieldHeaderModule(
                header: AppMessage.closingCost, required: true),
            const SizedBox(height: 5),

            TextFieldModule(
              fieldController:
                  homeScreenController.closingCosts2FieldController,
              hintText: "Closing Costs",
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              readOnly: true,
              keyboardType: TextInputType.number,
            ),

            //Radio Button Closing Costs Financed (0=Yes, 1=No)
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Closing Costs Financed',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController
                                .closingCostsFinancedButton2.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController
                                  .closingCostsFinancedButton2.value = 0;
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text('Yes'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController
                                .closingCostsFinancedButton2.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController
                                  .closingCostsFinancedButton2.value = 1;
                              homeScreenController.operatingExpensesFunction();
                            },
                          ),
                          const Text(
                            'No',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ).paddingAll(5),
    );
  }
}

//Annual cash flow analysis
class AnnualCashFlowAnalysis extends StatelessWidget {
  AnnualCashFlowAnalysis({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppMessage.annualCashFlowAnalysis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  fontSize: 14.sp),
            ).commonOnlyPadding(bottom: 5, top: 5),
          ),
          const CustomDivider(),

          Column(
            children: [
              TextRow(
                  title: 'Effective Gross Income',
                  subTitle:
                      '${homeScreenController.effectiveGrossIncome.value}',
                  suffix: '\$'),
              const SizedBox(
                height: 10,
              ),
              TextRow(
                  title: 'Operating Expenses',
                  subTitle: '${homeScreenController.operatingExpenses.value}',
                  suffix: '\$'),
              const SizedBox(
                height: 10,
              ),
              TextRow(
                  title: 'Net Operating Income',
                  subTitle: '${homeScreenController.netOperatingIncome.value}',
                  suffix: '\$'),
              const SizedBox(
                height: 10,
              ),
              TextRow(
                  title: 'Capitalization Rate',
                  subTitle: '${homeScreenController.capitalizationRate}',
                  suffix: '%'),
              const SizedBox(
                height: 10,
              ),
              TextRow(
                  title: 'Annual Debt Service',
                  subTitle: '${homeScreenController.annualDebtService.value}',
                  suffix: '\$'),
              const SizedBox(
                height: 10,
              ),
              TextRow(
                  title: 'Debt Coverage Ratio',
                  subTitle: '${homeScreenController.debtCoverageRatio}',
                  suffix: '%'),
              const SizedBox(
                height: 10,
              ),
              TextRow(
                  title: 'Annual Cash Flow',
                  subTitle: '${homeScreenController.annualCashFlow.value}',
                  suffix: '\$'),
              const SizedBox(
                height: 10,
              ),
              TextRow(
                  title: 'Total Out of Pocket',
                  subTitle: '${homeScreenController.totalOutPocket.value}',
                  suffix: '\$'),
              const SizedBox(
                height: 10,
              ),
              TextRow(
                  title: 'Return on Investment',
                  subTitle: '${homeScreenController.returnonInvestment.value}',
                  suffix: '%'),
            ],
          ).paddingOnly(left: 10, right: 10)
        ],
      ).paddingAll(5),
    );
  }
}

//Quick Flip Analysis
class QuickFlipAnalysis extends StatelessWidget {
  QuickFlipAnalysis({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppMessage.quickFlipAnalysis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  fontSize: 14.sp),
            ).commonOnlyPadding(bottom: 5, top: 5),
          ),
          const CustomDivider(),
          // const SizedBox(height: 10),

/*//Sales Price  - Purchase Price
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//Sales Price
                  CommonTextFieldHeaderModule(header: AppMessage.salesPrice, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.salesPriceTextFieldController,
                    hintText: AppMessage.salesPrice,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.salesPrice), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//Purchase Price
                  CommonTextFieldHeaderModule(header: AppMessage.purchasePrice, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.purchasePriceTextFieldController,
                    hintText: AppMessage.purchasePrice,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.purchasePrice), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
          const SizedBox(height: 10),

//Acquisition Costs - Carrying Costs
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Acquisition Costs
                    CommonTextFieldHeaderModule(header: AppMessage.acquisitionCosts, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController.acquisitionCostsTextFieldController,
                      hintText: AppMessage.acquisitionCosts,
                      validate: (value) =>
                          FieldValidation().validateAmount(value, AppMessage.acquisitionCosts), prifixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Text(
                        '\$',
                        style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ).commonOnlyPadding(right: 5),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Carrying Costs
                    CommonTextFieldHeaderModule(header: AppMessage.carryingCosts, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController.carryingCostsTextFieldController,
                      hintText: AppMessage.carryingCosts,
                      validate: (value) =>
                          FieldValidation().validateAmount(value, AppMessage.carryingCosts), prifixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Text(
                        '\$',
                        style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ).commonOnlyPadding(right: 5),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),

//Rehab Costs - Selling Expenses
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Rehab Costs
                    CommonTextFieldHeaderModule(header: AppMessage.rehabCosts, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController.rehabCostsTextFieldController,
                      hintText: AppMessage.rehabCosts,
                      validate: (value) =>
                          FieldValidation().validateAmount(value, AppMessage.rehabCosts), prifixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Text(
                        '\$',
                        style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ).commonOnlyPadding(right: 5),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Selling Expenses
                    CommonTextFieldHeaderModule(header: AppMessage.sellingExpenses, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController.sellingExpensesTextFieldController,
                      hintText: AppMessage.sellingExpenses,
                      validate: (value) =>
                          FieldValidation().validateAmount(value, AppMessage.sellingExpenses), prifixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Text(
                        '\$',
                        style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ).commonOnlyPadding(right: 5),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),


//Total Project Cost - Net Profit
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Total Project Cost
                    CommonTextFieldHeaderModule(header: AppMessage.totalProjectCost, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController.totalProjectCostTextFieldController,
                      hintText: AppMessage.totalProjectCost,
                      validate: (value) =>
                          FieldValidation().validateAmount(value, AppMessage.totalProjectCost), prifixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Text(
                        '\$',
                        style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ).commonOnlyPadding(right: 5),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Net Profit
                    CommonTextFieldHeaderModule(header: AppMessage.netProfit, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController.netProfitTextFieldController,
                      hintText: AppMessage.netProfit,
                      validate: (value) =>
                          FieldValidation().validateAmount(value, AppMessage.netProfit), prifixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Text(
                        '\$',
                        style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ).commonOnlyPadding(right: 5),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),


//Total Out of Pocket - Annualized ROI
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Total Out of Pocket
                    CommonTextFieldHeaderModule(header: AppMessage.totalOutOfPocket, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController.totalOutOfPocketTextFieldController,
                      hintText: AppMessage.totalOutOfPocket,
                      validate: (value) =>
                          FieldValidation().validateAmount(value, AppMessage.totalOutOfPocket), prifixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Text(
                        '\$',
                        style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ).commonOnlyPadding(right: 5),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Annualized ROI
                    CommonTextFieldHeaderModule(header: AppMessage.annualizedROI, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController.annualizedROITextFieldController,
                      hintText: AppMessage.annualizedROI,
                      validate: (value) =>
                          FieldValidation().validateAmount(value, AppMessage.annualizedROI), prifixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Text(
                        '\$',
                        style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ).commonOnlyPadding(right: 5),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),

                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),



list wise*/
          Column(
            children: [
              TextRow(
                  title: 'Sales Price',
                  subTitle: '${homeScreenController.salesPrice.value}',
                  suffix: '\$'),
              const SizedBox(
                height: 10,
              ),
              SubTextRow(
                title: 'Purchase Price',
                subTitle: '${homeScreenController.purchasePrice.value}',
                suffix: '\$',
              ),
              const SizedBox(
                height: 10,
              ),
              SubTextRow(
                title: 'Acquisition Costs',
                subTitle: '${homeScreenController.acquisitionCosts.value}',
                suffix: '\$',
              ),
              const SizedBox(
                height: 10,
              ),
              SubTextRow(
                title: 'Carrying Costs',
                subTitle: '${homeScreenController.carryingCosts.value}',
                suffix: '\$',
              ),
              const SizedBox(
                height: 10,
              ),
              SubTextRow(
                title: 'Rehab Costs',
                subTitle: '${homeScreenController.rehabCosts.value}',
                suffix: '\$',
              ),
              const SizedBox(
                height: 10,
              ),
              SubTextRow(
                title: 'Selling Expenses',
                subTitle: '${homeScreenController.sellingExpenses.value}',
                suffix: '\$',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomDivider(),
              TextRow(
                  title: 'Total Project Cost',
                  subTitle: '${homeScreenController.totalProjectCost.value}',
                  suffix: '\$'),
              const SizedBox(
                height: 10,
              ),
              TextRow(
                  title: 'Net Profit',
                  subTitle: '${homeScreenController.netProfit.value}',
                  suffix: '\$',
                  subTitleColor: AppColors.blackColor),
              const SizedBox(
                height: 10,
              ),
              const CustomDivider(),
              TextRow(
                  title: 'Total Out of Pocket',
                  subTitle: '${homeScreenController.totalOutOfPocket.value}',
                  suffix: '\$'),
              const SizedBox(
                height: 10,
              ),
              TextRow(
                  title: 'Annualized ROI',
                  subTitle: '${homeScreenController.annualizedROI.value}',
                  suffix: '\$'),
              const SizedBox(
                height: 10,
              ),
            ],
          ).paddingOnly(left: 10, right: 10),
        ],
      ).paddingAll(5),
    );
  }
}

class PropertyPurchaseDetails extends StatelessWidget {
  PropertyPurchaseDetails({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: AppColors.appColorsSecondry,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appColors.withOpacity(.7))),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Property Purchase Detail",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.appColors,
                  fontSize: 14.sp),
            ).commonOnlyPadding(bottom: 5, top: 10),
          ),
          const CustomDivider(),
          const SizedBox(
            height: 10,
          ),
          TextRow(
            title: 'Purchase Price',
            subTitle: '${homeScreenController.purchasePrice.value}',
            suffix: '\$',
          ),
          const SizedBox(
            height: 10,
          ),
          TextRow(
            title: 'Down Payment',
            subTitle: '${homeScreenController.downPayment.value}',
            suffix: '\$',
          ),
          const SizedBox(
            height: 10,
          ),
          TextRow(
            title: 'Closing Closts',
            subTitle: '${homeScreenController.closingClosts.value}',
            suffix: '\$',
          ),
          const SizedBox(
            height: 10,
          ),
          TextRow(
            title: 'Loan Points',
            subTitle: '${homeScreenController.loanPoints.value}',
            suffix: '\$',
          ),
          const SizedBox(
            height: 10,
          ),
          TextRow(
            title: 'Total Investment',
            subTitle: '${homeScreenController.totalInvestment.value}',
            suffix: '\$',
          ),
          const SizedBox(
            height: 10,
          ),
          TextRow(
            title: 'Expense Esclator',
            subTitle: '${homeScreenController.expenseEsclator.value}',
            suffix: '%',
          ),
          const SizedBox(
            height: 10,
          ),
          TextRow(
            title: 'Income Escalator',
            subTitle: '${homeScreenController.incomeEscalator.value}',
            suffix: '%',
          ),
        ],
      ).paddingAll(10),
    );
  }
}

// //Quick flip
/*class QuickFlip extends StatelessWidget {
  QuickFlip({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppMessage.quickFlip,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
                fontSize: 14.sp),
          ).commonOnlyPadding(bottom: 5, top: 20),
        ),
        const CustomDivider(),
        const SizedBox(height: 10),

//Purchase Price - Selling Costs
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//purchase Price
                  CommonTextFieldHeaderModule(header: AppMessage.purchasePrice, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.purchasePriceQFTextFieldController,
                    hintText: AppMessage.purchasePrice,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.purchasePrice), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//selling Costs
                  CommonTextFieldHeaderModule(header: AppMessage.sellingCosts, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.sellingCostsQFTextFieldController,
                    hintText: AppMessage.sellingCosts,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.sellingCosts), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),

//Out Of Pocket - Loan Cost
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//out Of Pocket
                  CommonTextFieldHeaderModule(header: AppMessage.outOfPocket, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.outOfPocketQFTextFieldController,
                    hintText: AppMessage.outOfPocket,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.outOfPocket), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//loan Cost
                  CommonTextFieldHeaderModule(header: AppMessage.loanCost, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.loanCostQFTextFieldController,
                    hintText: AppMessage.loanCost,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.loanCost), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),


//Total of Project - Annualized ROI
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//total Of Project
                  CommonTextFieldHeaderModule(header: AppMessage.totalOfProject, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.totalOfProjectQFTextFieldController,
                    hintText: AppMessage.totalOfProject,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.totalOfProject), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//annualizedROI
                  CommonTextFieldHeaderModule(header: AppMessage.annualizedROI, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.annualizedROIQFTextFieldController,
                    hintText: AppMessage.annualizedROI,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.annualizedROI), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),


//Carrying Cost - Sales Price
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//carrying Costs
                  CommonTextFieldHeaderModule(header: AppMessage.carryingCosts, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.carryingCostQFTextFieldController,
                    hintText: AppMessage.carryingCosts,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.carryingCosts), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//sales Price
                  CommonTextFieldHeaderModule(header: AppMessage.salesPrice, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.salesPriceQFTextFieldController,
                    hintText: AppMessage.salesPrice,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.salesPrice), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),

//Project cost - Net Profit
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//project Costs
                  CommonTextFieldHeaderModule(header: AppMessage.projectCosts, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.projectCostQFTextFieldController,
                    hintText: AppMessage.projectCosts,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.projectCosts), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//net Profit
                  CommonTextFieldHeaderModule(header: AppMessage.netProfit, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.netProfitQFTextFieldController,
                    hintText: AppMessage.netProfit,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.netProfit), prifixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Text(
                      '\$',
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),



      ],
    );
  }
}*/

//Long term cash flow

/*class LongTermCashFlow extends StatelessWidget {
   LongTermCashFlow({Key? key}) : super(key: key);
   final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppMessage.longTermCashFlow,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            fontSize: 14.sp),
      ).commonOnlyPadding(bottom: 5, top: 20),
    ),
    const CustomDivider(),
    const SizedBox(height: 10),

//Total Income - Operating Expense
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//total Income
                  CommonTextFieldHeaderModule(header: AppMessage.totalIncome , required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.totalIncomeLTCFTextFieldController,
                    hintText: AppMessage.totalIncome,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.totalIncome),
                  //   prifixIcon: Align(
                  //   widthFactor: 1.0,
                  //   heightFactor: 1.0,
                  //   child: Text(
                  //     '\$',
                  //     style:
                  //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//operating Expense
                  CommonTextFieldHeaderModule(header: AppMessage.operatingExpense, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.operatingExpenseLTCFTextFieldController,
                    hintText: AppMessage.operatingExpense,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.operatingExpense),
                  //   prifixIcon: Align(
                  //   widthFactor: 1.0,
                  //   heightFactor: 1.0,
                  //   child: Text(
                  //     '\$',
                  //     style:
                  //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),

//NOI -Capitalization Rate
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//noi
                  CommonTextFieldHeaderModule(header: AppMessage.noi, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.noiLTCFTextFieldController,
                    hintText: AppMessage.noi,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.noi),
                  //   prifixIcon: Align(
                  //   widthFactor: 1.0,
                  //   heightFactor: 1.0,
                  //   child: Text(
                  //     '\$',
                  //     style:
                  //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//capitalization Rate
                  CommonTextFieldHeaderModule(header: AppMessage.capitalizationRate, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.capitalizationRateLTCFTextFieldController,
                    hintText: AppMessage.capitalizationRate,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.capitalizationRate),
                  //   prifixIcon: Align(
                  //   widthFactor: 1.0,
                  //   heightFactor: 1.0,
                  //   child: Text(
                  //     '\$',
                  //     style:
                  //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),

//debitService - Annual Cash Flow
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//debitService
                  CommonTextFieldHeaderModule(header: AppMessage.debitService, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.debitServiceLTCFTextFieldController,
                    hintText: AppMessage.debitService,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.debitService),
                  //   prifixIcon: Align(
                  //   widthFactor: 1.0,
                  //   heightFactor: 1.0,
                  //   child: Text(
                  //     '\$',
                  //     style:
                  //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//annualCashFlow
                  CommonTextFieldHeaderModule(header: AppMessage.annualCashFlow, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.annualCashFlowLTCFTextFieldController,
                    hintText: AppMessage.annualCashFlow,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.annualCashFlow),
                  //   prifixIcon: Align(
                  //   widthFactor: 1.0,
                  //   heightFactor: 1.0,
                  //   child: Text(
                  //     '\$',
                  //     style:
                  //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),

// Total Out Of Pocket - ROI
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//total Out Of Pocket
                  CommonTextFieldHeaderModule(header: AppMessage.totalOutOfPocket, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.totalOutOfPocketLTCFTextFieldController,
                    hintText: AppMessage.totalOutOfPocket,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.totalOutOfPocket),
                  //   prifixIcon: Align(
                  //   widthFactor: 1.0,
                  //   heightFactor: 1.0,
                  //   child: Text(
                  //     '\$',
                  //     style:
                  //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//roi
                  CommonTextFieldHeaderModule(header: AppMessage.roi, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.roiLTCFTextFieldController,
                    hintText: AppMessage.roi,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.roi),
                  //   prifixIcon: Align(
                  //   widthFactor: 1.0,
                  //   heightFactor: 1.0,
                  //   child: Text(
                  //     '\$',
                  //     style:
                  //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),


    ]);
  }
}*/

// //Project Costs for 2page
/*class ProjectCosts2 extends StatelessWidget {
  ProjectCosts2({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppMessage.projectCosts,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            fontSize: 14.sp),
      ).commonOnlyPadding(bottom: 5, top: 20),
    ),
    const CustomDivider(),
    const SizedBox(height: 10),

//Wholesale Fees
        CommonTextFieldHeaderModule(header: AppMessage.wholesaleFees, required: true),
        const SizedBox(height: 5),
        TextFieldModule(
          fieldController: homeScreenController.wholesaleFeesPCTextFieldController,
          hintText: AppMessage.wholesaleFees,
          validate: (value) =>
              FieldValidation().validateAmount(value, AppMessage.wholesaleFees),
        //   prifixIcon: Align(
        //   widthFactor: 1.0,
        //   heightFactor: 1.0,
        //   child: Text(
        //     '\$',
        //     style:
        //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        //   ),
        // ).commonOnlyPadding(right: 5),
          keyboardType: TextInputType.number,
          backgroundColor: AppColors.whiteColor1,
        ),
        const SizedBox(height: 10),

// Rehab Costs
        CommonTextFieldHeaderModule(header: AppMessage.rehabCosts, required: true),
        const SizedBox(height: 5),
        TextFieldModule(
          fieldController: homeScreenController.rehabCostsPCTextFieldController,
          hintText: AppMessage.rehabCosts,
          validate: (value) =>
              FieldValidation().validateAmount(value, AppMessage.rehabCosts),
        //   prifixIcon: Align(
        //   widthFactor: 1.0,
        //   heightFactor: 1.0,
        //   child: Text(
        //     '\$',
        //     style:
        //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        //   ),
        // ).commonOnlyPadding(right: 5),
          keyboardType: TextInputType.number,
          backgroundColor: AppColors.whiteColor1,
        ),
      ]);
  }
}*/

// //Carrying Costs
/*class CarryingCosts extends StatelessWidget {
  CarryingCosts({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppMessage.carryingCosts,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            fontSize: 14.sp),
      ).commonOnlyPadding(bottom: 5, top: 20),
    ),
    const CustomDivider(),
    const SizedBox(height: 10),


//Taxes - Insurance
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//taxes
                  CommonTextFieldHeaderModule(header: AppMessage.taxes , required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.taxesCCTextFieldController,
                    hintText: AppMessage.taxes,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.taxes),
                  //   prifixIcon: Align(
                  //   widthFactor: 1.0,
                  //   heightFactor: 1.0,
                  //   child: Text(
                  //     '\$',
                  //     style:
                  //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//Insurance
                  CommonTextFieldHeaderModule(header: AppMessage.insurance, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.insuranceCCTextFieldController,
                    hintText: AppMessage.insurance,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.insurance),
                  //   prifixIcon: Align(
                  //   widthFactor: 1.0,
                  //   heightFactor: 1.0,
                  //   child: Text(
                  //     '\$',
                  //     style:
                  //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),

//loan - Utilities

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//
                  CommonTextFieldHeaderModule(header: AppMessage.loan, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.loanCCTextFieldController,
                    hintText: AppMessage.loan,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.loan),
                    //   prifixIcon: Align(
                    //   widthFactor: 1.0,
                    //   heightFactor: 1.0,
                    //   child: Text(
                    //     '\$',
                    //     style:
                    //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    //   ),
                    // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//
                  CommonTextFieldHeaderModule(header: AppMessage.utilities, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.utilitiesCCTextFieldController,
                    hintText: AppMessage.utilities,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.utilities),
                    //   prifixIcon: Align(
                    //   widthFactor: 1.0,
                    //   heightFactor: 1.0,
                    //   child: Text(
                    //     '\$',
                    //     style:
                    //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    //   ),
                    // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),

//Condo Fee's
        CommonTextFieldHeaderModule(header: AppMessage.condoFees, required: true),
        const SizedBox(height: 5),
        TextFieldModule(
          fieldController: homeScreenController.condoFeesCCTextFieldController,
          hintText: AppMessage.condoFees,
          validate: (value) =>
              FieldValidation().validateAmount(value, AppMessage.condoFees),
          //   prifixIcon: Align(
          //   widthFactor: 1.0,
          //   heightFactor: 1.0,
          //   child: Text(
          //     '\$',
          //     style:
          //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          //   ),
          // ).commonOnlyPadding(right: 5),
          keyboardType: TextInputType.number,
          backgroundColor: AppColors.whiteColor1,
        ),
      ]);
  }
}*/

// //Selling Costs
/*
class SellingCost extends StatelessWidget {
  SellingCost({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppMessage.sellingCosts,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            fontSize: 14.sp),
      ).commonOnlyPadding(bottom: 5, top: 20),
    ),
    const CustomDivider(),
    const SizedBox(height: 10),

//Agent Fees - Concessions
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//Agent Fees
                  CommonTextFieldHeaderModule(header: AppMessage.agentFees , required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.agentFeesSCTextFieldController,
                    hintText: AppMessage.agentFees,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.agentFees),
                    //   prifixIcon: Align(
                    //   widthFactor: 1.0,
                    //   heightFactor: 1.0,
                    //   child: Text(
                    //     '\$',
                    //     style:
                    //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    //   ),
                    // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//Concessions
                  CommonTextFieldHeaderModule(header: AppMessage.concessions, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.concessionsSCTextFieldController,
                    hintText: AppMessage.concessions,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.concessions),
                    //   prifixIcon: Align(
                    //   widthFactor: 1.0,
                    //   heightFactor: 1.0,
                    //   child: Text(
                    //     '\$',
                    //     style:
                    //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    //   ),
                    // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),

//Closing Cost - Advertising
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//Closing Cost
                  CommonTextFieldHeaderModule(header: AppMessage.closingCost, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.closingCostSCTextFieldController,
                    hintText: AppMessage.closingCost,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.closingCost),
                    //   prifixIcon: Align(
                    //   widthFactor: 1.0,
                    //   heightFactor: 1.0,
                    //   child: Text(
                    //     '\$',
                    //     style:
                    //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    //   ),
                    // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//Advertising
                  CommonTextFieldHeaderModule(header: AppMessage.advertising, required: true),
                  const SizedBox(height: 5),
                  TextFieldModule(
                    fieldController: homeScreenController.advertisingSCTextFieldController,
                    hintText: AppMessage.advertising,
                    validate: (value) =>
                        FieldValidation().validateAmount(value, AppMessage.advertising),
                    //   prifixIcon: Align(
                    //   widthFactor: 1.0,
                    //   heightFactor: 1.0,
                    //   child: Text(
                    //     '\$',
                    //     style:
                    //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    //   ),
                    // ).commonOnlyPadding(right: 5),
                    keyboardType: TextInputType.number,
                    backgroundColor: AppColors.whiteColor1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),


    ]);
  }
}
*/
