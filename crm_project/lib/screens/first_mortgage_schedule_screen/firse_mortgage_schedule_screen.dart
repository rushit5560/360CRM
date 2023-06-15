import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar.dart';

class FirstMortgageScheduleScreen extends StatelessWidget {
  const FirstMortgageScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "First mortgage schedule",
        leadingShow: false,
        actionShow: false,
      ),
      body: Column(
        children: [
          
        ],
      ).paddingAll(10),
    );
  }
}
