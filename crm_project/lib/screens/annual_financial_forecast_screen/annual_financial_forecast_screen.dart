import 'package:crm_project/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_appbar.dart';
import 'annual_financial_forecast_screen_widgets.dart';

class AnnualFinancialForecastScreen extends StatelessWidget {
  const AnnualFinancialForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(titleText: 'Annual Financial Forecast' ,actionShow: false,leadingShow: false),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [
              AnnualFinancialForecastDetailsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
