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
import '../../utils/decorations.dart';
import '../../utils/validator.dart';

// ignore: must_be_immutable
//Property Details
class PropertyDetails extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();
  String selectedLocation = '';

  PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Option 2
    return Form(
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
          ).paddingOnly(top: 10, bottom: 5),
          const CustomDivider(),
          const SizedBox(height: 10),
          // property Address
          CommonTextFieldHeaderModule(
              header: AppMessage.propertyAddress, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            hintText: AppMessage.propertyAddress,
            fieldController:
                homeScreenController.propertyAddressFieldController,
            keyboardType: TextInputType.streetAddress,
            validate: (value) => FieldValidation()
                .validateEmpty(value, AppMessage.propertyAddress),
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
                                  items: homeScreenController.stateDropDownList
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
                                          color: AppColors.appColors)),
                                  // Not necessary for Option 1
                                  // value: selectedLocation.isNotEmpty ?  selectedLocation: null ,
                                  onChanged: (newValue) {
                                    homeScreenController.citySelect.value =
                                        newValue!;
                                    homeScreenController.loadUI();
                                    print(newValue);
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
                      fieldController: homeScreenController.zipFieldController,
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
                      validate: (value) =>
                          FieldValidation().validateEmpty(value, 'lead source'),
                      keyboardType: TextInputType.multiline,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              ),
            ],
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
                        header: AppMessage.offerPrice, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController:
                          homeScreenController.offerPriceFieldController,
                      onChange: (val) {
                        homeScreenController.downPaymentAmountFunction();
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
                          homeScreenController.landValueFieldController,
                      hintText: 'Land Value',
                      validate: (value) =>
                          FieldValidation().validateAmount(value, 'land value'),
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
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).commonOnlyPadding(right: 5),
            keyboardType: TextInputType.number,
            backgroundColor: AppColors.whiteColor1,
          ),
          const SizedBox(height: 10),
          CommonTextFieldHeaderModule(
              header: AppMessage.howDidYouFindThisProperty, required: false),
          const SizedBox(height: 5),
          Container(
            width: Get.width,
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
                          style: const TextStyle(color: AppColors.appColors),
                        ),
                        // Not necessary for Option 1
                        // value: selectedLocation.isNotEmpty ?  selectedLocation: null ,
                        onChanged: (newValue) {
                          homeScreenController.stateSelect.value = newValue!;
                          homeScreenController.loadUI();
                          log(newValue);
                        },
                        items: homeScreenController.stateDropDownList
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
    );
  }
}

//Financial Details
class FinancialDetails extends StatelessWidget {
  FinancialDetails({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
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
          ).paddingOnly(top: 10, bottom: 5),
          const CustomDivider(),
          const SizedBox(height: 10),
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
              homeScreenController.vacancyandReplacementAmountFunction();
            },
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).commonOnlyPadding(right: 5),
          ),
          const SizedBox(
            height: 10,
          ),
//Property Mgmt % / Amt
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                        header: 'Property Mgmt % / Amt', required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController
                          .propertyManagementFeesPercentageFieldController,
                      onChange: (text) {
                        homeScreenController
                            .propertyManagementFeesAmountCountFunction();
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
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(header: '', required: false),
                    const SizedBox(height: 5),
                    TextFieldModule(
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
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

//Vacancy and Replacement Reserves Allowance % / Amt
          CommonTextFieldHeaderModule(
              header: 'Vacancy and Replacement Reserves Allowance % / Amt',
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
                        homeScreenController
                            .vacancyandReplacementAmountFunction();
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

          const SizedBox(
            height: 10,
          ),
//condo Association fees
          CommonTextFieldHeaderModule(
              header: AppMessage.condoAssociationFees, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.monthlyCondoFieldController,
            hintText: AppMessage.condoAssociationFees,
            validate: (value) => FieldValidation()
                .validateAmount(value, AppMessage.condoAssociationFees),
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
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
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
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
            keyboardType: TextInputType.number,
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
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
                      fieldController:
                          homeScreenController.monthlyInsuranceFieldController,
                      hintText: AppMessage.monthlyInsurance,
                      validate: (value) => FieldValidation()
                          .validateAmount(value, AppMessage.monthlyInsurance),
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
                      fieldController:
                          homeScreenController.mortgagePayment1FieldController,
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
                      fieldController:
                          homeScreenController.mortgagePayment2FieldController,
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
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).commonOnlyPadding(right: 5),
            keyboardType: TextInputType.number,
            backgroundColor: AppColors.whiteColor1,
          ),
        ],
      ),
    );
  }
}

//project Costs
class ProjectCosts extends StatelessWidget {
  ProjectCosts({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
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
            ).paddingOnly(top: 20, bottom: 5),
          ),
          const CustomDivider(),
          const SizedBox(height: 10),

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
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
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
            validate: (value) =>
                FieldValidation().validateAmount(value, 'rehab costs financed'),
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).commonOnlyPadding(right: 5),
            keyboardType: TextInputType.number,
            backgroundColor: AppColors.whiteColor1,
          ),
        ],
      ),
    );
  }
}

//acquisition cost
class AcquisitionCosts extends StatelessWidget {
  AcquisitionCosts({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
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
            ).commonOnlyPadding(bottom: 5, top: 20),
          ),
          const CustomDivider(),
          const SizedBox(height: 10),
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
                      validate: (value) =>
                          FieldValidation().validateAmount(value, 'inspection'),
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
                      fieldController:
                          homeScreenController.wholesaleFeeCostsFieldController,
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
    );
  }
}

//1st Mortgage Details
class MortgageDetails1 extends StatelessWidget {
  MortgageDetails1({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
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
            ).commonOnlyPadding(bottom: 5, top: 20),
          ),
          const CustomDivider(),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Mortgage Term(month)
                    CommonTextFieldHeaderModule(
                        header: AppMessage.mortgageTermMonths, required: true),
                    const SizedBox(height: 5),

                    TextFieldModule(
                      fieldController: homeScreenController
                          .mortgageTermMonthsFieldController,
                      hintText: AppMessage.mortgageTermMonths,
                      validate: (value) => FieldValidation()
                          .validateAmount(value, 'mortgage term (months)'),
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
//expected holding term
                    CommonTextFieldHeaderModule(
                        header: AppMessage.expectedHoldingTerm, required: true),
                    const SizedBox(height: 5),

                    TextFieldModule(
                      fieldController: homeScreenController
                          .expectedHoldingTermFieldController,
                      hintText: AppMessage.expectedHoldingTerm,
                      validate: (value) => FieldValidation()
                          .validateAmount(value, 'expected holding term'),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

//Payments Per Year
          CommonTextFieldHeaderModule(
              header: AppMessage.paymentsPerYear, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController:
                homeScreenController.paymentsPerYearFieldController,
            hintText: AppMessage.paymentsPerYear,
            validate: (value) =>
                FieldValidation().validateAmount(value, 'payments per year'),
            keyboardType: TextInputType.number,
            backgroundColor: AppColors.whiteColor1,
          ),

          const SizedBox(height: 10),

//Down Payment % / Amt.
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Down Payment Percentage
                    CommonTextFieldHeaderModule(
                        header: AppMessage.downPaymentPerAmt, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController
                          .downPaymentPercentageFieldController,
                      hintText: AppMessage.downPaymentPercentage,
                      validate: (value) => FieldValidation()
                          .validateAmount(value, 'down payment percentage'),
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '%',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).commonOnlyPadding(right: 5),
                      onChange: (val) {
                        homeScreenController.downPaymentAmountFunction();
                        homeScreenController.financedAmountFunction();
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
//Down Payment Amount
                    CommonTextFieldHeaderModule(header: '', required: false),
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
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).commonOnlyPadding(right: 5),
                      hintText: "Down Payment Amount",
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

//Financed Amount
          CommonTextFieldHeaderModule(
              header: AppMessage.financedAmount, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.financedAmountFieldController,
            readOnly: true,
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).commonOnlyPadding(right: 5),
            hintText: AppMessage.financedAmount,
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 10),
//Interest Rate
          CommonTextFieldHeaderModule(
              header: AppMessage.interestRate, required: true),

          Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  CommonTextFieldHeaderModule(
                      header: AppMessage.interestOnly, required: false),
                  Obx(
                    () => Checkbox(
                      checkColor: Colors.white,
                      // fillColor: App,
                      value: homeScreenController.interestOnlyButton.value == 0
                          ? true
                          : false,
                      onChanged: (bool? value) {
                        homeScreenController.interestOnlyButton.value =
                            value! ? 0 : 1;
                      },
                    ),
                  ),
                ],
              )),
              const SizedBox(width: 5),
              Expanded(
                  child: TextFieldModule(
                fieldController:
                    homeScreenController.interestRateFieldController,
                hintText: AppMessage.interestRate,
                validate: (value) =>
                    FieldValidation().validateAmount(value, 'interest rate'),
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
              )),
            ],
          ),
          const SizedBox(height: 10),
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
            },
            prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '%',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).commonOnlyPadding(right: 5),
            keyboardType: TextInputType.number,
            backgroundColor: AppColors.whiteColor1,
          ),
          const SizedBox(height: 10),

//radioButton Points Financed (0=Yes, 1=No)
          Row(
            children: [
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                        header: 'Points Financed', required: true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: homeScreenController
                                  .pointsFinancedButton.value,
                              groupValue: 0,
                              onChanged: (val) {
                                homeScreenController
                                    .pointsFinancedButton.value = 0;
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
                                  .pointsFinancedButton.value,
                              groupValue: 1,
                              onChanged: (val) {
                                homeScreenController
                                    .pointsFinancedButton.value = 1;
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
              const Expanded(child: SizedBox()),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

//points Amount & %
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                        header: "Points Amount / %", required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController:
                          homeScreenController.pointsAmountFieldController,
                      hintText: "Points Amount",
                      readOnly: true,
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
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(header: '', required: false),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController:
                          homeScreenController.pointsPercentageFieldController,
                      hintText: "Points percentage",
                      readOnly: true,
                      // backgroundColor: AppColors.whiteColor1,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

//Closing Costs Financed
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                        header: 'Closing Costs Financed', required: true),
                    const SizedBox(height: 5),
//Radio Button Closing Costs Financed (0=Yes, 1=No)
                    Obx(
                      () => Row(
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
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Closing Costs
                    CommonTextFieldHeaderModule(
                        header: 'Closing Costs', required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController:
                          homeScreenController.closingCostsFieldController,
                      hintText: "Closing Costs",
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
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
//Finance type drop down
          CommonTextFieldHeaderModule(header: 'Finance Type', required: true),
          const SizedBox(height: 5),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
                //)<CategoryTypeData>(
                isExpanded: true,
                decoration: dropdownInputDecoration,
                hint: Text(
                  "Select Finance Type",
                  style: const TextStyle(color: AppColors.appColors),
                ),
                // value: singleItem.categoryTypeDataValue,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   if(value!.category == "Select Account Category") {
                //     return "Please select payment";
                //   }
                //   return null;
                // },
                onChanged: (newValue) async {
                  // singleItem.categoryTypeDataValue = newValue!;
                  // // loadUI getting from controller
                  // billManageScreenController.loadUI();
                },
                // Getting From Controller
                items: []
                // billManageScreenController.categoryTypeList.map((value) {
                //                       return DropdownMenuItem<CategoryTypeData>(
                //                         value: value,
                //                         child: Text(value.category!),
                //                       );
                //                     }).toList(),
                ),
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Preferred Rate of Return
                    CommonTextFieldHeaderModule(
                        header: AppMessage.preferredRateOfReturn,
                        required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController
                          .preferredRateOfReturnFieldController,
                      hintText: "Preferred Rate of Return",
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).commonOnlyPadding(right: 5),
                      // readOnly: true,
                      backgroundColor: AppColors.whiteColor1,
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
//offer Price
                    CommonTextFieldHeaderModule(
                        header: AppMessage.offerPrice, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController
                          .offerPriceMortgageFieldController,
                      hintText: AppMessage.offerPrice,
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).commonOnlyPadding(right: 5),
                      // readOnly: true,
                      backgroundColor: AppColors.whiteColor1,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//2nd Mortgage Details
class MortgageDetails2 extends StatelessWidget {
  MortgageDetails2({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
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
            ).commonOnlyPadding(bottom: 5, top: 20),
          ),
          const CustomDivider(),
          const SizedBox(height: 10),
//mortgage term & Expected Holding Term
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//mortgage term
                    CommonTextFieldHeaderModule(
                        header: AppMessage.mortgageTermMonths, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController
                          .mortgageTermMonths2FieldController,
                      hintText: AppMessage.mortgageTermMonths,
                      validate: (value) => FieldValidation()
                          .validateAmount(value, 'mortgage term (months)'),
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
//Expected Holding Term
                    CommonTextFieldHeaderModule(
                        header: AppMessage.expectedHoldingTerm, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController: homeScreenController
                          .expectedHoldingTerm2FieldController,
                      hintText: AppMessage.expectedHoldingTerm,
                      validate: (value) => FieldValidation().validateAmount(
                          value, AppMessage.expectedHoldingTerm),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

//Payments Per Year / 2nd Mortgage Amount
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //payments Per Year
                    CommonTextFieldHeaderModule(
                        header: AppMessage.paymentsPerYear, required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController:
                          homeScreenController.paymentsPerYear2FieldController,
                      hintText: AppMessage.paymentsPerYear,
                      validate: (value) => FieldValidation()
                          .validateAmount(value, 'payments per year'),
                      keyboardType: TextInputType.number,
                      backgroundColor: AppColors.whiteColor1,
                      prifixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).commonOnlyPadding(right: 5),
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
                        header: '2nd Mortgage Amount', required: true),
                    const SizedBox(height: 5),
                    TextFieldModule(
                      fieldController:
                          homeScreenController.mortgageAmount2FieldController,
                      hintText: "2nd Mortgage Amount",
                      validate: (value) => FieldValidation()
                          .validateAmount(value, '2nd mortgage amount'),
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
            ],
          ),
          const SizedBox(height: 10),
//Financed Amount
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
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).commonOnlyPadding(right: 5),
            onChange: (val) {
              homeScreenController.pointsAmountFunction2();
            },
            hintText: "Financed Amount",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 10,
          ),
//Interest Rate
          CommonTextFieldHeaderModule(
              header: AppMessage.interestRate, required: true),
          Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  //Interest Chak Box button
                  CommonTextFieldHeaderModule(
                      header: AppMessage.interestOnly, required: false),
                  Obx(
                    () => Checkbox(
                      checkColor: Colors.white,
                      // fillColor: App,
                      value: homeScreenController.interestOnlyButton2.value == 0
                          ? true
                          : false,
                      onChanged: (bool? value) {
                        homeScreenController.interestOnlyButton2.value =
                            value! ? 0 : 1;
                      },
                    ),
                  ),
                ],
              )),
              const SizedBox(width: 5),
              Expanded(
                  child: TextFieldModule(
                fieldController:
                    homeScreenController.interestRate2FieldController,
                hintText: "Interest Rate",
                validate: (value) =>
                    FieldValidation().validateAmount(value, 'interest rate'), prifixIcon: Align(
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
              )),
            ],
          ),
          const SizedBox(height: 10),
//<<<<<<<<<<<<<<<<

//radioButton Points Financed (0=Yes, 1=No)
          CommonTextFieldHeaderModule(
              header: AppMessage.pointsFinanced, required: true),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value:
                              homeScreenController.pointsFinancedButton2.value,
                          groupValue: 0,
                          onChanged: (val) {
                            homeScreenController.pointsFinancedButton2.value =
                                0;
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
                              homeScreenController.pointsFinancedButton2.value,
                          groupValue: 1,
                          onChanged: (val) {
                            homeScreenController.pointsFinancedButton2.value =
                                1;
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
          const SizedBox(
            height: 10,
          ),

          CommonTextFieldHeaderModule(
              header: 'Points Amt. / %', required: true),
          const SizedBox(height: 5),
//Points Amt & Percentage
          Row(
            children: [
              Expanded(
                  child: TextFieldModule(
                fieldController:
                    homeScreenController.pointsAmount2FieldController,
                hintText: "Points Amount", prifixIcon: Align(
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
              )),
              const SizedBox(width: 5),
              Expanded(
                  child: TextFieldModule(
                fieldController:
                    homeScreenController.loanPoints2FieldController,
                hintText: "Points Percentage",
                onChange: (val) {
                  homeScreenController.pointsAmountFunction2();
                }, prifixIcon: Align(
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
              )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          //Closing Costs Financed
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFieldHeaderModule(
                        header: 'Closing Costs Financed', required: true),
                    const SizedBox(height: 5),

//Radio Button Closing Costs Financed (0=Yes, 1=No)
                    Obx(
                      () => Row(
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
                                    .closingCostsFinancedButton2.value,
                                groupValue: 1,
                                onChanged: (val) {
                                  homeScreenController
                                      .closingCostsFinancedButton2.value = 1;
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
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Closing Costs
                    CommonTextFieldHeaderModule(
                        header: 'Closing Costs', required: true),
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
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ).commonOnlyPadding(right: 5),
                      readOnly: true,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//Annual cash flow analysis
class AnnualCashFlowAnalysis extends StatelessWidget {
  AnnualCashFlowAnalysis({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
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
            ).commonOnlyPadding(bottom: 5, top: 20),
          ),
          const CustomDivider(),
          const SizedBox(height: 10),
//Effective Gross Income
          CommonTextFieldHeaderModule(header: AppMessage.effectiveGrossIncome, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.effectiveGrossIncomeTextFieldController,
            hintText: AppMessage.effectiveGrossIncome,
            validate: (value) =>
                FieldValidation().validateAmount(value,AppMessage.effectiveGrossIncome ), prifixIcon: Align(
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
//Operating Expenses
          CommonTextFieldHeaderModule(header: AppMessage.operatingExpenses, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.operatingExpensesTextFieldController,
            hintText: AppMessage.operatingExpenses,
            validate: (value) =>
                FieldValidation().validateAmount(value, AppMessage.operatingExpenses), prifixIcon: Align(
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

//Net Operating Income
          CommonTextFieldHeaderModule(header: AppMessage.netOperatingIncome, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.netOperatingIncomeTextFieldController,
            hintText: AppMessage.netOperatingIncome,
            validate: (value) =>
                FieldValidation().validateAmount(value, AppMessage.netOperatingIncome), prifixIcon: Align(
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

//Capitalization Rate
          CommonTextFieldHeaderModule(header: AppMessage.capitalizationRate, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.capitalizationRateTextFieldController,
            hintText: AppMessage.capitalizationRate,
            validate: (value) =>
                FieldValidation().validateAmount(value, AppMessage.capitalizationRate), prifixIcon: Align(
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

//Annual Debt Service
          CommonTextFieldHeaderModule(header: AppMessage.annualDebtService, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.annualDebtServiceTextFieldController,
            hintText: AppMessage.annualDebtService,
            validate: (value) =>
                FieldValidation().validateAmount(value,AppMessage.annualDebtService ), prifixIcon: Align(
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

//Debt Coverage Ratio
          CommonTextFieldHeaderModule(header: AppMessage.debtCoverageRatio, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.debtCoverageRatioTextFieldController,
            hintText: AppMessage.debtCoverageRatio,
            validate: (value) =>
                FieldValidation().validateAmount(value, AppMessage.debtCoverageRatio), prifixIcon: Align(
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

//Annual Cash Flow
          CommonTextFieldHeaderModule(header: AppMessage.annualCashFlow, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.annualCashFlowTextFieldController,
            hintText: AppMessage.annualCashFlow,
            validate: (value) =>
                FieldValidation().validateAmount(value,AppMessage.annualCashFlow ), prifixIcon: Align(
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


//Total Out of Pocket
          CommonTextFieldHeaderModule(header: AppMessage.totalOutOfPocket, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.totalOutPocketTextFieldController,
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
          const SizedBox(height: 10),

//Return on Investment
          CommonTextFieldHeaderModule(header: AppMessage.returnOnInvestment, required: true),
          const SizedBox(height: 5),
          TextFieldModule(
            fieldController: homeScreenController.returnOnInvestmentTextFieldController,
            hintText: AppMessage.returnOnInvestment,
            validate: (value) =>
                FieldValidation().validateAmount(value,AppMessage.returnOnInvestment ), prifixIcon: Align(
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


          // Column(
          //   children: [
          //     TextRow(
          //         title: 'Effective Gross Income',
          //         subTitle:
          //             '${homeScreenController.effectiveGrossIncome.value}',
          //         suffix: '\$'),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     TextRow(
          //         title: 'Operating Expenses',
          //         subTitle: '${homeScreenController.operatingExpenses.value}',
          //         suffix: '\$'),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     TextRow(
          //         title: 'Net Operating Income',
          //         subTitle: '${homeScreenController.netOperatingIncome.value}',
          //         suffix: '\$'),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     TextRow(
          //         title: 'Capitalization Rate',
          //         subTitle: '${homeScreenController.capitalizationRate}',
          //         suffix: '%'),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     TextRow(
          //         title: 'Annual Debt Service',
          //         subTitle: '${homeScreenController.annualDebtService.value}',
          //         suffix: '\$'),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     TextRow(
          //         title: 'Debt Coverage Ratio',
          //         subTitle: '${homeScreenController.debtCoverageRatio}',
          //         suffix: '%'),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     TextRow(
          //         title: 'Annual Cash Flow',
          //         subTitle: '${homeScreenController.annualCashFlow.value}',
          //         suffix: '\$'),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     TextRow(
          //         title: 'Total Out of Pocket',
          //         subTitle: '${homeScreenController.totalOutPocket.value}',
          //         suffix: '\$'),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     TextRow(
          //         title: 'Return on Investment',
          //         subTitle: '${homeScreenController.returnonInvestment.value}',
          //         suffix: '%'),
          //   ],
          // ).paddingOnly(left: 10, right: 10)
        ],
      );
  }
}


//Quick Flip Analysis
class QuickFlipAnalysis extends StatelessWidget {
  QuickFlipAnalysis({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
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
          ).commonOnlyPadding(bottom: 5, top: 20),
        ),
        const CustomDivider(),
        const SizedBox(height: 10),

//Sales Price  - Purchase Price
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





//list wise
//         Column(
//           children: [
//             TextRow(
//                 title: 'Sales Price',
//                 subTitle: '${homeScreenController.salesPrice.value}',
//                 suffix: '\$'),
//             const SizedBox(
//               height: 10,
//             ),
//             SubTextRow(
//               title: 'Purchase Price',
//               subTitle: '${homeScreenController.purchasePrice.value}',
//               suffix: '\$',
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SubTextRow(
//               title: 'Acquisition Costs',
//               subTitle: '${homeScreenController.acquisitionCosts.value}',
//               suffix: '\$',
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SubTextRow(
//               title: 'Carrying Costs',
//               subTitle: '${homeScreenController.carryingCosts.value}',
//               suffix: '\$',
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SubTextRow(
//               title: 'Rehab Costs',
//               subTitle: '${homeScreenController.rehabCosts.value}',
//               suffix: '\$',
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SubTextRow(
//               title: 'Selling Expenses',
//               subTitle: '${homeScreenController.sellingExpenses.value}',
//               suffix: '\$',
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const CustomDivider(),
//             TextRow(
//                 title: 'Total Project Cost',
//                 subTitle: '${homeScreenController.totalProjectCost.value}',
//                 suffix: '\$'),
//             const SizedBox(
//               height: 10,
//             ),
//             TextRow(
//                 title: 'Net Profit',
//                 subTitle: '${homeScreenController.netProfit.value}',
//                 suffix: '\$',
//                 subTitleColor: AppColors.blackColor),
//             const SizedBox(
//               height: 10,
//             ),
//             const CustomDivider(),
//             TextRow(
//                 title: 'Total Out of Pocket',
//                 subTitle: '${homeScreenController.totalOutofPocket.value}',
//                 suffix: '\$'),
//             const SizedBox(
//               height: 10,
//             ),
//             TextRow(
//                 title: 'Annualized ROI',
//                 subTitle: '${homeScreenController.annualizedROI.value}',
//                 suffix: '\$'),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ).paddingOnly(left: 10,right: 10),
      ],
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


//Quick flip
class QuickFlip extends StatelessWidget {
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
        const SizedBox(height: 10),



      ],
    );
  }
}
