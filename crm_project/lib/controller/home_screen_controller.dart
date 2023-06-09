import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;

  bool containsInvalidCharacters(String value) {
    if (value.contains(" ") || value.contains("-") || value.contains(",")) {
      return true;
    }
    else {
      return false;
    }
  }

  //Property Ditails
  GlobalKey<FormState> propertyDetailsKey = GlobalKey<FormState>();
  final propertyAddressFieldController = TextEditingController();
  final zipFieldController = TextEditingController();
  final leadSourceFieldController = TextEditingController();
  final expectedAfterRepairValueFieldController = TextEditingController();
  final landValueFieldController = TextEditingController();
  final offerPriceFieldController = TextEditingController();

  RxString citySelect = 'Select city'.obs;
  RxString stateSelect = 'Select State'.obs;

  List<String> cityDropDownList = [
    'Surat',
    'Amreli',
    'Ahmedabad',
    'Indore',
    'Pune',
  ];
  List<String> stateDropDownList = [
    'Gujrat',
    'Maharastar',
    'Kolkata',
    'Keral',
    'Utter Pradesh',
  ];

  //Financial Details
  GlobalKey<FormState> financialDetailsKey = GlobalKey<FormState>();
  final grossMonthlyRevenueFieldController = TextEditingController();
  final propertyManagementFeesPercentageFieldController = TextEditingController();
  final propertyManagementFeesAmountFieldController = TextEditingController(
      text: "0.0");
  final vacancyandReplacementReservesFieldController = TextEditingController();
  final vacancyandReplacementAmountFieldController = TextEditingController(
      text: "0.0");
  final monthlyCondoFieldController = TextEditingController();
  final monthlyTaxesFieldController = TextEditingController();
  final monthlyRepairsMaintenanceFieldController = TextEditingController();
  final adminstrativeAllowanceFieldController = TextEditingController();
  final monthlyInsuranceFieldController = TextEditingController();
  final mortgagePayment1FieldController = TextEditingController();
  final mortgagePayment2FieldController = TextEditingController();
  final monthlyUtilitiesFieldController = TextEditingController();

  void propertyManagementFeesAmountCountFunction() {
    if (grossMonthlyRevenueFieldController.value.text.isNotEmpty &&
        propertyManagementFeesPercentageFieldController.value.text.isNotEmpty) {
      if (containsInvalidCharacters(grossMonthlyRevenueFieldController.text) ||
          containsInvalidCharacters(
              propertyManagementFeesPercentageFieldController.text)) {

      }
      else {
        double val = double.parse(grossMonthlyRevenueFieldController.value.text)
            .toDouble() *
            double.parse(
                propertyManagementFeesPercentageFieldController.value.text)
                .toDouble();
        propertyManagementFeesAmountFieldController.text = val.toString();
      }
    } else {
      propertyManagementFeesAmountFieldController.text = '0.0';
    }
  }

  void vacancyandReplacementAmountFunction() {
    if (grossMonthlyRevenueFieldController.value.text.isNotEmpty &&
        vacancyandReplacementReservesFieldController.value.text.isNotEmpty) {
      if (containsInvalidCharacters(grossMonthlyRevenueFieldController.text) ||
          containsInvalidCharacters(
              vacancyandReplacementReservesFieldController.text)) {
        log("false value");
      }
      else {
        log("true value");
        double val = double.parse(grossMonthlyRevenueFieldController.value.text)
            .toDouble() *
            double.parse(
                vacancyandReplacementReservesFieldController.value.text)
                .toDouble();
        vacancyandReplacementAmountFieldController.text = val.toString();
      }
    } else {
      vacancyandReplacementAmountFieldController.text = '0.0';
    }
  }

  //Project Costs
  GlobalKey<FormState> projectCostsKey = GlobalKey<FormState>();
  final costsPaidoutPocketFieldController = TextEditingController();
  final costFinancedFieldController = TextEditingController();

  //AcquisitionCosts
  GlobalKey<FormState> acquisitionCostsKey = GlobalKey<FormState>();
  final appraisalCostsFieldController = TextEditingController();
  final inspectionCostsFieldController = TextEditingController();
  final surveyCostsFieldController = TextEditingController();
  final wholesaleFeeCostsFieldController = TextEditingController();

  //1st Mortgage
  GlobalKey<FormState> mortgage1Key = GlobalKey<FormState>();
  final mortgageTermMonthsFieldController = TextEditingController();
  final expectedHoldingTermFieldController = TextEditingController();
  final paymentsPerYearFieldController = TextEditingController();
  final downPaymentPercentageFieldController = TextEditingController();
  final downPaymentAmountFieldController = TextEditingController(text: "0.0");
  final financedAmountFieldController = TextEditingController(text: "0.0");
  final interestRateFieldController = TextEditingController();
  final loanPointsFieldController = TextEditingController();
  final pointsAmountFieldController = TextEditingController();
  final pointsPercentageFieldController = TextEditingController();
  final closingCostsFieldController = TextEditingController(text: "0.0");
  final preferredRateOfReturnFieldController = TextEditingController(text: "0.0");
  final offerPriceMortgageFieldController = TextEditingController();

  RxInt interestOnlyButton = 0.obs; //(0=Yes, 1=No)
  RxInt pointsFinancedButton = 0.obs; //(0=Yes, 1=No)
  RxInt closingCostsFinancedButton = 0.obs; //(0=Yes, 1=No)

  void downPaymentAmountFunction() {
    // 4. OfferPrice * 30. DownPaymentPercentage
    if (offerPriceFieldController.value.text.isNotEmpty &&
        downPaymentPercentageFieldController.value.text.isNotEmpty) {
      if (containsInvalidCharacters(offerPriceFieldController.text) ||
          containsInvalidCharacters(
              downPaymentPercentageFieldController.text)) {

      }
      else {
        double val =
            double.parse(offerPriceFieldController.value.text).toDouble() *
                double.parse(downPaymentPercentageFieldController.value.text)
                    .toDouble();
        downPaymentAmountFieldController.text = val.toString();
      }
    } else {
      downPaymentAmountFieldController.text = '0.0';
    }
  }

  void financedAmountFunction() {
    // 4. OfferPrice * 30. DownPaymentPercentage
    if (offerPriceFieldController.value.text.isNotEmpty &&
        downPaymentPercentageFieldController.value.text.isNotEmpty) {
      if (containsInvalidCharacters(offerPriceFieldController.value.text) ||
          containsInvalidCharacters(
              downPaymentPercentageFieldController.value.text)) {

      }
      else {
        double val =
            double.parse(offerPriceFieldController.value.text).toDouble() *
                double.parse(downPaymentPercentageFieldController.value.text)
                    .toDouble();
        financedAmountFieldController.text = val.toString();
        pointsAmountFunction();
      }
    } else {
      financedAmountFieldController.text = '0.0';
    }
  }

  void pointsAmountFunction() {
    // 35. Loan Points * 32. Financed Amount
    if (loanPointsFieldController.value.text.isNotEmpty &&
        financedAmountFieldController.value.text.isNotEmpty) {
      if (containsInvalidCharacters(loanPointsFieldController.value.text) ||
          containsInvalidCharacters(financedAmountFieldController.text)) {

      } else {
        double val =
            double.parse(loanPointsFieldController.value.text).toDouble() *
                double.parse(financedAmountFieldController.value.text)
                    .toDouble();
        pointsAmountFieldController.text = val.toString();
      }
    } else {
      pointsAmountFieldController.text = '0.0';
    }
  }

  void closingCostFunction() {
    // 32. Financed Amount * UserSetting(Closing Cost - B4) + (4. Offer Price,  UserSetting(Default Closing Cost - B5) , 0)

    if (loanPointsFieldController.value.text.isNotEmpty &&
        financedAmountFieldController.value.text.isNotEmpty) {
      if (containsInvalidCharacters(loanPointsFieldController.value.text)||containsInvalidCharacters(financedAmountFieldController.value.text)) {

      }
      else {
        double val =
            double.parse(loanPointsFieldController.value.text).toDouble() *
                double.parse(financedAmountFieldController.value.text)
                    .toDouble();
        closingCostsFieldController.text = val.toString();
      }
    } else {
      closingCostsFieldController.text = '0.0';
    }
  }

//2nd Mortgage
  GlobalKey<FormState> mortgage2Key = GlobalKey<FormState>();
  final mortgageTermMonths2FieldController = TextEditingController();
  final expectedHoldingTerm2FieldController = TextEditingController();
  final paymentsPerYear2FieldController = TextEditingController();
  final mortgageAmount2FieldController = TextEditingController();
  final financedAmount2FieldController = TextEditingController();
  final interestRate2FieldController = TextEditingController();
  final loanPoints2FieldController = TextEditingController();
  final pointsAmount2FieldController = TextEditingController();
  final closingCosts2FieldController = TextEditingController();

  RxInt interestOnlyButton2 = 0.obs; //(0=Yes, 1=No)
  RxInt pointsFinancedButton2 = 0.obs; //(0=Yes, 1=No)
  RxInt closingCostsFinancedButton2 = 0.obs; //(0=Yes, 1=No)

  void financedAmountFunction2() {
    pointsAmountFunction2();
  }

  void pointsAmountFunction2() {
    // loan points * financed amount
    if (loanPoints2FieldController.value.text.isNotEmpty &&
        financedAmount2FieldController.value.text.isNotEmpty) {
      double val = double.parse(loanPoints2FieldController.value.text)
          .toDouble() *
          double.parse(financedAmount2FieldController.value.text).toDouble();
      pointsAmount2FieldController.text = val.toString();
    } else {
      pointsAmount2FieldController.text = '0.0';
    }
  }

  void closingCostsFunction() {}

//Annual Cash Flow Analysis

  final effectiveGrossIncomeTextFieldController = TextEditingController();
  final operatingExpensesTextFieldController = TextEditingController();
  final netOperatingIncomeTextFieldController = TextEditingController();
  final capitalizationRateTextFieldController = TextEditingController();
  final annualDebtServiceTextFieldController = TextEditingController();
  final debtCoverageRatioTextFieldController = TextEditingController();
  final annualCashFlowTextFieldController = TextEditingController();
  final totalOutPocketTextFieldController = TextEditingController();
  final returnOnInvestmentTextFieldController = TextEditingController();


  RxDouble effectiveGrossIncome = 0.0.obs;
  RxDouble operatingExpenses = 0.0.obs;
  RxDouble netOperatingIncome = 0.0.obs;
  RxDouble capitalizationRate = 0.0.obs;
  RxDouble annualDebtService = 0.0.obs;
  RxDouble debtCoverageRatio = 0.0.obs;
  RxDouble annualCashFlow = 0.0.obs;
  RxDouble totalOutPocket = 0.0.obs;
  RxDouble returnonInvestment = 0.0.obs;

  void effectiveGrossIncomeFunction() {
    // (6. Gross Monthly Revenue (At 100% Occupancy) -  8. Property Management Fees amount) * 12
    effectiveGrossIncome.value =
        double.parse(grossMonthlyRevenueFieldController.text) -
            double.parse(propertyManagementFeesAmountFieldController.text) * 12;
  }

  void operatingExpensesFunction() {
    // (10. Vacancy and Replacement amount + 11. Monthly Condo /Association fees + 12. Monthly taxes + 13. Monthly Repairs & Maintenance + 14. Adminstrative Allowance + 15. Monthly Insurance + 18. Monthly Utilities) * 12
    operatingExpenses.value =
        double.parse(vacancyandReplacementAmountFieldController.text) +
            double.parse(monthlyCondoFieldController.text) +
            double.parse(monthlyTaxesFieldController.text) +
            double.parse(adminstrativeAllowanceFieldController.text) +
            double.parse(monthlyInsuranceFieldController.text) +
            double.parse(monthlyUtilitiesFieldController.text);
  }

  void netOperatingIncomeFunction() {
    // 53. Effective Gross Income - 54. Operating Expenses
    netOperatingIncome.value =
        effectiveGrossIncome.value - operatingExpenses.value;
  }

  void capitalizationRateFunction() {
    // (55. Net Operating Income / 2. Expected After Repair Value)  ex: 8376/350000 = 0.02 (2%)
    capitalizationRate.value = netOperatingIncome.value /
        double.parse(expectedAfterRepairValueFieldController.value.toString());
  }

  void annualDebtServiceFunction() {
    // ( 1st Mortgage Payment + 2nd Mortgage Payment ) * 12
    annualDebtService.value =
        double.parse(mortgagePayment1FieldController.text) +
            double.parse(mortgagePayment2FieldController.text) * 12;
  }

  void debtCoverageRatioFunction() {
    // Net Operating Income / Dept services
    debtCoverageRatio.value = netOperatingIncome.value;
  }

  void annualCashFlowFunction() {
    //Net Operating Income - Annual Dept services

    annualCashFlow.value = netOperatingIncome.value - annualDebtService.value;
  }

  void totalOutPocketFunction() {
    //31. Down Payment Amount + (IF())
    totalOutPocket.value = double.parse(downPaymentAmountFieldController.text);
  }

  void returnonInvestmentFunction() {}

//Quick Flip Analysis
  /*final salesPriceTextFieldController = TextEditingController();
  final purchasePriceTextFieldController = TextEditingController();
  final acquisitionCostsTextFieldController = TextEditingController();
  final carryingCostsTextFieldController = TextEditingController();
  final rehabCostsTextFieldController = TextEditingController();
  final sellingExpensesTextFieldController = TextEditingController();
  final totalProjectCostTextFieldController = TextEditingController();
  final netProfitTextFieldController = TextEditingController();
  final totalOutOfPocketTextFieldController = TextEditingController();
  final annualizedROITextFieldController = TextEditingController();*/



  RxDouble salesPrice = 0.0.obs;
  RxDouble purchasePrice = 0.0.obs;
  RxDouble acquisitionCosts = 0.0.obs;
  RxDouble carryingCosts = 0.0.obs;
  RxDouble rehabCosts = 0.0.obs;
  RxDouble sellingExpenses = 0.0.obs;
  RxDouble totalProjectCost = 0.0.obs;
  RxDouble netProfit = 0.0.obs;
  RxDouble totalOutofPocket = 0.0.obs;
  RxDouble annualizedROI = 0.0.obs;

  void quickFlipAnalysisFunction() {
    salesPrice.value =
        double.parse(expectedAfterRepairValueFieldController.text);
    purchasePrice.value = double.parse(offerPriceFieldController.text);
    //
    acquisitionCosts.value = double.parse(appraisalCostsFieldController.text) +
        double.parse(inspectionCostsFieldController.text) +
        double.parse(wholesaleFeeCostsFieldController.text) +
        double.parse(pointsAmountFieldController.text);
    carryingCosts.value = 0;
    rehabCosts.value = double.parse(costFinancedFieldController.text) +
        double.parse(costsPaidoutPocketFieldController.text);
    sellingExpenses.value = 0;
    totalProjectCost.value = purchasePrice.value +
        acquisitionCosts.value +
        carryingCosts.value +
        rehabCosts.value +
        sellingExpenses.value;
    netProfit.value = salesPrice.value - totalProjectCost.value;
    totalOutofPocket.value = 0;
  }

  //Property Purchase Detail

  //RxDouble purchasePrice = 0.0.obs;
  RxDouble downPayment = 0.0.obs;
  RxDouble closingClosts = 0.0.obs;
  RxDouble loanPoints = 0.0.obs;
  RxDouble totalInvestment = 0.0.obs;
  RxDouble expenseEsclator = 0.0.obs;
  RxDouble incomeEscalator = 0.0.obs;

  void propertyPurchaseDetail() {
    //PurchasePrice.value = double.parse(offerPriceFieldController.text);
    downPayment.value = 0;
    closingClosts.value = 0;
    loanPoints.value = 0;
    totalInvestment.value = 0;
    expenseEsclator.value = 0;
    incomeEscalator.value = 0;
  }


//Quick Flip - QF
/*  final purchasePriceQFTextFieldController = TextEditingController();
  final sellingCostsQFTextFieldController = TextEditingController();
  final outOfPocketQFTextFieldController = TextEditingController();
  final loanCostQFTextFieldController = TextEditingController();
  final totalOfProjectQFTextFieldController = TextEditingController();
  final annualizedROIQFTextFieldController = TextEditingController();
  final carryingCostQFTextFieldController = TextEditingController();
  final salesPriceQFTextFieldController = TextEditingController();
  final projectCostQFTextFieldController = TextEditingController();
  final netProfitQFTextFieldController = TextEditingController();*/

//longTermCashFlow - LTCF
/*  final totalIncomeLTCFTextFieldController = TextEditingController();
  final operatingExpenseLTCFTextFieldController = TextEditingController();
  final noiLTCFTextFieldController = TextEditingController();
  final capitalizationRateLTCFTextFieldController = TextEditingController();
  final debitServiceLTCFTextFieldController = TextEditingController();
  final annualCashFlowLTCFTextFieldController = TextEditingController();
  final totalOutOfPocketLTCFTextFieldController = TextEditingController();
  final roiLTCFTextFieldController = TextEditingController();*/

//project Costs 2 - PC
/*  final wholesaleFeesPCTextFieldController = TextEditingController();
  final rehabCostsPCTextFieldController = TextEditingController();*/


//Carrying Cost - CC
/*  final taxesCCTextFieldController = TextEditingController();
  final insuranceCCTextFieldController = TextEditingController();
  final loanCCTextFieldController = TextEditingController();
  final utilitiesCCTextFieldController = TextEditingController();
  final condoFeesCCTextFieldController = TextEditingController();*/

//Selling Cost
/*  final agentFeesSCTextFieldController = TextEditingController();
  final concessionsSCTextFieldController = TextEditingController();
  final closingCostSCTextFieldController = TextEditingController();
  final advertisingSCTextFieldController = TextEditingController();*/


  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
