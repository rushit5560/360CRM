
import 'dart:developer';

import 'package:crm_project/common_modules/divider.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/constants/extension.dart';
import 'package:crm_project/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:crm_project/common_modules/common_textfield.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/text_row.dart';
import '../../utils/validator.dart';

// ignore: must_be_immutable
class PropertyDetails extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();
  String selectedLocation = '';

  PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Option 2
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appColorsSecondry,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appColors.withOpacity(.7))
      ),
      child: Form(
        key: homeScreenController.propertyDetailsKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Property Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColors,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 20, top: 10),
            ),
            TextFieldModule(
              hintText: "Property Address",
              fieldController:
                  homeScreenController.propertyAddressFieldController,
              keyboardType: TextInputType.streetAddress,
              validate: (value) =>
                  FieldValidation().validateEmpty(value,'property address'),
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "State",
                        style: TextStyle(color: AppColors.appColors),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        width: Get.width*.5,
                        decoration: BoxDecoration(
                          // color: AppColors.appColors,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.appColors)),
                        child: Obx(
                              () => homeScreenController.isLoading.value
                              ? Container()
                              : DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text(homeScreenController.stateSelect.value,style: const TextStyle(color: AppColors.appColors),),
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
                                  child:  Text(location),
                                );
                              }).toList(),
                            ),
                          ),
                        ).paddingOnly(left: 5,right: 5),
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
                      const Text(
                        "City",
                        style: TextStyle(color: AppColors.appColors),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        width: Get.width*.5,
                          decoration: BoxDecoration(
                            // color: AppColors.appColors,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.appColors)),
                        child: Obx(
                          () => homeScreenController.isLoading.value
                              ? Container()
                              : DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    hint: Text(homeScreenController.citySelect.value,style: const TextStyle(color: AppColors.appColors)),
                                    // Not necessary for Option 1
                                    // value: selectedLocation.isNotEmpty ?  selectedLocation: null ,
                                    onChanged: (newValue) {
                                      homeScreenController.citySelect.value = newValue!;
                                      homeScreenController.loadUI();
                                      print(newValue);
                                    },
                                    items: homeScreenController.cityDropDownList
                                        .map((location) {
                                      return DropdownMenuItem(
                                        value: location,
                                        child:  Text(location),
                                      );
                                    }).toList(),
                                  ),
                              ),
                        ).paddingOnly(left: 5,right: 5),
                      ),
                    ],
                  ),
                )

              ],
            ),
            const SizedBox(height: 20),
            TextFieldModule(
              hintText: "Zip",
              fieldController: homeScreenController.zipFieldController,
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
              validate: (value) =>
                  FieldValidation().validateZip(value!),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldModule(
              fieldController: homeScreenController.leadSourceFieldController,
              hintText: "Lead Source",
              validate: (value) => FieldValidation().validateEmpty(value, 'lead source'),

              keyboardType: TextInputType.multiline,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(height: 20),
            TextFieldModule(
              fieldController:
                  homeScreenController.expectedAfterRepairValueFieldController,
              hintText: 'Expected After Repair Value',
              validate: (value) => FieldValidation().validateAmount(value, 'expected after repair value'),
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
              height: 20,
            ),
            TextFieldModule(
              fieldController: homeScreenController.landValueFieldController,
              hintText: 'Land Value',
              validate: (value) => FieldValidation().validateAmount(value, 'land value'),
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
              height: 20,
            ),
            TextFieldModule(
              fieldController: homeScreenController.offerPriceFieldController,
              onChange: (val){
                homeScreenController.downPaymentAmountFunction();
              },
              hintText: 'Offer Price',
              validate: (value) => FieldValidation().validateAmount(value, 'offer price'),
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
          ],
        ).commonAllSidePadding(10),
      ),
    ).commonAllSidePadding(10);
  }
}

class FinancialDetails extends StatelessWidget {
  FinancialDetails({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appColorsSecondry,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appColors.withOpacity(.7))),
      child: Form(
        key: homeScreenController.financialDetailsKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Financial Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColors,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 20, top: 10),
            ),

            TextFieldModule(
              fieldController:
                  homeScreenController.grossMonthlyRevenueFieldController,
              hintText: 'Gross Monthly Revenue',
              validate: (value) => FieldValidation().validateAmount(value, 'gross monthly revenue'),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
              onChange: (text){
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
              height: 20,
            ),
            TextFieldModule(
              fieldController: homeScreenController
                  .propertyManagementFeesPercentageFieldController,
              onChange: (text){
                homeScreenController.propertyManagementFeesAmountCountFunction();
              },
              hintText: 'Property Management Fees percentage',
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '%',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              validate: (value) => FieldValidation().validateAmount(value, 'property management fees percentage'),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 20,
            ),

            TextFieldModule(
              fieldController: homeScreenController.propertyManagementFeesAmountFieldController,
              hintText: 'Property Management Fees amount',
              keyboardType: TextInputType.number,
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              readOnly: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldModule(
              fieldController: homeScreenController
                  .vacancyandReplacementReservesFieldController,
              onChange: (val){
                homeScreenController.vacancyandReplacementAmountFunction();
              },
              hintText: 'Vacancy and Replacement Reserves',
              validate: (value) => FieldValidation().validateAmount(value, 'vacancy and replacement reserves'),
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
            const SizedBox(
              height: 20,
            ),
            TextFieldModule(
              fieldController:
                  homeScreenController.vacancyandReplacementAmountFieldController,
              hintText: 'Vacancy and Replacement amount',
              keyboardType: TextInputType.number,
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              readOnly: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldModule(
              fieldController: homeScreenController.monthlyCondoFieldController,
              hintText: 'Monthly Condo /Association fees',
              validate: (value) => FieldValidation().validateAmount(value, 'monthly condo /association fees'),
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
              height: 20,
            ),
            TextFieldModule(
              fieldController: homeScreenController.monthlyTaxesFieldController,
              hintText: 'Monthly taxes',
              validate: (value) => FieldValidation().validateAmount(value, 'monthly taxes'),
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
              height: 20,
            ),
            TextFieldModule(
              fieldController:
                  homeScreenController.monthlyRepairsMaintenanceFieldController,
              hintText: 'Monthly Repairs & Maintenance',
              validate: (value) => FieldValidation().validateAmount(value, 'monthly repairs & maintenance'),
              keyboardType: TextInputType.number, prifixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Text(
                '\$',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ).commonOnlyPadding(right: 5),
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldModule(
              fieldController:
                  homeScreenController.adminstrativeAllowanceFieldController,
              hintText: 'Adminstrative Allowance',
              validate: (value) => FieldValidation().validateAmount(value, 'adminstrative allowance'),
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
              height: 20,
            ),
            TextFieldModule(
              fieldController:
                  homeScreenController.monthlyInsuranceFieldController,
              hintText: 'Monthly Insurance',
              validate: (value) => FieldValidation().validateAmount(value, 'monthly insurance'), prifixIcon: Align(
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
              height: 20,
            ),
            TextFieldModule(
              fieldController:
                  homeScreenController.mortgagePayment1FieldController,
              hintText: '1 st Mortgage Payment',
              validate: (value) => FieldValidation().validateAmount(value, '1 st mortgage payment'), prifixIcon: Align(
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
              height: 20,
            ),
            TextFieldModule(
              fieldController:
                  homeScreenController.mortgagePayment2FieldController,
              hintText: '2 st Mortgage Payment',
              validate: (value) => FieldValidation().validateAmount(value, '2 st mortgage payment'), prifixIcon: Align(
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
              height: 20,
            ),
            TextFieldModule(
              fieldController:
                  homeScreenController.monthlyUtilitiesFieldController,
              hintText: 'Monthly Utilities',
              validate: (value) => FieldValidation().validateAmount(value, 'monthly utilities'),
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
        ).commonAllSidePadding(10),
      ),
    ).commonAllSidePadding(10);
  }
}

class ProjectCosts extends StatelessWidget {
  ProjectCosts({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appColorsSecondry,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appColors.withOpacity(.7))),
      child: Form(
        key: homeScreenController.projectCostsKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Project Costs",

                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColors,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 20, top: 10),
            ),

            TextFieldModule(
              fieldController:
              homeScreenController.costsPaidoutPocketFieldController,
              hintText: 'Rehab Costs Paid out of Pocket',
              validate: (value) => FieldValidation().validateAmount(value, 'rehab costs paid out of pocket'), prifixIcon: Align(
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
            TextFieldModule(
              fieldController:
              homeScreenController.costFinancedFieldController,
              hintText: 'Rehab Costs Financed',
              validate: (value) => FieldValidation().validateAmount(value, 'rehab costs financed'), prifixIcon: Align(
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
        ).commonAllSidePadding(10),
      ),
    ).commonAllSidePadding(10);
  }
}

class AcquisitionCosts extends StatelessWidget {
  AcquisitionCosts({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appColorsSecondry,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appColors.withOpacity(.7))),
      child: Form(
        key: homeScreenController.acquisitionCostsKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Acquisition Costs",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColors,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 20, top: 10),
            ),
            TextFieldModule(
              fieldController:
              homeScreenController.appraisalCostsFieldController,
              hintText: 'Appraisal',
              validate: (value) => FieldValidation().validateAmount(value, 'appraisal'), prifixIcon: Align(
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
            TextFieldModule(
              fieldController:
              homeScreenController.inspectionCostsFieldController,
              hintText: 'Inspection',
              validate: (value) => FieldValidation().validateAmount(value, 'inspection'), prifixIcon: Align(
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
            TextFieldModule(
              fieldController:
              homeScreenController.surveyCostsFieldController,
              hintText: 'Survey',
              validate: (value) => FieldValidation().validateAmount(value, 'survey'), prifixIcon: Align(
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
            TextFieldModule(
              fieldController:
              homeScreenController.wholesaleFeeCostsFieldController,
              hintText: 'Wholesale Fee',
              validate: (value) => FieldValidation().validateAmount(value, 'wholesale fee'), prifixIcon: Align(
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
          ],
        ).commonAllSidePadding(10),
      ),
    ).commonAllSidePadding(10);
  }
}

class MortgageDetails1 extends StatelessWidget {
  MortgageDetails1({Key? key}) : super(key: key);
final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appColorsSecondry,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appColors.withOpacity(.7))),
      child: Form(
        key: homeScreenController.mortgage1Key,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "1st Mortgage Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColors,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 20, top: 10),
            ),
            TextFieldModule(
              fieldController:
              homeScreenController.mortgageTermMonthsFieldController,
              hintText: "Mortgage Term (Months)",
              validate: (value) => FieldValidation().validateAmount(value, 'mortgage term (months)'),

              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldModule(
              fieldController:
              homeScreenController.paymentsPerYearFieldController,
              hintText: "Payments Per Year",
              validate: (value) => FieldValidation().validateAmount(value, 'payments per year'),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldModule(
              fieldController:
              homeScreenController.downPaymentPercentageFieldController,
              hintText: "Down Payment Percentage",
              validate: (value) => FieldValidation().validateAmount(value, 'down payment percentage'),
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '%',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              onChange: (val){
                homeScreenController.downPaymentAmountFunction();
                homeScreenController.financedAmountFunction();
              },

              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldModule(
              fieldController:
              homeScreenController.downPaymentAmountFieldController,
              readOnly: true,
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              hintText: "Down Payment Amount",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
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
              hintText: "Financed Amount",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldModule(
              fieldController: homeScreenController.interestRateFieldController,
              hintText: "Interest Rate",
              validate: (value) => FieldValidation().validateAmount(value, 'interest rate'),
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
            const SizedBox(
              height: 10,
            ),
            //radioButton Interest Only (0=Yes, 1=No)
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Points Financed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController.pointsFinancedButton.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController.pointsFinancedButton.value = 0;
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
                            value: homeScreenController.pointsFinancedButton.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController.pointsFinancedButton.value = 1;
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
            TextFieldModule(
              fieldController: homeScreenController.loanPointsFieldController,
              hintText: "Loan Points",
              validate: (value) => FieldValidation().validateAmount(value, 'loan points'),
              onChange: (val){
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
            const SizedBox(
              height: 10,
            ),
            TextFieldModule(
              fieldController: homeScreenController.pointsAmountFieldController,
              hintText: "Points Amount",
              readOnly: true,
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            //Radio Button Points Financed (0=Yes, 1=No)
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Interest Only',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController.interestOnlyButton.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController.interestOnlyButton.value = 0;
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
                            value: homeScreenController.interestOnlyButton.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController.interestOnlyButton.value = 1;
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
            TextFieldModule(
              fieldController: homeScreenController.closingCostsFieldController,
              hintText: "Closing Costs",
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              readOnly: true,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            //Radio Button Closing Costs Financed (0=Yes, 1=No)
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Closing Costs Financed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController.closingCostsFinancedButton.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController.closingCostsFinancedButton.value = 0;
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
                            value: homeScreenController.closingCostsFinancedButton.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController.closingCostsFinancedButton.value = 1;
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
          ],
        ).commonAllSidePadding(10),
      ),
    ).commonAllSidePadding(10);
  }
}


//Mortgage Ditails2
class MortgageDetails2 extends StatelessWidget {
 MortgageDetails2({Key? key}) : super(key: key);
final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appColorsSecondry,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appColors.withOpacity(.7))),
      child: Form(
        key: homeScreenController.mortgage2Key,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "2st Mortgage Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColors,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 20, top: 10),
            ),
            TextFieldModule(
              fieldController:
              homeScreenController.mortgageTermMonths2FieldController,
              hintText: "Mortgage Term (Months)",
              validate: (value) => FieldValidation().validateAmount(value, 'mortgage term (months)'),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldModule(
              fieldController:
              homeScreenController.paymentsPerYear2FieldController,
              hintText: "Payments Per Year",
              validate: (value) => FieldValidation().validateAmount(value, 'payments per year'),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldModule(
              fieldController:
              homeScreenController.mortgageAmount2FieldController,
              hintText: "2nd Mortgage Amount",
              validate: (value) => FieldValidation().validateAmount(value, '2nd mortgage amount'),
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
            const SizedBox(
              height: 10,
            ),

            TextFieldModule(
              fieldController: homeScreenController.financedAmount2FieldController,
              readOnly: true,
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
onChange: (val){
  homeScreenController.pointsAmountFunction2();
},
              hintText: "Financed Amount",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldModule(
              fieldController: homeScreenController.interestRate2FieldController,
              hintText: "Interest Rate",
              validate: (value) => FieldValidation().validateAmount(value, 'interest rate'),
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
            const SizedBox(
              height: 10,
            ),
            //radioButton Interest Only (0=Yes, 1=No)
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Points Financed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController.pointsFinancedButton2.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController.pointsFinancedButton2.value = 0;
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
                            value: homeScreenController.pointsFinancedButton2.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController.pointsFinancedButton2.value = 1;
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
            TextFieldModule(
              fieldController: homeScreenController.loanPoints2FieldController,
              hintText: "Loan Points",
              onChange: (val){
                homeScreenController.pointsAmountFunction2();
              },
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '%',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              validate: (value) => FieldValidation().validateAmount(value, 'loan points'),
              keyboardType: TextInputType.number,
              backgroundColor: AppColors.whiteColor1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldModule(
              fieldController: homeScreenController.pointsAmount2FieldController,
              hintText: "Points Amount",
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              readOnly: true,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            //Radio Button Points Financed (0=Yes, 1=No)
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Interest Only',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController.interestOnlyButton2.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController.interestOnlyButton2.value = 0;
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
                            value: homeScreenController.interestOnlyButton2.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController.interestOnlyButton2.value = 1;
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
            TextFieldModule(
              fieldController: homeScreenController.closingCosts2FieldController,
              hintText: "Closing Costs",
              prifixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text(
                  '\$',
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ).commonOnlyPadding(right: 5),
              readOnly: true,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            //Radio Button Closing Costs Financed (0=Yes, 1=No)
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Closing Costs Financed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController.closingCostsFinancedButton2.value,
                            groupValue: 0,
                            onChanged: (val) {
                              homeScreenController.closingCostsFinancedButton2.value = 0;
                            },
                          ),
                          const Text(
                            'Yes'
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: homeScreenController.closingCostsFinancedButton2.value,
                            groupValue: 1,
                            onChanged: (val) {
                              homeScreenController.closingCostsFinancedButton2.value = 1;
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
          ],
        ).commonAllSidePadding(10),
      ),
    ).commonAllSidePadding(10);
  }
}


class AnnualCashFlowAnalysis extends StatelessWidget {
  AnnualCashFlowAnalysis({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appColorsSecondry,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appColors.withOpacity(.7))),
      child: Obx(
        ()=> Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Annual Cash Flow Analysis",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColors,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 20, top: 10),
            ),

            TextRow(title: 'Effective Gross Income',subTitle: '${homeScreenController.effectiveGrossIncome.value}',suffix: '\$'),
            const SizedBox(height: 10,),
            TextRow(title: 'Operating Expenses',subTitle: '${homeScreenController.operatingExpenses.value}' ,suffix: '\$'),
            const SizedBox(height: 10,),
            TextRow(title: 'Net Operating Income',subTitle: '${homeScreenController.netOperatingIncome.value}',suffix: '\$'),
            const SizedBox(height: 10,),
            TextRow(title: 'Capitalization Rate',subTitle: '${homeScreenController.capitalizationRate}',suffix: '%'),
            const SizedBox(height: 10,),
            TextRow(title: 'Annual Debt Service',subTitle: '${homeScreenController.annualDebtService.value}',suffix: '\$'),
            const SizedBox(height: 10,),
            TextRow(title: 'Debt Coverage Ratio',subTitle: '${homeScreenController.debtCoverageRatio}',suffix: '%'),
            const SizedBox(height: 10,),
            TextRow(title: 'Annual Cash Flow',subTitle: '${homeScreenController.annualCashFlow.value}',suffix: '\$'),
            const SizedBox(height: 10,),
            TextRow(title: 'Total Out of Pocket',subTitle: '${homeScreenController.totalOutPocket.value}',suffix: '\$'),
            const SizedBox(height: 10,),
            TextRow(title: 'Return on Investment',subTitle: '${homeScreenController.returnonInvestment.value}',suffix: '%'),
            const SizedBox(height: 10,),
          ],
        ).commonAllSidePadding(10),
      ),
    ).commonAllSidePadding(10);
  }
}

class QuickFlipAnalysis extends StatelessWidget {
 QuickFlipAnalysis ({Key? key}) : super(key: key);
final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appColorsSecondry,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appColors.withOpacity(.7))),
      child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Quick Flip Analysis",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appColors,
                    fontSize: 14.sp),
              ).commonOnlyPadding(bottom: 20, top: 10),
            ),
            TextRow(title: 'Sales Price',subTitle: '${homeScreenController.salesPrice.value}',suffix: '\$'),
            const SizedBox(height: 10,),

            SubTextRow(title: 'Purchase Price',subTitle:'${homeScreenController.purchasePrice.value}',suffix: '\$', ),
            const SizedBox(height: 10,),

            SubTextRow(title: 'Acquisition Costs',subTitle:'${homeScreenController.acquisitionCosts.value}',suffix: '\$', ),
            const SizedBox(height: 10,),

            SubTextRow(title: 'Carrying Costs',subTitle:'${homeScreenController.carryingCosts.value}',suffix: '\$', ),
            const SizedBox(height: 10,),

            SubTextRow(title: 'Rehab Costs',subTitle:'${homeScreenController.rehabCosts.value}',suffix: '\$', ),
            const SizedBox(height: 10,),

            SubTextRow(title: 'Selling Expenses',subTitle:'${homeScreenController.sellingExpenses.value}',suffix: '\$', ),
            const SizedBox(height: 10,),
            const CustomDivider(),
            TextRow(title: 'Total Project Cost',subTitle: '${homeScreenController.totalProjectCost.value}',suffix: '\$'),
            const SizedBox(height: 10,),
            TextRow(title: 'Net Profit', subTitle: '${homeScreenController.netProfit.value}',suffix: '\$',subTitleColor: AppColors.blackColor),
            const SizedBox(height: 10,),
            const CustomDivider(),
            TextRow(title: 'Total Out of Pocket',subTitle: '${homeScreenController.totalOutofPocket.value}',suffix: '\$'),
            const SizedBox(height: 10,),
            TextRow(title: 'Annualized ROI',subTitle: '${homeScreenController.annualizedROI.value}',suffix: '\$'),
            const SizedBox(height: 10,),
          ],
        ).commonAllSidePadding(10),
    ).commonAllSidePadding(10);
  }
}

class PropertyPurchaseDetails extends StatelessWidget {
   PropertyPurchaseDetails ({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appColorsSecondry,
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
            ).commonOnlyPadding(bottom: 20, top: 10),
          ),
          const SizedBox(height: 10,),
          TextRow(title: 'Purchase Price', subTitle: '${homeScreenController.purchasePrice.value}',suffix: '\$',),
          const SizedBox(height: 10,),
          TextRow(title: 'Down Payment', subTitle: '${homeScreenController.downPayment.value}',suffix: '\$',),
          const SizedBox(height: 10,),
          TextRow(title: 'Closing Closts', subTitle: '${homeScreenController.closingClosts.value}',suffix: '\$',),
          const SizedBox(height: 10,),
          TextRow(title: 'Loan Points', subTitle: '${homeScreenController.loanPoints.value}',suffix: '\$',),
          const SizedBox(height: 10,),
          TextRow(title: 'Total Investment', subTitle: '${homeScreenController.totalInvestment.value}',suffix: '\$',),
          const SizedBox(height: 10,),
          TextRow(title: 'Expense Esclator', subTitle: '${homeScreenController.expenseEsclator.value}',suffix: '%',),
          const SizedBox(height: 10,),
          TextRow(title: 'Income Escalator', subTitle: '${homeScreenController.incomeEscalator.value}',suffix: '%',),

        ],
      ).commonAllSidePadding(10),
    ).commonAllSidePadding(10);
  }
}
