import 'dart:developer';

import 'package:crm_project/constants/extension.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../models/ledger_screen_model/active_company_list_model.dart';

import '../../../common_modules/common_loader.dart';
import '../../../common_modules/common_textfield.dart';
import '../../../common_modules/common_toast_module.dart';
import '../../../constants/colors.dart';
import '../../../controller/company_module_controllers/contact_module_controller/contact_manage_screen_controller.dart';
import '../../../models/contact_screen_models/active_Contact_category_model.dart';
import '../../../models/contact_screen_models/active_area_of_interest_model.dart';
import '../../../models/contact_screen_models/active_contact_type_model.dart';
import '../../../models/contact_screen_models/get_contact_role_model.dart';
import '../../../utils/validator.dart';

class FirstNametextFormFieldModule extends StatelessWidget {
  FirstNametextFormFieldModule({super.key});

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

class LastNametextFormFieldModule extends StatelessWidget {
  LastNametextFormFieldModule({super.key});

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
                    color: AppColors.redColor),
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
              // contactManageScreenController.contactRoleIdGetFunction();
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

class PhoneTextFormFieldModule extends StatelessWidget {
  PhoneTextFormFieldModule({super.key});

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
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.phoneTextEditingController,
          hintText: "Enter phone",
          keyboardType: TextInputType.number,
          maxLength: 10,
          // validate: (value) => FieldValidation().validateEmpty(value, 'phone'),
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

class PhoneTwoTextFormFieldModule extends StatelessWidget {
  PhoneTwoTextFormFieldModule({super.key});

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
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.phoneTwoTextEditingController,
          hintText: "Enter phone 2",
          maxLength: 10,

          keyboardType: TextInputType.number,
          // validate: (value) =>
          //     FieldValidation().validateEmpty(value, 'phone 2'),
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

class PhoneNumberTextFormFieldModule extends StatelessWidget {
  PhoneNumberTextFormFieldModule({super.key});

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
            text: "Phone number",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.phoneNumberTextEditingController,
          hintText: "Enter phone number",
          maxLength: 10,

          keyboardType: TextInputType.number,
          // validate: (value) =>
          //     FieldValidation().validateEmpty(value, 'phone number'),
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

class FaxTextFormFieldModule extends StatelessWidget {
  FaxTextFormFieldModule({super.key});

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
            text: "Fax",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.faxTextEditingController,
          hintText: "Enter fax",
          keyboardType: TextInputType.number,
          // validate: (value) =>
          //     FieldValidation().validateEmpty(value, 'fax'),
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

class OtherPhoneFaxTextFormFieldModule extends StatelessWidget {
  OtherPhoneFaxTextFormFieldModule({super.key});

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
            text: "Other phone",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.otherTextEditingController,
          hintText: "Enter other phone",
          maxLength: 10,
          keyboardType: TextInputType.number,
          // validate: (value) =>
          //     FieldValidation().validateEmpty(value, 'other phone'),
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

class EmailOneTextFormFieldModule extends StatelessWidget {
  EmailOneTextFormFieldModule({super.key});

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
            text: "Email 1",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.emailOneTextEditingController,
          hintText: "Enter email 1",
          keyboardType: TextInputType.text,
        ),
      ],
    ).commonSymmetricPaddng(vertical: 10);
  }
}

class EmailTwoTextFormFieldModule extends StatelessWidget {
  EmailTwoTextFormFieldModule({super.key});

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
            text: "Email 2",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.emailTwoTextEditingController,
          hintText: "Enter email 2",
          keyboardType: TextInputType.text,
        ),
      ],
    ).commonSymmetricPaddng(vertical: 10);
  }
}

class MessengerClientTextFormFieldModule extends StatelessWidget {
  MessengerClientTextFormFieldModule({super.key});

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
            text: "Messenger Client",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController: contactManageScreenController
              .messengerClientTextEditingController,
          hintText: "Enter messenger client",
          keyboardType: TextInputType.text,
        ),
      ],
    ).commonSymmetricPaddng(vertical: 10);
  }
}

class MessengerIDTextFormFieldModule extends StatelessWidget {
  MessengerIDTextFormFieldModule({super.key});

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
            text: "Messenger ID",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
          ),
        ).paddingOnly(bottom: 5),
        TextFieldModule(
          fieldController:
              contactManageScreenController.messengerIDTextEditingController,
          hintText: "Enter messenger id",
          keyboardType: TextInputType.number,
        ),
      ],
    ).commonSymmetricPaddng(vertical: 10);
  }
}

class EmailOptOutAndDatePickerModule extends StatelessWidget {
  EmailOptOutAndDatePickerModule({super.key});

  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: "Email Opt Out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                    color: AppColors.blackColor.withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Obx(
                () => Transform.scale(
                  alignment: AlignmentDirectional.centerStart,
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: AppColors.appColors,
                    trackColor: AppColors.appColorsSecondry,
                    value:
                        contactManageScreenController.isEmailOptOutStatus.value,
                    onChanged: (value) async {
                      contactManageScreenController.isEmailOptOutStatus.value =
                          value;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: "Opt Out Date",
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
                          color: AppColors.redColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.appColors, width: 1.5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => Text(
                          contactManageScreenController.showDate.value,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ).paddingOnly(left: 10),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async =>
                          await contactManageScreenController.selectDate(
                        context: context,
                        initialDate: contactManageScreenController.date,
                      ),
                      child: SizedBox(
                        child: Center(
                          child: const Icon(Icons.calendar_today_outlined)
                              .paddingAll(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ).paddingOnly(bottom: 5),
            ],
          ).commonSymmetricPaddng(vertical: 10),
        ),
      ],
    );
  }
}

class ActiveStatusModule extends StatelessWidget {
  ActiveStatusModule({super.key});

  final contactManageScreenController =
      Get.find<ContactManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: "Active",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: AppColors.blackColor.withOpacity(0.6),
                ),
              ),
            ),
            Obx(
              () => Transform.scale(
                alignment: AlignmentDirectional.centerStart,
                scale: 0.8,
                child: CupertinoSwitch(
                  activeColor: AppColors.appColors,
                  trackColor: AppColors.appColorsSecondry,
                  value:
                      contactManageScreenController.isContactActiveStatus.value,
                  onChanged: (value) async {
                    contactManageScreenController.isContactActiveStatus.value =
                        value;
                    log('isContactActiveStatus :${contactManageScreenController.isContactActiveStatus.value}');
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.5.h,
          child: Obx(
            () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appColors),
              onPressed: () {
                if (contactManageScreenController.contactGlobalKey.currentState!
                    .validate()) {
                  if (contactManageScreenController.showDate.value == "") {
                    CommonToastModule(msg: "Please select opt out date.");
                  } else if (
// ignore: unrelated_type_equality_checks
                      contactManageScreenController
                              .contactRoleDataValue.contactRoleId ==
                          "Select Role") {
                    CommonToastModule(msg: "please Select Role");
                  } else {
                    ContactOption.update ==
                            contactManageScreenController.contactOption
                        ? contactManageScreenController.updateContactFunction()
                        : contactManageScreenController.addContactFunction();
                  }
                }

                //  AddressOption.update ==
                //               addressManageScreenController.addressOption
                //           ? addressManageScreenController
                //               .updateAddressDetailsFunction()
                //           : addressManageScreenController.addAddressDetails();
              },
              child: contactManageScreenController.isLoading.value
                  ? Center(
                      child: CommonLoader().showLoader(),
                    ).paddingAll(5)
                  : Text(contactManageScreenController.appTitleText.value),
            ),
          ),
        ),
      ],
    );
  }
}
