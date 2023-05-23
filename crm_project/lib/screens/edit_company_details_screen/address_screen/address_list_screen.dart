import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/address_list_screen_controller.dart';
import 'package:crm_project/screens/edit_company_details_screen/address_screen/address_list_screen_widget.dart';
import 'package:crm_project/screens/edit_company_details_screen/address_screen/address_manage_screen/address_manage_screen.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class CompanyAddressListScreen extends StatelessWidget {
  CompanyAddressListScreen({Key? key}) : super(key: key);
  final addressListScreenController = Get.put(AddressListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: AppMessage.companyAddress,
          leadingShow: false,
          actionShow: false),
      body: SafeArea(
        child: Column(children: [AddressSearchWidget(), AddressListWidget()])
            .paddingAll(15),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'b',
        onPressed: () {
          Get.to(
            () => const CompanyManageAddressScreen(),
          );
        },
        backgroundColor: AppColors.appColors,
        child: const Icon(Icons.add),
      ),
    );
  }
}
