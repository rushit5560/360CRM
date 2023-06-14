import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:crm_project/controller/home_screen_controller.dart';
import 'package:crm_project/screens/activity_list_screen/activity_list_screen.dart';
import 'package:crm_project/screens/annual_financial_forecast_screen/annual_financial_forecast_screen.dart';
import 'package:crm_project/screens/company_list_screen/company_list_screen.dart';
import 'package:crm_project/screens/home_screen/home_screen_widgets.dart';
import 'package:crm_project/screens/mtg_amort_schedule/mtg_amort_schedule_list_screen.dart';
import 'package:crm_project/screens/setting_screen/setting_screen.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/custom_submit_button.dart';

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
      body: Obx(
        ()=> homeScreenController.isLoading.value
        ? CommonLoader().showLoader()
        : SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView(
                  shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                  children: [
//Company List
                    InkWell(
                      onTap: (){
                        Get.to(() => CompanyListScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.grey200Color,
                          borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.maps_home_work_outlined,color: AppColors.appColors,size: Get.width*.1,),
                            Text(AppMessage.companyList,textAlign: TextAlign.center,maxLines: 2,style: TextStyle( color:AppColors.appColors),),
                          ],
                        ),
                      ),
                    ),
//Activity List
                    InkWell(
                      onTap: (){
                        Get.to(() => ActivityListScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.grey200Color,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time_rounded,color: AppColors.appColors,size: Get.width*.1,),
                            const Text(AppMessage.activityList,textAlign: TextAlign.center,maxLines: 2,style: TextStyle( color:AppColors.appColors),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
//company List

                const SizedBox(height: 10),
//Anual Financial Forecast
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
//mtg amort schedule list
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
                PropertyDetails(),
                const SizedBox(height: 10),
                FinancialDetails(),
                const SizedBox(height: 10),
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
                /*PropertyPurchaseDetails(),
                const SizedBox(height: 10),*/
                CustomSubmitButton(
                  labelText: AppMessage.submitLabel,
                  onPress: () async {

                  },
                ),
                const SizedBox(height: 10),
                // QuickFlip(),
                // const SizedBox(height: 10),
                // LongTermCashFlow(),
                // const SizedBox(height: 10),
                // ProjectCosts2(),
                // const SizedBox(height: 10),
                // CarryingCosts(),
                // const SizedBox(height: 10),
                // SellingCost(),
                // const SizedBox(height: 10),
              ],
            ).paddingAll(10),
          ),
        ),
      ),
    );
  }
}
