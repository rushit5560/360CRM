import 'dart:developer';

import 'package:crm_project/common_modules/common_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/address_manage_screen_controller.dart';

class AddresstextFormFieldModule extends StatelessWidget {
  AddresstextFormFieldModule({Key? key}) : super(key: key);
  final addressManageScreenController =
      Get.put(AddressManageScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => addressManageScreenController.isLoading.value
          ? CommonLoader().showLoader()
          : Form(
              key: addressManageScreenController.addressFormKey,
              child: Column(
                children: [
                  Obx(
                    () => Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: AppColors.appColors, width: 1)),
                      child: addressManageScreenController.isLoading.value
                          ? Container()
                          : DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text(
                                  addressManageScreenController
                                      .addressTypeSelect.value,
                                  style: const TextStyle(
                                      color: AppColors.appColors),
                                ),
                                // Not necessary for Option 1
                                onChanged: (newValue) async {
                                  addressManageScreenController
                                          .addressTypeSelect.value =
                                      newValue!.addressTypes.toString();
                                  addressManageScreenController
                                      .addressTypeIdFindFunction();
                                  log('new address Type :  ${addressManageScreenController.addressTypeSelect.value}');
                                },
                                items: addressManageScreenController
                                    .addressTypeListDropDown
                                    .map((address) {
                                  return DropdownMenuItem(
                                    value: address,
                                    child: Text(address.addressTypes),
                                  );
                                }).toList(),
                              ),
                            ).paddingOnly(left: 8, right: 8),
                    ),
                  ).paddingOnly(left: 5, right: 5, bottom: 10),
                  const SizedBox(height: 10),
                  Obx(
                    () => Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: AppColors.appColors, width: 1)),
                      child: addressManageScreenController.isLoading.value
                          ? Container()
                          : DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text(
                                  addressManageScreenController
                                      .stateTypeSelect.value,
                                  style: const TextStyle(
                                    color: AppColors.appColors,
                                  ),
                                ),
                                // Not necessary for Option 1
                                onChanged: (newValue) async {
                                  int stateId = addressManageScreenController
                                      .stateSelectedItem!.stateId;
                                  addressManageScreenController.stateTypeSelect
                                      .value = newValue!.stateName.toString();
                                  addressManageScreenController
                                      .stateTypeIdFindFunction();

                                  await addressManageScreenController
                                      .getAllStateWiseCityFunction(
                                          stateId.toString());
                                  log("stateId.toString : $stateId");
                                  log('new state Type :  ${addressManageScreenController.stateTypeSelect.value}');
                                },
                                items: addressManageScreenController
                                    .stateListDropDown
                                    .map((state) {
                                  return DropdownMenuItem(
                                    value: state,
                                    child: Text(state.stateName),
                                  );
                                }).toList(),
                              ),
                            ).paddingOnly(left: 8, right: 8),
                    ),
                  ).paddingOnly(left: 5, right: 5, bottom: 10),
                  const SizedBox(height: 10),
                  Obx(
                    () => Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: AppColors.appColors, width: 1)),
                      child: addressManageScreenController.isLoading.value
                          ? Container()
                          : DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text(
                                  addressManageScreenController
                                      .cityTypeSelect.value,
                                  style: const TextStyle(
                                    color: AppColors.appColors,
                                  ),
                                ),
                                // Not necessary for Option 1
                                onChanged: (newValue) async {
                                  // int stateId = addressManageScreenController
                                  //     .stateSelectedItem!.stateId;
                                  addressManageScreenController.cityTypeSelect
                                      .value = newValue!.cityName.toString();
                                  addressManageScreenController
                                      .cityTypeIdFindFunction();

                                  // await addressManageScreenController
                                  //     .getAllStateWiseCityFunction(
                                  //     stateId.toString());
                                  // log("stateId.toString : $stateId");
                                  log('new state Type :  ${addressManageScreenController.cityTypeSelect.value}');
                                },
                                items: addressManageScreenController
                                    .cityListDropDown
                                    .map((city) {
                                  return DropdownMenuItem(
                                    value: city,
                                    child: Text(city.cityName),
                                  );
                                }).toList(),
                              ),
                            ).paddingOnly(left: 8, right: 8),
                    ),
                  ).paddingOnly(left: 5, right: 5, bottom: 10),
                ],
              ),
            ),
    );
  }
}
