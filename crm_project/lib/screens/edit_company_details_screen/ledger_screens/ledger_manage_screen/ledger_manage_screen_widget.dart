import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_modules/common_loader.dart';
import '../../../../constants/colors.dart';
import '../../../../models/ledger_screen_model/active_property_management_screen_model.dart';
import '../../../../controller/company_module_controllers/ledger_manage_screen_controller.dart';
import '../../../../models/ledger_screen_model/active_category_type_list_model.dart';
import '../../../../models/ledger_screen_model/active_company_list_model.dart';
import '../../../../models/ledger_screen_model/active_contact_model.dart';
import '../../../../models/ledger_screen_model/active_lease_model.dart';
import '../../../../models/ledger_screen_model/active_marketing_model.dart';
import '../../../../models/ledger_screen_model/active_mortgage_model.dart';
import '../../../../models/ledger_screen_model/active_property_model.dart';
import '../../../../models/ledger_screen_model/active_prospect_screen_model.dart';
import '../../../../models/ledger_screen_model/active_work_order_list_model.dart';
import '../../../../utils/enums.dart';

class TypeDropdownModule extends StatelessWidget {
  TypeDropdownModule({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.appColors, width: 1.5),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(border: InputBorder.none),
        hint: const Text(
          "Select Ledger Type",
          style: TextStyle(color: AppColors.appColors),
        ),
        // Not necessary for Option 1
        onChanged: (newValue) async {
          screenController.selectedTypeValue.value = newValue!;
          screenController.loadUI();
        },
        items: screenController.typeList.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ).paddingSymmetric(horizontal: 8),
    );
  }
}

class AccountCategoryDropDownModule extends StatelessWidget {
  AccountCategoryDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Account Category",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<CategoryTypeData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Account Category",
              style: TextStyle(color: AppColors.appColors),
            ),
            value: screenController.categoryTypeDataValue,
            onChanged: (newValue) async {
              screenController.categoryTypeDataValue = newValue!;
              screenController.categoryTypeIdFindFunction();
              screenController.loadUI();
            },
            items: screenController.categoryTypeList.map((value) {
              return DropdownMenuItem<CategoryTypeData>(
                value: value,
                child: Text(value.category!),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class PropertyDropDownModule extends StatelessWidget {
  PropertyDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Property",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<PropertyData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Property",
              style: TextStyle(color: AppColors.appColors),
            ),
            value: screenController.propertyDataValue,
            onChanged: (newValue) async {
              screenController.propertyDataValue = newValue!;
              screenController.loadUI();
            },
            items: screenController.propertyList.map((value) {
              return DropdownMenuItem<PropertyData>(
                value: value,
                child: Text(value.propertyName!),
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
  final screenController = Get.find<LedgerManageScreenController>();

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
                color: AppColors.blackColor.withOpacity(0.6)),
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
              screenController.companyDataValue = newValue!;
              screenController.loadUI();
            },
            value: screenController.companyDataValue,
            items: screenController.companyList.map((value) {
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

class WorkOrderDropDownModule extends StatelessWidget {
  WorkOrderDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Work Order",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<WorkOrderData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Work Order",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              screenController.workOrderDataValue = newValue!;
              screenController.loadUI();
            },
            value: screenController.workOrderDataValue,
            items: screenController.workOrderList.map((value) {
              return DropdownMenuItem<WorkOrderData>(
                value: value,
                child: Text(value.workOrderDetails!),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class MarketingDropDownModule extends StatelessWidget {
  MarketingDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Marketing",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<MarketingData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Marketing",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              screenController.marketingDataValue = newValue!;
              screenController.loadUI();
            },
            value: screenController.marketingDataValue,
            items: screenController.marketingList.map((value) {
              return DropdownMenuItem<MarketingData>(
                value: value,
                child: Text(value.campaignName!),
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
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Contact",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<ContactData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Contact",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              screenController.contactDataValue = newValue!;
              screenController.loadUI();
            },
            value: screenController.contactDataValue,
            items: screenController.contactList.map((value) {
              return DropdownMenuItem<ContactData>(
                value: value,
                child: Text("${value.firstName} ${value.lastName}"),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class MortgageDropDownModule extends StatelessWidget {
  MortgageDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Mortgage",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<MortgageData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Mortgage",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              screenController.mortgageDataValue = newValue!;
              screenController.loadUI();
            },
            value: screenController.mortgageDataValue,
            items: screenController.mortgageList.map((value) {
              return DropdownMenuItem<MortgageData>(
                value: value,
                child: Text("${value.mortgageName}"),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class LeaseDropDownModule extends StatelessWidget {
  LeaseDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Lease",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<LeaseData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Lease",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              screenController.leaseDataValue = newValue!;
              screenController.loadUI();
            },
            value: screenController.leaseDataValue,
            items: screenController.leaseList.map((value) {
              return DropdownMenuItem<LeaseData>(
                value: value,
                child: Text("${value.gracePeriod}"),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class PropertyManagementDropDownModule extends StatelessWidget {
  PropertyManagementDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Property Managemen",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<PropertyManagementData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select PropertyManagemen",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              screenController.propertyManagementDataValue = newValue!;
              screenController.loadUI();
            },
            value: screenController.propertyManagementDataValue,
            items: screenController.propertyManagementList.map((value) {
              return DropdownMenuItem<PropertyManagementData>(
                value: value,
                child: Text("${value.terminationTerms}"),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class ProspectDropDownModule extends StatelessWidget {
  ProspectDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Prospect",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: AppColors.blackColor.withOpacity(0.6)),
          ),
        ).paddingOnly(bottom: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.appColors, width: 1.5),
          ),
          child: DropdownButtonFormField<ProspectManageData>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: const Text(
              "Select Prospect",
              style: TextStyle(color: AppColors.appColors),
            ),
            // Not necessary for Option 1
            onChanged: (newValue) async {
              screenController.prospectManageDataValue = newValue!;
              screenController.loadUI();
            },
            value: screenController.prospectManageDataValue,
            items: screenController.prospectManageList.map((value) {
              return DropdownMenuItem<ProspectManageData>(
                value: value,
                child: Text("${value.propertyAddress}"),
              );
            }).toList(),
          ).paddingSymmetric(horizontal: 8),
        ),
      ],
    ).paddingSymmetric(vertical: 10);
  }
}

class CupertinoSwitchAndbuttonmodule extends StatelessWidget {
  CupertinoSwitchAndbuttonmodule({Key? key}) : super(key: key);
  final screenController = Get.find<LedgerManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => screenController.isLoading.value
              ? Container()
              : Transform.scale(
                  alignment: AlignmentDirectional.centerStart,
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: AppColors.appColors,
                    trackColor: AppColors.appColorsSecondry,
                    value: screenController.isLedgerStatus.value,
                    onChanged: (value) async {
                      screenController.isLedgerStatus.value = value;
                    },
                  ),
                ),
        ),
        SizedBox(
          height: 5.5.h,
          child: Obx(
            () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appColors),
              onPressed: () {
                if (screenController.ledgerGlobalKey.currentState!.validate()) {
                  if (screenController.categoryTypeId.value == "") {
                    Fluttertoast.showToast(
                      msg: 'Please select account category type.',
                      backgroundColor: AppColors.redColor,
                    );
                  } else {
                    // LedgerOption.update ==
                    //     screenController
                    //         .ledgerOption
                    //     ? screenController
                    //     .updateCompanyDetails()
                    //     : screenController
                    //     .addCompanyDetails();
                  }
                }
              },
              child: screenController.isLoading.value
                  ? Center(
                      child: CommonLoader().showLoader(),
                    ).paddingAll(5)
                  : CompanyOption.update == screenController.ledgerOption
                      ? const Text('Update')
                      : const Text('Submit'),
            ),
          ),
        ),
      ],
    );
  }
}
