import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/constants/extension.dart';
import 'package:crm_project/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../../controller/company_module_controllers/address_manage_screen_controller.dart';
import 'address_manage_screen_widgets.dart';

class CompanyManageAddressScreen extends StatelessWidget {
  CompanyManageAddressScreen({Key? key}) : super(key: key);

  final addressManageScreenController =
      Get.put(AddressManageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: addressManageScreenController.appBarHeader.value,
        leadingShow: false,
        actionShow: false,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                addressManageScreenController.appTitleText.value,
                style: TextStyleConfig.textStyle(
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          AddresstextFormFieldModule(),
        ],
      ).commonSymmetricPaddng(horizontal: 10, vertical: 10),
    );
  }
}
