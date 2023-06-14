import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;


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

  // System Setting Value (Default Values)
  double closingCostValue = 0.0;
  double closingCostPercentage = 0.0;
  int expectedHoldTerm = 6;
  double realtorFees = 6;

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
  final propertyManagementFeesAmountFieldController = TextEditingController(text: "0.0");
  final vacancyandReplacementReservesFieldController = TextEditingController();
  final vacancyandReplacementAmountFieldController = TextEditingController(text: "0.0");
  final monthlyCondoFieldController = TextEditingController();
  final monthlyTaxesFieldController = TextEditingController();
  final monthlyRepairsMaintenanceFieldController = TextEditingController();
  final adminstrativeAllowanceFieldController = TextEditingController();
  final monthlyInsuranceFieldController = TextEditingController();
  final mortgagePayment1FieldController = TextEditingController();
  final mortgagePayment2FieldController = TextEditingController();
  final monthlyUtilitiesFieldController = TextEditingController();

  void propertyManagementFeesAmountCountFunction() {
    if (grossMonthlyRevenueFieldController.text.trim().isNotEmpty && propertyManagementFeesPercentageFieldController.text.trim().isNotEmpty) {
      if (containsInvalidCharacters(grossMonthlyRevenueFieldController.text.trim())
          || containsInvalidCharacters(propertyManagementFeesPercentageFieldController.text.trim())) {
        log('No Action Perform');
      }
      else {
        double percentValue = double.parse(propertyManagementFeesPercentageFieldController.text.trim()) / 100;
        double val = double.parse(grossMonthlyRevenueFieldController.text.trim()).toDouble() * percentValue;
        propertyManagementFeesAmountFieldController.text = val.toString();
      }
    } else {
      propertyManagementFeesAmountFieldController.text = '0.0';
    }
  }

  void vacancyAndReplacementAmountFunction() {
    if (grossMonthlyRevenueFieldController.text.trim().isNotEmpty && vacancyandReplacementReservesFieldController.text.trim().isNotEmpty) {
      if (containsInvalidCharacters(grossMonthlyRevenueFieldController.text)
          || containsInvalidCharacters(vacancyandReplacementReservesFieldController.text)) {
        log('No Action Perform');
      }
      else {
        double percentValue = double.parse(vacancyandReplacementReservesFieldController.text.trim()) / 100;
        double val = double.parse(grossMonthlyRevenueFieldController.value.text).toDouble() * percentValue;
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

  RxInt interestOnlyButton = 1.obs; //(0=Yes, 1=No)
  RxInt pointsFinancedButton = 1.obs; //(0=Yes, 1=No)
  RxInt closingCostsFinancedButton = 1.obs; //(0=Yes, 1=No)

  void downPaymentAmountFunction() {
    // 4. OfferPrice * 30. DownPaymentPercentage
    if (offerPriceFieldController.text.trim().isNotEmpty && downPaymentPercentageFieldController.text.trim().isNotEmpty) {
      if (containsInvalidCharacters(offerPriceFieldController.text) || containsInvalidCharacters(downPaymentPercentageFieldController.text)) {

      }
      else {
        double percentValue = double.parse(downPaymentPercentageFieldController.text.trim()) / 100;
        double val = double.parse(offerPriceFieldController.value.text).toDouble() * percentValue;
        downPaymentAmountFieldController.text = val.toString();
      }
    } else {
      downPaymentAmountFieldController.text = '0.0';
    }
  }

  void financedAmountFunction() {
    // 4. OfferPrice * 30. DownPaymentPercentage
    if (offerPriceFieldController.text.trim().isNotEmpty && downPaymentPercentageFieldController.text.trim().isNotEmpty) {
      if (containsInvalidCharacters(offerPriceFieldController.value.text) || containsInvalidCharacters(downPaymentPercentageFieldController.value.text)) {

      }
      else {
        double percentValue = double.parse(downPaymentPercentageFieldController.text.trim()) / 100;
        double val =
            double.parse(offerPriceFieldController.value.text).toDouble() * percentValue;
        financedAmountFieldController.text = val.toString();
        pointsAmountFunction();
      }
    } else {
      financedAmountFieldController.text = '0.0';
    }
  }

  void pointsAmountFunction() {
    // 35. Loan Points * 32. Financed Amount
    if (loanPointsFieldController.text.trim().isNotEmpty && financedAmountFieldController.text.trim().isNotEmpty) {
      if (containsInvalidCharacters(loanPointsFieldController.value.text)
          || containsInvalidCharacters(financedAmountFieldController.text)) {

      } else {
        double val = double.parse(loanPointsFieldController.value.text).toDouble() * (double.parse(financedAmountFieldController.value.text).toDouble() / 100);
        pointsAmountFieldController.text = val.toString();
      }

    } else {
      pointsAmountFieldController.text = '0.0';
    }
    firstMortgageFinanceAmountCalculation();
  }

  // Main Function
  /*void calculateClosingCostFunction() {
    var closingCostTempValue = 0.0;
    if(financedAmountFieldController.text.trim().isNotEmpty) {
      closingCostTempValue = double.parse(financedAmountFieldController.text.trim()) * (closingCostPercentage/100);
      if(offerPriceFieldController.text.trim().isNotEmpty) {
        closingCostTempValue = closingCostTempValue + closingCostValue;
      }
      closingCostsFieldController.text = closingCostTempValue.toStringAsFixed(2);
    }
  }*/

  // Main Function
  void calculatePointsAmountFunction() {
    var tempPointsAmount = 0.0;
    if(financedAmountFieldController.text.trim().isNotEmpty && loanPointsFieldController.text.trim().isNotEmpty) {
      tempPointsAmount = double.parse(financedAmountFieldController.text.trim()) * (double.parse(loanPointsFieldController.text.trim()) / 100);
      pointsAmountFieldController.text = tempPointsAmount.toStringAsFixed(2);
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

  RxInt interestOnlyButton2 = 1.obs; //(0=Yes, 1=No)
  RxInt pointsFinancedButton2 = 1.obs; //(0=Yes, 1=No)
  RxInt closingCostsFinancedButton2 = 1.obs; //(0=Yes, 1=No)

  void financedAmountFunction2() {
    pointsAmountFunction2();
  }

  void pointsAmountFunction2() {
    // loan points * financed amount
    if (loanPoints2FieldController.text.trim().isNotEmpty && financedAmount2FieldController.text.trim().isNotEmpty) {
      double val = double.parse(loanPoints2FieldController.text.trim()).toDouble() * (double.parse(financedAmount2FieldController.text.trim()).toDouble() / 100);
      pointsAmount2FieldController.text = val.toString();
    } else {
      pointsAmount2FieldController.text = '0.0';
    }
  }

  // 1st Mortgage finance
  void firstMortgageFinanceAmountCalculation() {
    var financedAmount = 0.0;

    if(costFinancedFieldController.text.isNotEmpty
        && offerPriceFieldController.text.isNotEmpty
        && downPaymentPercentageFieldController.text.isNotEmpty) {
      var rehabCostsFinancedPercentage = double.parse(costFinancedFieldController.text.trim());
      var offerPricePercentage = double.parse(offerPriceFieldController.text.trim());
      var downPaymentPercentage = double.parse(downPaymentPercentageFieldController.text.trim());

      log('rehabCostsFinancedPercentage :$rehabCostsFinancedPercentage');
      log('offerPricePercentage :$offerPricePercentage');
      log('downPaymentPercentage :$downPaymentPercentage');

      var tempValue = rehabCostsFinancedPercentage + (offerPricePercentage * ((100 - downPaymentPercentage)/100));
      log('tempValue :$tempValue');
      // financedAmount = tempValue;

      var closingCost = "0";
      if (closingCostsFinancedButton.value == 0) {
        closingCost = closingCostsFieldController.text.trim().isNotEmpty ? closingCostsFieldController.text.trim() : "0";
      }
      var pointsFinanceAmount = "0";
      if (pointsFinancedButton.value == 0) {
        pointsFinanceAmount = pointsAmountFieldController.text.trim().isNotEmpty ? pointsAmountFieldController.text.trim() : "0";
      }

      financedAmount = tempValue + double.parse(closingCost) + double.parse(pointsFinanceAmount);
      financedAmountFieldController.text = financedAmount.toString();
    }
  }

  void firstMortgageClosingCostCalculation() {
    var closingCostAmount = 0.0;

    if(financedAmountFieldController.text.trim().isNotEmpty) {
      var financedField = double.parse(financedAmountFieldController.text) * (closingCostPercentage/100);
      closingCostAmount = financedField;

      if(offerPriceFieldController.text.trim().isNotEmpty) {
        closingCostAmount = closingCostAmount + closingCostValue;
      }
      closingCostsFieldController.text = closingCostAmount.toString();
    }
    firstMortgageFinanceAmountCalculation();
  }

  // 2nd Mortgage Finance
  void secondMortgageFinanceAmountCalculator() {
    var financedAmount = 0.0;
    if(mortgageAmount2FieldController.text.trim().isNotEmpty) {
      financedAmount = double.parse(mortgageAmount2FieldController.text.trim());
      if(pointsFinancedButton2.value == 0) {
        financedAmount = financedAmount + double.parse(pointsAmount2FieldController.text.trim());
      }
      if(closingCostsFinancedButton2.value == 0) {
        financedAmount = financedAmount + double.parse(closingCosts2FieldController.text.trim());
      }
      financedAmount2FieldController.text = financedAmount.toString();
    }

  }

  void secondFinanceClosingCostCalculator() {
    var secondMortgageClosingAmount = 0.0;
    
    if(financedAmount2FieldController.text.trim().isNotEmpty) {
      secondMortgageClosingAmount = double.parse(financedAmount2FieldController.text.trim()) * (closingCostPercentage / 100);
    }

    if(mortgageAmount2FieldController.text.trim().isNotEmpty) {
      secondMortgageClosingAmount = secondMortgageClosingAmount + closingCostValue;
    }
    closingCosts2FieldController.text =  secondMortgageClosingAmount.toString();
  }

  void secondMortgagePmtCalculateFunction() {
    if(interestOnlyButton2.value == 1 && financedAmount2FieldController.text.trim().isNotEmpty
    && interestRate2FieldController.text.trim().isNotEmpty && paymentsPerYear2FieldController.text.trim().isNotEmpty
    && mortgageTermMonths2FieldController.text.trim().isNotEmpty) {
      //todo
      double financedAmount = double.parse(financedAmount2FieldController.text.trim());
      double interestRate = double.parse(interestRate2FieldController.text.trim());
      double paymentPerYear = double.parse(paymentsPerYear2FieldController.text.trim());
      int mortgageTerm = int.parse(mortgageTermMonths2FieldController.text.trim());

      var pmtAmount = pmtCalculate(((interestRate/100) / paymentPerYear), int.parse(mortgageTerm.toString()), -financedAmount);
      mortgagePayment2FieldController.text = pmtAmount.toStringAsFixed(2);
    }

    if(interestOnlyButton2.value == 0 && financedAmount2FieldController.text.trim().isNotEmpty
        && interestRate2FieldController.text.trim().isNotEmpty && paymentsPerYear2FieldController.text.trim().isNotEmpty
        && mortgageTermMonths2FieldController.text.trim().isNotEmpty) {
      double financedAmount = double.parse(financedAmount2FieldController.text.trim());
      double interestRate = double.parse(interestRate2FieldController.text.trim());

      var pmtAmount = (financedAmount * (interestRate / 100) / 12);
      mortgagePayment2FieldController.text = pmtAmount.toStringAsFixed(2);
    }
    annualDebtServiceFunction();
  }

  void firstMortgagePmtCalculateFunction() {
    if(interestOnlyButton.value == 1 && financedAmountFieldController.text.trim().isNotEmpty
        &&  interestRateFieldController.text.trim().isNotEmpty && paymentsPerYearFieldController.text.trim().isNotEmpty
        && mortgageTermMonthsFieldController.text.trim().isNotEmpty) {
      double financedAmount = double.parse(financedAmountFieldController.text.trim());
      double interestRate = double.parse(interestRateFieldController.text.trim());
      double paymentPerYear = double.parse(paymentsPerYearFieldController.text.trim());
      int mortgageTerm = int.parse(mortgageTermMonthsFieldController.text.trim());

      var pmtAmount = pmtCalculate(((interestRate/100) / paymentPerYear), int.parse(mortgageTerm.toString()), -financedAmount);
      mortgagePayment1FieldController.text = pmtAmount.toStringAsFixed(2);
    }

    if(interestOnlyButton.value == 0 && financedAmountFieldController.text.trim().isNotEmpty
        &&  interestRateFieldController.text.trim().isNotEmpty && paymentsPerYearFieldController.text.trim().isNotEmpty
        && mortgageTermMonthsFieldController.text.trim().isNotEmpty) {
      double financedAmount = double.parse(financedAmountFieldController.text.trim());
      double interestRate = double.parse(interestRateFieldController.text.trim());
      // double paymentPerYear = double.parse(paymentsPerYearFieldController.text.trim());
      // int mortgageTerm = int.parse(mortgageTermMonthsFieldController.text.trim());

      var pmtAmount = (financedAmount * (interestRate / 100) / 12);
      mortgagePayment1FieldController.text = pmtAmount.toStringAsFixed(2);
    }

    annualDebtServiceFunction();
  }

  pmtCalculate(rate, nper, pv) {
    int fv = 0;
    int type = 0;

    if (rate == 0) return -(pv + fv) / nper;

    var pvif = math.pow(1 + rate, nper);
    var pmt = rate / (pvif - 1) * -(pv * pvif + fv);

    if (type == 1) {
      pmt /= (1 + rate);
    }

    return pmt;
  }



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
  RxInt capitalizationRate = 0.obs;
  RxDouble annualDebtService = 0.0.obs;
  RxInt debtCoverageRatio = 0.obs;
  RxDouble annualCashFlow = 0.0.obs;
  RxDouble totalOutPocket = 0.0.obs;
  RxDouble returnonInvestment = 0.0.obs;

  void effectiveGrossIncomeFunction() {
    // (6. Gross Monthly Revenue (At 100% Occupancy) -  8. Property Management Fees amount) * 12
    if(grossMonthlyRevenueFieldController.text.trim().isNotEmpty && propertyManagementFeesAmountFieldController.text.trim().isNotEmpty) {
      effectiveGrossIncome.value =
          (double.parse(grossMonthlyRevenueFieldController.text) -
              double.parse(propertyManagementFeesAmountFieldController.text)) *
                  12;
      log('effectiveGrossIncome :${effectiveGrossIncome.value}');
      operatingExpensesFunction();
      loadUI();
    }
  }

  void operatingExpensesFunction() {
    // (10. Vacancy and Replacement amount + 11. Monthly Condo /Association fees + 12. Monthly taxes + 13. Monthly Repairs & Maintenance + 14. Adminstrative Allowance + 15. Monthly Insurance + 18. Monthly Utilities) * 12

    if(vacancyandReplacementAmountFieldController.text.trim().isNotEmpty && monthlyCondoFieldController.text.trim().isNotEmpty
    && monthlyTaxesFieldController.text.trim().isNotEmpty && adminstrativeAllowanceFieldController.text.trim().isNotEmpty
    && monthlyInsuranceFieldController.text.trim().isNotEmpty && monthlyUtilitiesFieldController.text.trim().isNotEmpty
    && monthlyRepairsMaintenanceFieldController.text.trim().isNotEmpty) {
      operatingExpenses.value =
         (double.parse(vacancyandReplacementAmountFieldController.text) +
              double.parse(monthlyCondoFieldController.text) +
              double.parse(monthlyTaxesFieldController.text) +
              double.parse(monthlyRepairsMaintenanceFieldController.text) +
              double.parse(adminstrativeAllowanceFieldController.text) +
              double.parse(monthlyInsuranceFieldController.text) +
              double.parse(monthlyUtilitiesFieldController.text)) * 12;

      netOperatingIncomeFunction();
    }
  }



  void netOperatingIncomeFunction() {
    // 53. Effective Gross Income - 54. Operating Expenses
    netOperatingIncome.value =
        effectiveGrossIncome.value - operatingExpenses.value;
    capitalizationRateFunction();
  }

  void capitalizationRateFunction() {
    // (55. Net Operating Income / 2. Expected After Repair Value)  ex: 8376/350000 = 0.02 (2%)
    if(netOperatingIncome.value != 0.0 && expectedAfterRepairValueFieldController.text.trim().isNotEmpty) {
      double expectedARV = double.parse(expectedAfterRepairValueFieldController.text.trim());
      capitalizationRate.value = ((netOperatingIncome.value / expectedARV) * 100).floor();
    } else {
      capitalizationRate.value = 0;
    }

    // Set Annual Debt
    if(mortgagePayment1FieldController.text.trim().isNotEmpty && mortgagePayment2FieldController.text.trim().isNotEmpty) {
      annualDebtService.value =
          ((double.parse(mortgagePayment1FieldController.text) +
              double.parse(mortgagePayment2FieldController.text)) * 12).toPrecision(2);
    }

    // Set Debt Coverage Ratio & Annual Cash Flow
    if(netOperatingIncome.value != 0.0 && expectedAfterRepairValueFieldController.text.trim().isNotEmpty && annualDebtService.value != 0.0) {
      double expectedARV = double.parse(expectedAfterRepairValueFieldController.text.trim());
      debtCoverageRatio.value = ((netOperatingIncome.value / annualDebtService.value) * 100).floor();

      // Annual cash Flow
      annualCashFlowFunction();
    } else {
      debtCoverageRatio.value = 0;
      annualCashFlow.value = 0.0;
    }

    totalOutPocketFunction();
  }

  void annualDebtServiceFunction() {
    // ( 1st Mortgage Payment + 2nd Mortgage Payment ) * 12
    if(mortgagePayment1FieldController.text.trim().isNotEmpty && mortgagePayment2FieldController.text.trim().isNotEmpty) {
      annualDebtService.value =
          (double.parse(mortgagePayment1FieldController.text) +
              double.parse(mortgagePayment2FieldController.text)) * 12;
    }
    // debtCoverageRatioFunction();

  }

  /*void debtCoverageRatioFunction() {
    // Net Operating Income / Dept services
    if(netOperatingIncome.value != 0.0 && expectedAfterRepairValueFieldController.text.trim().isNotEmpty) {
      double expectedARV = double.parse(expectedAfterRepairValueFieldController.text.trim());
      debtCoverageRatio.value = ((netOperatingIncome.value / expectedARV) * 100).floor();
    }
    loadUI();
  }*/

  void annualCashFlowFunction() {
    //Net Operating Income - Annual Dept services

    annualCashFlow.value = (netOperatingIncome.value - annualDebtService.value).toPrecision(2);
  }

  void totalOutPocketFunction() {
    //31. Down Payment Amount + (IF())
    double tempTotalOutPocketValue = 0.0;

    if(downPaymentAmountFieldController.text.trim().isNotEmpty && pointsAmountFieldController.text.trim().isNotEmpty
    && closingCosts2FieldController.text.trim().isNotEmpty && pointsAmount2FieldController.text.trim().isNotEmpty
    && appraisalCostsFieldController.text.trim().isNotEmpty && inspectionCostsFieldController.text.trim().isNotEmpty
    && surveyCostsFieldController.text.trim().isNotEmpty && closingCostsFieldController.text.trim().isNotEmpty
    && wholesaleFeeCostsFieldController.text.trim().isNotEmpty && costsPaidoutPocketFieldController.text.trim().isNotEmpty) {

      if(downPaymentAmountFieldController.text.trim().isNotEmpty) {
        tempTotalOutPocketValue = double.parse(downPaymentAmountFieldController.text.trim());
      }
      if(pointsFinancedButton.value == 0) {
        tempTotalOutPocketValue += double.parse(pointsAmountFieldController.text.trim());
      }
      if(closingCostsFinancedButton2.value == 0) {
        tempTotalOutPocketValue += double.parse(closingCosts2FieldController.text.trim());
      }
      if(pointsFinancedButton2.value == 0) {
        tempTotalOutPocketValue += double.parse(pointsAmount2FieldController.text.trim());
      }

      tempTotalOutPocketValue = tempTotalOutPocketValue + double.parse(appraisalCostsFieldController.text.trim())
          + double.parse(inspectionCostsFieldController.text.trim()) + double.parse(surveyCostsFieldController.text.trim());

      if(closingCostsFinancedButton.value == 0) {
        tempTotalOutPocketValue += double.parse(closingCostsFieldController.text.trim());
      }

      tempTotalOutPocketValue = tempTotalOutPocketValue + double.parse(wholesaleFeeCostsFieldController.text.trim());
      tempTotalOutPocketValue = tempTotalOutPocketValue + double.parse(costsPaidoutPocketFieldController.text.trim());

      totalOutPocket.value = tempTotalOutPocketValue.toPrecision(2);
      log('totalOutPocket.value Inner : ${totalOutPocket.value}');
    }

    log('totalOutPocket.value Outer : ${totalOutPocket.value}');
    calculateReturnOnInvestment();
  }

  void calculateReturnOnInvestment() {
    if(annualCashFlow.value != 0.0 && totalOutPocket.value != 0.0) {
      double roiValue = (annualCashFlow.value / totalOutPocket.value) * 100;
      returnonInvestment.value = roiValue.toPrecision(2);
    } else {
      returnonInvestment.value = 0.0;
    }

    log('annualCashFlow.value :${annualCashFlow.value}');
    log('totalOutofPocket.value :${totalOutPocket.value}');

    log('returnonInvestment.value :${returnonInvestment.value}');

    calculateQuickFLipAnalysis();
  }

  void calculateQuickFLipAnalysis() {
    salesPrice.value = double.parse(expectedAfterRepairValueFieldController.text.trim());
    purchasePrice.value = double.parse(offerPriceFieldController.text.trim());

    var tempAcquisitionCost = 0.0;
    pointsAmount2FieldController.text.trim().isNotEmpty ? tempAcquisitionCost += double.parse(pointsAmount2FieldController.text.trim()) : null;
    appraisalCostsFieldController.text.trim().isNotEmpty ? tempAcquisitionCost += double.parse(appraisalCostsFieldController.text.trim()) : null;
    inspectionCostsFieldController.text.trim().isNotEmpty ? tempAcquisitionCost += double.parse(inspectionCostsFieldController.text.trim()) : null;
    surveyCostsFieldController.text.trim().isNotEmpty ? tempAcquisitionCost += double.parse(surveyCostsFieldController.text.trim()) : null;
    closingCostsFieldController.text.trim().isNotEmpty ? tempAcquisitionCost += double.parse(closingCostsFieldController.text.trim()) : null;
    wholesaleFeeCostsFieldController.text.trim().isNotEmpty ? tempAcquisitionCost += double.parse(wholesaleFeeCostsFieldController.text.trim()) : null;
    pointsAmountFieldController.text.trim().isNotEmpty ? tempAcquisitionCost += double.parse(pointsAmountFieldController.text.trim()) : null;
    acquisitionCosts.value = tempAcquisitionCost;

    var tempCarryingCost =0.0;
    propertyManagementFeesAmountFieldController.text.trim().isNotEmpty ? tempCarryingCost += double.parse(propertyManagementFeesAmountFieldController.text.trim()) : null;
    vacancyandReplacementAmountFieldController.text.trim().isNotEmpty ? tempCarryingCost += double.parse(vacancyandReplacementAmountFieldController.text.trim()) : null;
    monthlyCondoFieldController.text.trim().isNotEmpty ? tempCarryingCost += double.parse(monthlyCondoFieldController.text.trim()) : null;
    monthlyTaxesFieldController.text.trim().isNotEmpty ? tempCarryingCost += double.parse(monthlyTaxesFieldController.text.trim()) : null;
    monthlyInsuranceFieldController.text.trim().isNotEmpty ? tempCarryingCost += double.parse(monthlyInsuranceFieldController.text.trim()) : null;
    mortgagePayment1FieldController.text.trim().isNotEmpty ? tempCarryingCost += double.parse(mortgagePayment1FieldController.text.trim()) : null;
    mortgagePayment2FieldController.text.trim().isNotEmpty ? tempCarryingCost += double.parse(mortgagePayment2FieldController.text.trim()) : null;
    monthlyUtilitiesFieldController.text.trim().isNotEmpty ? tempCarryingCost += double.parse(monthlyUtilitiesFieldController.text.trim()) : null;
    carryingCosts.value = (tempCarryingCost * expectedHoldTerm).toPrecision(2);

    var tempRehabCost = 0.0;
    costsPaidoutPocketFieldController.text.trim().isNotEmpty ? tempRehabCost += double.parse(costsPaidoutPocketFieldController.text.trim()) : null;
    costFinancedFieldController.text.trim().isNotEmpty ? tempRehabCost += double.parse(costFinancedFieldController.text.trim()) : null;
    rehabCosts.value = tempRehabCost;

    var se1 = 0.0;
    var se2 = 0.0;
    log('realtorFees11111 :$realtorFees');
    log('closingCostPercentage :$closingCostPercentage');
    log('expectedAfterRepairValueFieldController :${expectedAfterRepairValueFieldController.text}');
    expectedAfterRepairValueFieldController.text.trim().isNotEmpty ? se1 = double.parse(expectedAfterRepairValueFieldController.text.trim()) * (realtorFees/100) : null;
    expectedAfterRepairValueFieldController.text.trim().isNotEmpty ? se2 = double.parse(expectedAfterRepairValueFieldController.text.trim()) * (closingCostPercentage/100) : null;
    sellingExpenses.value = se1 + se2;

    totalProjectCost.value = purchasePrice.value + acquisitionCosts.value + carryingCosts.value + rehabCosts.value + sellingExpenses.value;

    netProfit.value = (salesPrice.value - totalProjectCost.value).toPrecision(2);

    var tempTotalOutOfPocketValue = 0.0;
    if(pointsFinancedButton.value == 0) {
      pointsAmountFieldController.text.trim().isNotEmpty ? tempTotalOutOfPocketValue += double.parse(pointsAmountFieldController.text.trim()) : null;
    }
    // log('pointsAmountFieldController.text :${pointsAmountFieldController.text}');
    if(closingCostsFinancedButton.value == 0) {
      closingCostsFieldController.text.trim().isNotEmpty ? tempTotalOutOfPocketValue += double.parse(closingCostsFieldController.text.trim()) : null;
    }
    // log('closingCostsFieldController.text :${closingCostsFieldController.text}');
    downPaymentAmountFieldController.text.trim().isNotEmpty ? tempTotalOutOfPocketValue += double.parse(downPaymentAmountFieldController.text.trim()) : null;
    // log('downPaymentAmountFieldController.text :${downPaymentAmountFieldController.text}');
    costsPaidoutPocketFieldController.text.trim().isNotEmpty ? tempTotalOutOfPocketValue += double.parse(costsPaidoutPocketFieldController.text.trim()) : null;
    // log('costsPaidoutPocketFieldController.text :${costsPaidoutPocketFieldController.text}');
    appraisalCostsFieldController.text.trim().isNotEmpty ? tempTotalOutOfPocketValue += double.parse(appraisalCostsFieldController.text.trim()) : null;
    // log('appraisalCostsFieldController.text :${appraisalCostsFieldController.text}');
    inspectionCostsFieldController.text.trim().isNotEmpty ? tempTotalOutOfPocketValue += double.parse(inspectionCostsFieldController.text.trim()) : null;
    // log('inspectionCostsFieldController.text :${inspectionCostsFieldController.text}');
    surveyCostsFieldController.text.trim().isNotEmpty ? tempTotalOutOfPocketValue += double.parse(surveyCostsFieldController.text.trim()) : null;
    // log('surveyCostsFieldController.text :${surveyCostsFieldController.text}');
    wholesaleFeeCostsFieldController.text.trim().isNotEmpty ? tempTotalOutOfPocketValue += double.parse(wholesaleFeeCostsFieldController.text.trim()) : null;
    // log('wholesaleFeeCostsFieldController.text :${wholesaleFeeCostsFieldController.text}');
    if(closingCostsFinancedButton2.value == 0) {
      closingCosts2FieldController.text.trim().isNotEmpty ? tempTotalOutOfPocketValue += double.parse(closingCosts2FieldController.text.trim()) : null;
    }
    // log('closingCosts2FieldController.text :${closingCosts2FieldController.text}');
    if(pointsFinancedButton2.value == 0) {
      pointsAmount2FieldController.text.trim().isNotEmpty ? tempTotalOutOfPocketValue += double.parse(pointsAmount2FieldController.text.trim()) : null;
    }
    // log('pointsAmount2FieldController.text :${pointsAmount2FieldController.text}');
    // log('carryingCosts.value 121212 :${carryingCosts.value}');
    tempTotalOutOfPocketValue = tempTotalOutOfPocketValue + carryingCosts.value;
    totalOutOfPocket.value = tempTotalOutOfPocketValue.toPrecision(2);

    var tempAnnualizedROI = 0.0;
    if(netProfit.value != 0.0) {
      tempAnnualizedROI = ((((netProfit.value / expectedHoldTerm) * 12) / totalOutOfPocket.value) * 100).toPrecision(2);
      annualizedROI.value = tempAnnualizedROI;
    }

    loadUI();
  }

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
  RxDouble totalOutOfPocket = 0.0.obs;
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
    totalOutOfPocket.value = 0;
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

  @override
  void onInit() {
    systemOptionValueSet();
    super.onInit();
  }

  void systemOptionValueSet() {
    // closingCostsFieldController.text = "1500";
    closingCostValue = 1500;
    closingCostPercentage = 1.5;
  }
}
