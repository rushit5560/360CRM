import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/address_screen_controller.dart';
import 'package:crm_project/screens/edit_company_details_screen/address_screen/address_screen_widget.dart';
import 'package:crm_project/screens/edit_company_details_screen/address_screen/manage_address_screen/manage_address_screen.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/common_textfield.dart';
import '../../../common_modules/divider.dart';
import '../../../constants/colors.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);
  final addressScreenController = Get.put(AddressScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: AppMessage.companyAddress,
          leadingShow: false,
          actionShow: false),
      body: SafeArea(
        child: Column(children: [
          AddressSearchWidget(),
          AddressListWidget()
        ]).paddingAll(15),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'b',
        onPressed: () {
          Get.to(()=> const ManageAddressScreen());
        },
        backgroundColor: AppColors.appColors,
        child: Icon(Icons.add),
      ),
    );
  }
}
