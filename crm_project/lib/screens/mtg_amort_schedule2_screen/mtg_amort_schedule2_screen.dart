import 'package:crm_project/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_appbar.dart';
import 'mtg_amort_schedule2_screen_widgets.dart';

class MtgAmortSchedule2Screen extends StatelessWidget {
  const MtgAmortSchedule2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: '2st Mtg Amort Schedule',
          leadingShow: false,
          actionShow: false),
      body: SafeArea(
        child: MtgAmortSchedule2ScreenWidget(),

      ),
    );
  }
}
