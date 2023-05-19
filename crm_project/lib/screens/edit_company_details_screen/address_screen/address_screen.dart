import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/address_screen_controller.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common_modules/common_textfield.dart';
import '../../../constants/colors.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);
  final addressScreenController = Get.put(AddressScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(titleText: AppMessage.companyAddress, leadingShow: false, actionShow: false),
      body: SafeArea(
        child: Column(
          children: [
            TextFieldModule(
            fieldController: addressScreenController.searchTextFieldController,
            hintText: 'Search...',
            onChange: (text) {
              print(text.toString());
            },
            backgroundColor: AppColors.whiteColor,
            icon: Icon(Icons.search).paddingOnly(left: 5, right: 5),
            keyboardType: TextInputType.text).paddingAll(10),
            Divider()

          ],
        ),
      ),
    );
  }
}
