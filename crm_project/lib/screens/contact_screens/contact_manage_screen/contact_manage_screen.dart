import 'package:crm_project/screens/contact_screens/contact_manage_screen/contact_manage_screen_widgets.dart';
import 'package:flutter/cupertino.dart';
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //first name
                      FirstNametextFormFieldModule(),
                      // last name
                      LastNametextFormFieldModule(),
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
                      PhoneTextFormFieldModule(),
                      // phone two module
                      PhoneTwoTextFormFieldModule(),
                      // phone number module
                      PhoneNumberTextFormFieldModule(),
                      // Fax module
                      FaxTextFormFieldModule(),
                      // Other Phone
                      OtherPhoneFaxTextFormFieldModule(),
                      // email one
                      EmailOneTextFormFieldModule(),
                      // email two
                      EmailTwoTextFormFieldModule(),
                      //Messenger Client
                      MessengerClientTextFormFieldModule(),
                      //Messenger ID
                      MessengerIDTextFormFieldModule(),
                      //Email Opt Out and datepicker
                      EmailOptOutAndDatePickerModule(),
                      // active status
                      ActiveStatusModule()
                    ],
                  ).paddingSymmetric(horizontal: 8, vertical: 8),
                ),
              ),
      ),
    );
  }
}
