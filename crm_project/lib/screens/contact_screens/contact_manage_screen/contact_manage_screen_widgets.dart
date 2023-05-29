import 'package:crm_project/constants/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../models/ledger_screen_model/active_company_list_model.dart';

import '../../../common_modules/common_textfield.dart';
import '../../../constants/colors.dart';
import '../../../controller/company_module_controllers/contact_manage_screen_controller.dart';
import '../../../models/contact_screen_models/active_Contact_category_model.dart';
import '../../../models/contact_screen_models/active_area_of_interest_model.dart';
import '../../../models/contact_screen_models/active_contact_type_model.dart';
import '../../../models/contact_screen_models/get_contact_role_model.dart';
import '../../../utils/validator.dart';

class FirstNametextFormFeildModule extends StatelessWidget {
  FirstNametextFormFeildModule({super.key});

  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "First name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                    color: AppColors.redColor),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.firstNameTextEditingController,
          hintText: "Enter first name",
          keyboardType: TextInputType.text,
          validate: (value) =>
              FieldValidation().validateEmpty(value, 'first name'),
        ),
      ],
    ).commonSymmetricPaddng(vertical: 10);
  }
}

class LastNametextFormFeildModule extends StatelessWidget {
  LastNametextFormFeildModule({super.key});

  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Last name",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.lastNameTextEditingController,
          hintText: "Enter last name",
          keyboardType: TextInputType.text,
          validate: (value) =>
              FieldValidation().validateEmpty(value, 'last name'),
        ),
      ],
    ).commonSymmetricPaddng(vertical: 10);
  }
}

class ContactRoleDropDownModule extends StatelessWidget {
  ContactRoleDropDownModule({Key? key}) : super(key: key);
  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Role",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<ContactRoleData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Role",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              contactManageScreenController.contactRoleDataValue = newValue!;
              contactManageScreenController.loadUI();
            },
            value: contactManageScreenController.contactRoleDataValue,
            items: contactManageScreenController.contactRoleList.map((value) {
              return DropdownMenuItem<ContactRoleData>(
                value: value,
                child: Text(value.name!),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class ContactCategoryDropDownModule extends StatelessWidget {
  ContactCategoryDropDownModule({Key? key}) : super(key: key);
  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Contact Category",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<ContactCategoryData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Contact Category",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              contactManageScreenController.contactDataCategoryTypeValue =
                  newValue!;
              contactManageScreenController.loadUI();
            },
            value: contactManageScreenController.contactDataCategoryTypeValue,
            items: contactManageScreenController.contactCategoryTypeList
                .map((value) {
              return DropdownMenuItem<ContactCategoryData>(
                value: value,
                child: Text(value.contactCategorys!),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class CompanyDropDownModule extends StatelessWidget {
  CompanyDropDownModule({Key? key}) : super(key: key);
  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Company",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<CompanyData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Company",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              contactManageScreenController.companyDataValue = newValue!;
              contactManageScreenController.loadUI();
            },
            value: contactManageScreenController.companyDataValue,
            items: contactManageScreenController.companyList.map((value) {
              return DropdownMenuItem<CompanyData>(
                value: value,
                child: Text(value.companyName!),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class ContactDropDownModule extends StatelessWidget {
  ContactDropDownModule({Key? key}) : super(key: key);
  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Contact Type",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<ContactDataType>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Contact Type",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              contactManageScreenController.contactDataTypeValue = newValue!;
              contactManageScreenController.loadUI();
            },
            value: contactManageScreenController.contactDataTypeValue,
            items: contactManageScreenController.contactTypeList.map((value) {
              return DropdownMenuItem<ContactDataType>(
                value: value,
                child: Text(value.contactTypes.toString()),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class AreaofInterestDropDownModule extends StatelessWidget {
  AreaofInterestDropDownModule({Key? key}) : super(key: key);
  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Area of Interest",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<ActiveAreaOfInterestData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Area of Interest",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              contactManageScreenController.activeAreaOfInterestDataValue =
                  newValue!;
              contactManageScreenController.loadUI();
            },
            value: contactManageScreenController.activeAreaOfInterestDataValue,
            items: contactManageScreenController.activeAreaOfInterestList
                .map((value) {
              return DropdownMenuItem<ActiveAreaOfInterestData>(
                value: value,
                child: Text(value.type.toString()),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class PhoneTextFormFeildModule extends StatelessWidget {
  PhoneTextFormFeildModule({super.key});

  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Phone",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.phoneTextEditingController,
          hintText: "Enter phone",
          keyboardType: TextInputType.number,
          validate: (value) => FieldValidation().validateEmpty(value, 'phone'),
          prifixIcon: Text(
            'US(+1)',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ).commonOnlyPadding(top: 12, bottom: 12, right: 5, left: 10),
        ),
      ],
    ).commonSymmetricPaddng(vertical: 10);
  }
}

class PhoneTwotextFormFeildModule extends StatelessWidget {
  PhoneTwotextFormFeildModule({super.key});

  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Phone 2",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: " *",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.phoneTwoTextEditingController,
          hintText: "Enter phone 2",
          keyboardType: TextInputType.number,
          validate: (value) =>
              FieldValidation().validateEmpty(value, 'phone 2'),
          prifixIcon: Text(
            'US(+1)',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ).commonOnlyPadding(top: 12, bottom: 12, right: 5, left: 10),
        ),
      ],
    ).commonSymmetricPaddng(vertical: 10);
  }
}
