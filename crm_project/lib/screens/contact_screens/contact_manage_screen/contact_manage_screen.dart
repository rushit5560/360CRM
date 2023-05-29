import 'package:crm_project/screens/contact_screens/contact_manage_screen/contact_manage_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_loader.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/colors.dart';
import '../../../controller/company_module_controllers/contact_manage_screen_controller.dart';

class ContactManageScreen extends StatelessWidget {
  ContactManageScreen({super.key});
  final contactManageScreenController =
      Get.put(ContactManageScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
        actionShow: false,
        leadingShow: false,
        titleText: contactManageScreenController.appBarHeader.value,
      ),
      body: Obx(
        () => contactManageScreenController.isLoading.value
            ? CommonLoader().showLoader()
            : SingleChildScrollView(
                child: Form(
                  key: contactManageScreenController.contactGlobalKey,
                  child: Column(
                    children: [
                      //first name
                      FirstNametextFormFeildModule(),
                      // last name
                      LastNametextFormFeildModule(),
                      // contact role
                      ContactRoleDropDownModule(),
                      // Contact Category
                      ContactCategoryDropDownModule(),

                      // Company Module
                      CompanyDropDownModule(),

                      // Contact Module
                      ContactDropDownModule(),

                      // AreaofInterest Module
                      AreaofInterestDropDownModule(),
// phone module
                      PhoneTextFormFeildModule(),
                      // phone two module
                      PhoneTwotextFormFeildModule(),
                    ],
                  ).paddingSymmetric(horizontal: 8, vertical: 8),
                ),
              ),
      ),
    );
  }
}
