import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:crm_project/common_modules/common_lable.dart';
import 'package:crm_project/common_modules/divider.dart';
import 'package:crm_project/common_modules/text_row.dart';
import 'package:crm_project/controller/annual%20_financial_forecast_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

class AnnualFinancialForecastDetailsWidget extends StatelessWidget {
  AnnualFinancialForecastDetailsWidget({Key? key}) : super(key: key);
  final annualFinancialForecastController =
      Get.put(AnnualFinancialForecastController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: Get.width * 0.5,
              child: CustomDropdown(
                hintText: 'Sealect Year',
                items: annualFinancialForecastController.yearDownList,
                controller: TextEditingController(),
                borderSide: BorderSide(color: AppColors.greyColor, width: 1),
                onChanged: (val) {
                  annualFinancialForecastController.selectedYear.value = val;
                  annualFinancialForecastController.loadUI();
                },
              ).paddingAll(10),
            ),
          ],
        ),

//income
        CommonLabel(
            color: AppColors.greyColor,
            bgColor: AppColors.appColorsSecondry,
            title: 'Income',
            icon: Icons.list_alt_outlined),
        Column(
          children: [
            TextRow(
                title: 'Gross Scheduled Income',
                subTitle: '50220',
                suffix: "\$"),
            const SizedBox(height: 5),
            SubTextRow(
                title: 'Gross Scheduled Income',
                subTitle: '5050.00',
                suffix: "\$"),
            const SizedBox(height: 5),
            CustomDivider(),
            const SizedBox(
              height: 5,
            ),
            TextRow(
                title: 'Effective Rental Income',
                subTitle: '45468.00',
                suffix: "\$",
                subTitleColor: AppColors.blackColor),
            const SizedBox(height: 5),
            CustomDivider(),
            const SizedBox(height: 5),
          ],
        ).paddingAll(10),

//Operating Expenses
        CommonLabel(
            color: AppColors.orangeColor,
            bgColor: AppColors.appColorsSecondry,
            title: 'Operating Expenses',
            icon: Icons.menu_open_sharp),
        Column(
          children: [
            SubTextRow(
              title: 'Utilities',
              subTitle: '1500.00',
              suffix: '\$',
            ),
            const SizedBox(
              height: 5,
            ),
            SubTextRow(
              title: 'Taxes',
              subTitle: '1500.00',
              suffix: '\$',
            ),
            const SizedBox(
              height: 5,
            ),
            SubTextRow(
              title: 'Insurance',
              subTitle: '1140.00',
              suffix: '\$',
            ),
            const SizedBox(
              height: 5,
            ),
            SubTextRow(
              title: 'Condo/Association Fees',
              subTitle: '2700.00',
              suffix: '\$',
            ),
            const SizedBox(
              height: 5,
            ),
            SubTextRow(
              title: 'Administrative Expenses',
              subTitle: '7200.00',
              suffix: '\$',
            ),
            const SizedBox(
              height: 5,
            ),
            SubTextRow(
              title: 'Repairs & Maintenance',
              subTitle: '18000.00',
              suffix: '\$',
            ),
            const SizedBox(
              height: 5,
            ),
            SubTextRow(
              title: 'Management Fees',
              subTitle: '5050.00',
              suffix: '\$',
            ),
            const SizedBox(
              height: 5,
            ),
            CustomDivider(),
            const SizedBox(
              height: 5,
            ),
            TextRow(
                title: 'Total Operating Expenses',
                subTitle: '37092.00',
                suffix: '\$',
                subTitleColor: AppColors.blackColor),
            const SizedBox(
              height: 5,
            ),
            CustomDivider(),
          ],
        ).paddingAll(10),

//Net Operating Income
        CommonLabel(
            color: AppColors.blueColor,
            bgColor: AppColors.appColorsSecondry,
            title: 'Net Operating Income',
            icon: Icons.cases_outlined),
        Column(
          children: [
            const SizedBox(height: 5),
            SubTextRow(
              title: 'Effective Rental Income',
              subTitle: '45468.00',
              suffix: '\$',
            ),
            const SizedBox(
              height: 5,
            ),
            SubTextRow(
              title: 'Operating Expenses',
              subTitle: '37092.00',
              suffix: '\$',
            ),
            const SizedBox(
              height: 5,
            ),
            CustomDivider(),
            const SizedBox(
              height: 5,
            ),
            TextRow(
                title: 'Net Operating Income',
                subTitle: '8376.00',
                suffix: '\$',
                subTitleColor: AppColors.blackColor),
            const SizedBox(
              height: 5,
            ),
            CustomDivider(),
          ],
        ).paddingAll(10),

//Debt Service
        CommonLabel(
            color: AppColors.carolinColors,
            bgColor: AppColors.appColorsSecondry,
            title: 'Debt Service',
            icon: Icons.data_exploration_outlined),
        Column(
          children: [
            const SizedBox(height: 5),
            TextRow(
              title: '1st Mortgage p&i',
              subTitle: '20600.36',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            TextRow(
              title: '2st Mortgage p&i',
              subTitle: '324.75',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            CustomDivider(),
            const SizedBox(height: 5),
            TextRow(
                title: 'Annual Debt Service',
                subTitle: '20925.11',
                suffix: '\$',
                subTitleColor: AppColors.blackColor),
            const SizedBox(height: 5),
            CustomDivider(),
          ],
        ).paddingAll(10),
//Cash Flow Before Taxes
        CommonLabel(
            color: AppColors.naveyColors,
            bgColor: AppColors.appColorsSecondry,
            title: 'Cash Flow Before Taxes',
            icon: Icons.deblur),
        Column(
          children: [
            const SizedBox(height: 5),
            TextRow(
              title: 'Net Operating Income',
              subTitle: '8376.00',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            TextRow(
              title: '1st Mortgage Interest',
              subTitle: '17464.61',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            TextRow(
              title: '2st Mortgage Interest',
              subTitle: '324.75',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            TextRow(
              title: 'Loan Points Deduction',
              subTitle: '5582.00',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            TextRow(
              title: 'Depreciation',
              subTitle: '12181.82',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            CustomDivider(),
            const SizedBox(height: 5),
            TextRow(
                title: 'Estimated Taxable Income',
                subTitle: '12177.18',
                suffix: '\$',
                subTitleColor: AppColors.blackColor),
            const SizedBox(height: 5),
            TextRow(
                title: 'Tax Bracket',
                subTitle: '28',
                suffix: '%',
                subTitleColor: AppColors.blackColor),
            const SizedBox(height: 5),
            TextRow(
                title: 'Estimated Tax Liability',
                subTitle: '7609.91',
                suffix: '\$',
                subTitleColor: AppColors.blackColor),
            const SizedBox(height: 5),
            CustomDivider(),
          ],
        ).paddingAll(10),
//Cash Flow after Taxes
        CommonLabel(
            color: AppColors.tealColors,
            bgColor: AppColors.appColorsSecondry,
            title: 'Cash Flow After Taxes',
            icon: Icons.data_usage_rounded),
        Column(
          children: [
            const SizedBox(height: 5),
            TextRow(
              title: 'Cash Flow Before Taxes',
              subTitle: '12549.11',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            TextRow(
              title: 'Estimated Tax Liability',
              subTitle: '7609.61',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            CustomDivider(),
            const SizedBox(height: 5),
            TextRow(
                title: 'Estimated Cash Flow After Taxes',
                subTitle: '4939.50',
                suffix: '\$',
                subTitleColor: AppColors.blackColor),
            const SizedBox(height: 5),
            CustomDivider(),
          ],
        ).paddingAll(10),
//Financial Analysis
        CommonLabel(
            color: AppColors.darkerColors,
            bgColor: AppColors.appColorsSecondry,
            title: 'Financial Analysis',
            icon: Icons.find_in_page_outlined),
        Column(
          children: [
            const SizedBox(height: 5),
            TextRow(
              title: 'Net Operating Income',
              subTitle: '8376.00',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            SubTextRow(
              title: 'Annual Debt Service',
              subTitle: '20925.11',
              suffix: '\$',
            ),
            const SizedBox(height: 5),
            CustomDivider(),
            const SizedBox(height: 5),
            TextRow(
                title: 'Annual Cash Flow',
                subTitle: '12491.11',
                suffix: '\$',
                subTitleColor: AppColors.blackColor),
            const SizedBox(height: 5),
            TextRow(
                title: 'Total Out of Pocket',
                subTitle: '51103.50',
                suffix: '\$',
                subTitleColor: AppColors.blackColor),
            const SizedBox(height: 5),
            TextRow(
                title: 'Return of Cash Flow',
                subTitle: '-24.56',
                suffix: '%',
                subTitleColor: AppColors.blackColor),
            const SizedBox(height: 5),
            CustomDivider(),
          ],
        ).paddingAll(10),
      ],
    );
  }
}
