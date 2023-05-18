import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../mtg_amort_schedule1_screen/mtg_amort_schedule1_screen.dart';
import '../mtg_amort_schedule2_screen/mtg_amort_schedule2_screen.dart';

class MtgAmortScheduleListScreen extends StatelessWidget {
  const MtgAmortScheduleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: "Mtg Amort Schedule",
          leadingShow: false,
          actionShow: false),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
                height: 45,
                width: Get.width * .9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appColors),
                    onPressed: () {
                      Get.to(() => MtgAmortSchedule1Screen());
                    },
                    child: Text('1st Mtg Amort Schedule',
                        style: TextStyle(fontSize: 13.sp)))),
            SizedBox(height: 10),
            Container(
              height: 45,
              width: Get.width * .9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appColors),
                  onPressed: () {
                    Get.to(() => MtgAmortSchedule2Screen());
                  },
                  child: Text('2st Mtg Amort Schedule',
                      style: TextStyle(fontSize: 13.sp))),
            ),
          ],
        ).paddingAll(Get.width*.05),
      ),
    );
  }
}
