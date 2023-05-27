import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/constants/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_modules/common_loader.dart';
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
      body: Obx(
        () => addressManageScreenController.isLoading.value
            ? CommonLoader().showLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    AddressTextFormFieldModule(),
                  ],
                ).commonSymmetricPaddng(horizontal: 8, vertical: 8),
              ),
      ),
    );
  }
}
