import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/common_textfield.dart';
import '../../common_modules/common_textfield_header_module.dart';
import '../../common_modules/divider.dart';
import '../../common_modules/text_row.dart';
import '../../constants/colors.dart';
import '../../controller/deal_analyzer_screen_controller.dart';
import '../../utils/messaging.dart';
import '../../utils/validator.dart';


//Property Details
class PropertyDetails extends StatelessWidget {
  final homeScreenController = Get.find<DealAnalyzerScreenController>();
  // String selectedLocation = '';

  PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Option 2
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
                              log("$newValue");
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
            ).paddingOnly(right: 5),
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
                      ).paddingOnly(right: 5),
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
                      ).paddingOnly(right: 5),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

        ],
      ).paddingAll(5),
    );
  }
}

//Financial Details
class FinancialDetails extends StatelessWidget {
  FinancialDetails({Key? key}) : super(key: key);
  final homeScreenController = Get.find<DealAnalyzerScreenController>();

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
              homeScreenController.propertyManagementFeesAmountCountFunction();
              homeScreenController.vacancyAndReplacementAmountFunction();
              homeScreenController.calculateAnnualCashAnalysis();
            },
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
                    // homeScreenController.effectiveGrossIncomeFunction();
                    homeScreenController.calculateAnnualCashAnalysis();
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
                  ).paddingOnly(right: 5),
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
                  ).paddingOnly(right: 5),
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
                        // homeScreenController.operatingExpensesFunction();
                        homeScreenController.calculateAnnualCashAnalysis();
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
                      ).paddingOnly(right: 5),
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
                      ).paddingOnly(right: 5),
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
              // homeScreenController.operatingExpensesFunction();
              homeScreenController.calculateAnnualCashAnalysis();
            },
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).paddingOnly(right: 5),
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
              // homeScreenController.operatingExpensesFunction();
              homeScreenController.calculateAnnualCashAnalysis();
            },
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).paddingOnly(right: 5),
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
              // homeScreenController.operatingExpensesFunction();
              homeScreenController.calculateAnnualCashAnalysis();
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
            ).paddingOnly(right: 5),
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
                        // homeScreenController.operatingExpensesFunction();
                        homeScreenController.calculateAnnualCashAnalysis();
                      },
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).paddingOnly(right: 5),
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
                        // homeScreenController.operatingExpensesFunction();
                        homeScreenController.calculateAnnualCashAnalysis();
                      },
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).paddingOnly(right: 5),
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
                      readOnly: true,
                      validate: (value) => FieldValidation()
                          .validateAmount(value, '1st mortgage payment'),
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).paddingOnly(right: 5),
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
                        header: '2 nd Mortgage Payment', required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController
                          .mortgagePayment2FieldController,
                      hintText: '2 nd Mortgage Payment',
                      readOnly: true,
                      validate: (value) => FieldValidation()
                          .validateAmount(value, '2nd mortgage payment'),
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).paddingOnly(right: 5),
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
              // homeScreenController.operatingExpensesFunction();
              homeScreenController.calculateAnnualCashAnalysis();
            },
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).paddingOnly(right: 5),
            keyboardType: TextInputType.number,
            backgroundColor: AppColors.whiteColor1,
          ),
        ],
      ).paddingAll(5),
    );
  }
}

//project Costs
class ProjectCosts extends StatelessWidget {
  ProjectCosts({Key? key}) : super(key: key);
  final homeScreenController = Get.find<DealAnalyzerScreenController>();

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
            onChange: (value) {
              homeScreenController.calculateQuickFLipAnalysis();
            },
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).paddingOnly(right: 5),
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
            ).paddingOnly(right: 5),
            keyboardType: TextInputType.number,
            backgroundColor: AppColors.whiteColor1,
          ),
        ],
      ).paddingAll(5),
    );
  }
}

//acquisition cost
class AcquisitionCosts extends StatelessWidget {
  AcquisitionCosts({Key? key}) : super(key: key);
  final homeScreenController = Get.find<DealAnalyzerScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
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
            ).paddingOnly(bottom: 5, top: 5),
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
                      onChange: (value) {
                        homeScreenController.calculateQuickFLipAnalysis();
                      },
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).paddingOnly(right: 5),
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
                      onChange: (value) {
                        homeScreenController.calculateQuickFLipAnalysis();
                      },
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).paddingOnly(right: 5),
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
                      onChange: (value) {
                        homeScreenController.calculateQuickFLipAnalysis();
                      },
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).paddingOnly(right: 5),
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
                      onChange: (value) {
                        homeScreenController.calculateQuickFLipAnalysis();
                      },
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).paddingOnly(right: 5),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(5),
    );
  }
}

//1st Mortgage Details
class MortgageDetails1 extends StatelessWidget {
  MortgageDetails1({Key? key}) : super(key: key);
  final homeScreenController = Get.find<DealAnalyzerScreenController>();

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
              "1st Mortgage Details",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  fontSize: 14.sp),
            ).paddingOnly(bottom: 5, top: 5),
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
            ).paddingOnly(right: 5),
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
                      ).paddingOnly(right: 5),
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
                      ).paddingOnly(right: 5),
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
            ).paddingOnly(right: 5),
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
                            // homeScreenController.operatingExpensesFunction();
                            homeScreenController.calculateAnnualCashAnalysis();
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
                            // homeScreenController.operatingExpensesFunction();
                            homeScreenController.calculateAnnualCashAnalysis();
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
            ).paddingOnly(right: 5),
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
              homeScreenController.calculateQuickFLipAnalysis();
            },
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).paddingOnly(right: 5),
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
                            // homeScreenController.operatingExpensesFunction();
                            homeScreenController.calculateAnnualCashAnalysis();
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
                            // homeScreenController.operatingExpensesFunction();
                            homeScreenController.calculateAnnualCashAnalysis();
                            homeScreenController.calculateQuickFLipAnalysis();
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
              homeScreenController.calculateQuickFLipAnalysis();
            },
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).paddingOnly(right: 5),
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
                            // homeScreenController.operatingExpensesFunction();
                            homeScreenController.calculateAnnualCashAnalysis();
                            homeScreenController.calculateQuickFLipAnalysis();
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
                            // homeScreenController.operatingExpensesFunction();
                            homeScreenController.calculateAnnualCashAnalysis();
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
      ).paddingAll(5),
    );
  }
}

//2nd Mortgage Details
class MortgageDetails2 extends StatelessWidget {
  MortgageDetails2({Key? key}) : super(key: key);
  final homeScreenController = Get.find<DealAnalyzerScreenController>();

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
              "2st Mortgage Details",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  fontSize: 14.sp),
            ).paddingOnly(bottom: 5, top: 5),
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
            ).paddingOnly(right: 5),
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
                      ).paddingOnly(right: 5),
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
                      ).paddingOnly(right: 5),
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
                            homeScreenController.calculateAnnualCashAnalysis();
                            // homeScreenController.operatingExpensesFunction();
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
                            // homeScreenController.operatingExpensesFunction();
                            homeScreenController.calculateAnnualCashAnalysis();
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
              homeScreenController.calculateAnnualCashAnalysis();
            },
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '%',
                style:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).paddingOnly(right: 5),
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
            ).paddingOnly(right: 5),
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
                            homeScreenController.calculateAnnualCashAnalysis();
                            homeScreenController.calculateQuickFLipAnalysis();
                            // homeScreenController.operatingExpensesFunction();
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
                            // homeScreenController.operatingExpensesFunction();
                            homeScreenController.calculateAnnualCashAnalysis();
                            homeScreenController.calculateQuickFLipAnalysis();
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
            ).paddingOnly(right: 5),
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
                            homeScreenController.calculateAnnualCashAnalysis();
                            homeScreenController.calculateQuickFLipAnalysis();
                            // homeScreenController.operatingExpensesFunction();
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
                            // homeScreenController.operatingExpensesFunction();
                            homeScreenController.calculateAnnualCashAnalysis();
                            homeScreenController.calculateQuickFLipAnalysis();
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
      ).paddingAll(5),
    );
  }
}

//Annual cash flow analysis
class AnnualCashFlowAnalysis extends StatelessWidget {
  AnnualCashFlowAnalysis({Key? key}) : super(key: key);
  final homeScreenController = Get.find<DealAnalyzerScreenController>();

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
            ).paddingOnly(bottom: 5, top: 5),
          ),
          const CustomDivider(),

          Column(
            children: [
              TextRow(
                  title: 'Effective Gross Income',
                  subTitle:
                  '${homeScreenController.effectiveGrossIncome.value}',
                  suffix: '\$'),
              const SizedBox(height: 10),
              TextRow(
                  title: 'Operating Expenses',
                  subTitle: '${homeScreenController.operatingExpenses.value}',
                  suffix: '\$'),
              const SizedBox(height: 10),
              TextRow(
                  title: 'Net Operating Income',
                  subTitle: '${homeScreenController.netOperatingIncome.value}',
                  suffix: '\$'),
              const SizedBox(height: 10),
              TextRow(
                  title: 'Capitalization Rate',
                  subTitle: '${homeScreenController.capitalizationRate}',
                  suffix: '%'),
              const SizedBox(height: 10),
              TextRow(
                  title: 'Annual Debt Service',
                  subTitle: '${homeScreenController.annualDebtService.value}',
                  suffix: '\$'),
              const SizedBox(height: 10),
              TextRow(
                  title: 'Debt Coverage Ratio',
                  subTitle: '${homeScreenController.debtCoverageRatio}',
                  suffix: '%'),
              const SizedBox(height: 10),
              TextRow(
                  title: 'Annual Cash Flow',
                  subTitle: '${homeScreenController.annualCashFlow.value}',
                  suffix: '\$'),
              const SizedBox(height: 10),
              TextRow(
                  title: 'Total Out of Pocket',
                  subTitle: '${homeScreenController.totalOutPocket.value}',
                  suffix: '\$'),
              const SizedBox(height: 10),
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
  final homeScreenController = Get.find<DealAnalyzerScreenController>();

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
            ).paddingOnly(bottom: 5, top: 5),
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


