import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/common_listtile_module.dart';
import '../../constants/colors.dart';
import '../../utils/messaging.dart';

class EditCompanyDetailsScreen extends StatelessWidget {


  String companyName;
  EditCompanyDetailsScreen({required this.companyName});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: CustomAppBar(
        actionShow: false, leadingShow: false, titleText: companyName),
    body: SingleChildScrollView(
      child: Column(
        children: [
          CommonListTitleModule(
            icon: Icon(Icons.home,size: 20.sp),
            titleText: AppMessage.details,
          ),
          CommonListTitleModule(
            icon: Icon(Icons.home,size: 20.sp),
            titleText: AppMessage.details,
          ),
          CommonListTitleModule(
            icon: Icon(Icons.home,size: 20.sp),
            titleText: AppMessage.details,
          ),
        ],
      ).paddingAll(10),

    )
    );
  }
}
