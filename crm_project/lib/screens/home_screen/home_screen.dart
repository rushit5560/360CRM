import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/controller/home_screen_controller.dart';
import 'package:crm_project/screens/annual_financial_forecast_screen/annual_financial_forecast_screen.dart';
import 'package:crm_project/screens/company_list_screen/company_list_screen.dart';
import 'package:crm_project/screens/home_screen/home_screen_widgets.dart';
import 'package:crm_project/screens/mtg_amort_schedule/mtg_amort_schedule_list_screen.dart';
import 'package:crm_project/screens/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: "Deal Analyzer",
          leadingShow: false,
          actionShow: true,
          actionIcon: const Icon(Icons.settings_rounded),
          actionOnTap: () =>
              Get.to(() => SettingScreen(), transition: Transition.zoom)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PropertyDetails(),
              const SizedBox(height: 10),
              FinancialDetails(),
            const  SizedBox(height: 10),
              ProjectCosts(),
             const SizedBox(height: 10),
              AcquisitionCosts(),
              const SizedBox(height: 10),
              MortgageDetails1(),
              const SizedBox(height: 10),
              MortgageDetails2(),
              const SizedBox(height: 10),
              AnnualCashFlowAnalysis(),
              const SizedBox(height: 10),
              QuickFlipAnalysis(),
              const SizedBox(height: 10),
              PropertyPurchaseDetails(),
              const SizedBox(height: 10),
              SizedBox(
                height: 45,
                width: Get.width * .9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appColors),
                    onPressed: () {
                      Get.to(() => const AnnualFinancialForecastScreen());
                    },
                    child: Text('Annual Financial Forecast',
                        style: TextStyle(fontSize: 13.sp))),
              ),

              const SizedBox(height: 10),
              SizedBox(
                height: 45,
                width: Get.width * .9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appColors),
                    onPressed: () {
                      Get.to(() => const MtgAmortScheduleListScreen());
                    },
                    child: Text('Mtg Amort Schedule List',
                        style: TextStyle(fontSize: 13.sp))),
              ),
              const SizedBox(height: 10),
              Container(
                height: 45,
                width: Get.width * .9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appColors),
                    onPressed: () {
                      Get.to(() => CompanyListScreen());
                    },
                    child: Text('Company List',
                        style: TextStyle(fontSize: 13.sp))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
