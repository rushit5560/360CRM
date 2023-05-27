import 'dart:developer';

import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/models/address_manage_screen_model/get_all_state_model.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_textfield.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/address_manage_screen_controller.dart';
import '../../../../models/address_manage_screen_model/city_get_by_id_model.dart';
import '../../../../utils/validator.dart';

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
                  const SizedBox(height: 15),
                  TextFieldModule(
                    fieldController:
                        addressManageScreenController.addressOneFieldController,
                    hintText: 'Address 1',
                    keyboardType: TextInputType.text,
                    validate: (value) =>
                        FieldValidation().validateEmpty(value, 'address 1'),
                  ),
                  const SizedBox(height: 15),
                  TextFieldModule(
                    fieldController:
                        addressManageScreenController.addressTwoFieldController,
                    hintText: 'Address 2',
                    keyboardType: TextInputType.text,
                    validate: (value) =>
                        FieldValidation().validateEmpty(value, 'address 2'),
                  ),
                  const SizedBox(height: 15),
                  TextFieldModule(
                    fieldController:
                        addressManageScreenController.zipCodeFieldController,
                    hintText: 'Zipcode',
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    validate: (value) =>
                        FieldValidation().validateEmpty(value, 'Zipcode'),
                  ),
                  const SizedBox(height: 15),
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
                              child: DropdownButton<StateList>(
                                hint: Text(
                                  addressManageScreenController
                                      .stateTypeSelect.value,
                                  style: const TextStyle(
                                      color: AppColors.appColors),
                                ),
                                // Not necessary for Option 1
                                onChanged: (newValue) async {
                                  // int stateId = addressManageScreenController
                                  //     .stateSelectedItem!.stateId;

                                  addressManageScreenController.stateTypeSelect
                                      .value = newValue!.stateName.toString();
                                  addressManageScreenController
                                      .stateTypeIdFindFunction();
                                  addressManageScreenController.cityListDropDown
                                      .clear();
                                  await addressManageScreenController
                                      .cityGetByIdFunction(
                                          stateId: addressManageScreenController
                                              .stateTypeId
                                              .toString());
                                  addressManageScreenController.isLoading(true);

                                  addressManageScreenController
                                      .isLoading(false);
                                  log("stateId.toString : ${addressManageScreenController.stateTypeId}");
                                },
                                items: addressManageScreenController
                                    .stateListDropDown
                                    .map<DropdownMenuItem<StateList>>(
                                        (StateList state) {
                                  return DropdownMenuItem<StateList>(
                                    value: state,
                                    child: Text(state.stateName),
                                  );
                                }).toList(),
                              ),
                            ).paddingOnly(left: 8, right: 8),
                    ),
                  ).paddingOnly(left: 5, right: 5, bottom: 10),
                  const SizedBox(height: 15),
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
                              child: DropdownButton<CityGetByIdData>(
                                hint: Text(
                                  addressManageScreenController
                                      .cityTypeSelect.value,
                                  style: const TextStyle(
                                    color: AppColors.appColors,
                                  ),
                                ),
                                // Not necessary for Option 1
                                onChanged: (newValue) async {
                                  addressManageScreenController.isLoading(true);

                                  // addressManageScreenController
                                  //     .citySelectedItem = newValue!;
                                  addressManageScreenController.cityTypeSelect
                                      .value = newValue!.cityName.toString();

                                  addressManageScreenController
                                      .cityTypeIdFindFunction();

                                  log('new state Type :  ${addressManageScreenController.cityTypeSelect.value}');
                                  addressManageScreenController
                                      .isLoading(false);
                                },
                                items: addressManageScreenController
                                    .cityListDropDown
                                    .map<DropdownMenuItem<CityGetByIdData>>(
                                        (CityGetByIdData city) {
                                  return DropdownMenuItem<CityGetByIdData>(
                                    value: city,
                                    child: Text(city.cityName),
                                  );
                                }).toList(),
                              ),
                            ).paddingOnly(left: 8, right: 8),
                    ),
                  ).paddingOnly(left: 5, right: 5, bottom: 10),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => addressManageScreenController.isLoading.value
                            ? Container()
                            : Transform.scale(
                                alignment: AlignmentDirectional.centerStart,
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  activeColor: AppColors.appColors,
                                  trackColor: AppColors.appColorsSecondry,
                                  value: addressManageScreenController
                                      .isCompanyStatus.value,
                                  onChanged: (value) async {
                                    addressManageScreenController
                                        .isCompanyStatus.value = value;
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
                                  if (addressManageScreenController
                                      .addressFormKey.currentState!
                                      .validate()) {
                                    if (addressManageScreenController
                                            .addressTypeId.value ==
                                        0) {
                                      Fluttertoast.showToast(
                                          msg: 'Please select address type.',
                                          backgroundColor: AppColors.redColor);
                                    } else if (addressManageScreenController
                                            .stateTypeId.value ==
                                        0) {
                                      Fluttertoast.showToast(
                                          msg: 'Please select state type.',
                                          backgroundColor: AppColors.redColor);
                                    }
                                    //  else if (addressManageScreenController
                                    //         .cityTypeId.value ==
                                    //     0) {
                                    //   Fluttertoast.showToast(
                                    //       msg: 'Please select city type.',
                                    //       backgroundColor: AppColors.redColor);
                                    // }
                                    else {
                                      // AddressOption.update ==
                                      //     addressManageScreenController
                                      //         .addressOption
                                      //     ? addressManageScreenController
                                      //     .
                                      addressManageScreenController
                                          .addAddressDetails();
                                      // : addressManageScreenController
                                      // .addAddressDetails();
                                    }
                                  }
                                },
                                child: addressManageScreenController
                                        .isLoading.value
                                    ? Center(
                                        child: CommonLoader().showLoader(),
                                      ).paddingAll(5)
                                    : CompanyOption.update ==
                                            addressManageScreenController
                                                .addressOption
                                        ? const Text('Update')
                                        : const Text('Submit')),
                          )),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
