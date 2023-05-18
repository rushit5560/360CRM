import 'package:crm_project/common_modules/divider.dart';
import 'package:crm_project/common_modules/text_row.dart';
import 'package:crm_project/constants/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../constants/colors.dart';

class MtgAmortSchedule1ScreenWidget extends StatelessWidget {
  const MtgAmortSchedule1ScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              // height: Get.height*.14,
              width: Get.width,
              decoration: BoxDecoration(
                  color: AppColors.appColors,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                  // border: Border.all(color: AppColors.greyColor)
      ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Balance",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.greyColor,
                      fontSize: 14.sp),
                ).commonOnlyPadding(bottom: 10),

                Text('271600.00\$',style: TextStyle(color: AppColors.whiteColor1,fontWeight: FontWeight.bold,fontSize: 20.sp),)
              ],
            ).paddingAll(20),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
              return Card(
                color: AppColors.appColorsSecondry,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      // border: Border.all(color: AppColors.appColors)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('$index\nMonth',textAlign: TextAlign.center,style: TextStyle(color: AppColors.appColors,fontWeight: FontWeight.bold,fontSize: 12.sp)).paddingAll(5),
                            ],
                          ),
                        ),

                        VerticalDivider(color: AppColors.greyColor,thickness: 1),
                        Expanded(flex: 8,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 3),
                              TextRow(title: 'Payment', subTitle: '1716.70',suffix: '\$', subTitleColor: AppColors.grey700Color),
                              TextRow(title: 'Interest', subTitle: '1471.17',suffix: '\$', subTitleColor: AppColors.grey700Color),
                              TextRow(title: 'Principal', subTitle: '245.53',suffix: '\$', subTitleColor: AppColors.grey700Color),
                              TextRow(title: 'Balance', subTitle: '271354.47',suffix: '\$', subTitleColor: AppColors.grey700Color),
                              TextRow(title: 'Principal Payment', subTitle: '',suffix: '\$', subTitleColor: AppColors.grey700Color),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingAll(10),
                ),
              ).paddingOnly(left: 10,right: 10,bottom: 6);
            },),
          )

        ],
    );
  }
}
