import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_modules/common_loader.dart';
import '../../common_modules/custom_submit_button.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../controller/deal_analyzer_screen_controller.dart';
import '../../utils/messaging.dart';
import 'deal_analyzer_screen_widgets.dart';

class DealAnalyzerScreen extends StatelessWidget {
  DealAnalyzerScreen({Key? key}) : super(key: key);
  final dealAnalyzerScreenController = Get.put(DealAnalyzerScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(
          titleText: "Deal Analyzer",
          leadingShow: false,
          actionShow: false,
          // actionIcon: const Icon(Icons.settings_rounded),
          // actionOnTap: () =>
          //     Get.to(() => SettingScreen(), transition: Transition.zoom),
      ),


      body: Obx(
        ()=> dealAnalyzerScreenController.isLoading.value
          ? CommonLoader().showLoader()
        : SingleChildScrollView(
          child: Column(
            children: [

              Form(
                key: dealAnalyzerScreenController.formKey,
                child: Column(
                  children: [
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
                    const SizedBox(height: 10)
                  ],
                ),
              ),


              CustomSubmitButton(
                labelText: AppMessage.submitLabel,
                onPress: () async {
                  if(dealAnalyzerScreenController.formKey.currentState!.validate()) {
                    await dealAnalyzerScreenController.saveDealAnalyzerFunction();
                  }

                },
              ),
              const SizedBox(height: 10),
            ],
          ).paddingAll(10),
        ),
      ),

    );
  }
}
