import 'package:crm_project/common_modules/divider.dart';
import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/settings_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/common_textfield.dart';
import '../../constants/colors.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final settingScrreenController = Get.put(SettingScrreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'User Settings',
        leadingShow: false,
        actionShow: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
//Estimated Tex Bracket
              Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: Text(
                        'Estimated Tex Bracket',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: AppColors.appColors, fontSize: 15.sp),
                      )),
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 5.h,
                        child: TextFieldModule(
                            hintText: '',
                            fieldController: settingScrreenController
                                .estimatedTexBracketTextField,
                            suffixIcon: Text('%'),
                            onChange: (val) {
                              settingScrreenController.estimatedTexBracketSlider
                                  .value = settingScrreenController
                                      .estimatedTexBracketTextField.text.isEmpty
                                  ? 0.0
                                  : 100 >=
                                          double.parse(settingScrreenController
                                                  .estimatedTexBracketTextField
                                                  .text)
                                              .toDouble()
                                      ? double.parse(settingScrreenController
                                              .estimatedTexBracketTextField
                                              .text)
                                          .toDouble()
                                      : 100.0;
                            },
                            keyboardType: TextInputType.number),
                      )),
                ],
              ).paddingOnly(top: 25, left: 20, right: 20),
//slider
              Obx(
                () => Slider(
                  thumbColor: AppColors.appColors,
                  activeColor: AppColors.appColors,
                  min: 0.0,
                  max: 100.0,
                  value:
                      settingScrreenController.estimatedTexBracketSlider.value,
                  onChanged: (value) {
                    settingScrreenController.estimatedTexBracketSlider.value =
                        double.parse(value.toStringAsExponential(2));
                    settingScrreenController.estimatedTexBracketTextField.text =
                        double.parse(value.toStringAsExponential(2)).toString();
                    print(settingScrreenController
                        .estimatedTexBracketSlider.value);
                  },
                ),
              ),
              CustomDivider().paddingOnly(left: 20, right: 20),
//Realtor Fee
              Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: Text(
                        'Realtor Fee',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: AppColors.appColors, fontSize: 15.sp),
                      )),
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 5.h,
                        child: TextFieldModule(
                            hintText: '',
                            fieldController:
                                settingScrreenController.realtorFeesTextField,
                            suffixIcon: Text('%'),
                            onChange: (val) {
                              settingScrreenController.realtorFeeSlider
                                  .value = settingScrreenController
                                      .realtorFeesTextField.text.isEmpty
                                  ? 0.0
                                  : 100 >=
                                          double.parse(settingScrreenController
                                                  .realtorFeesTextField.text)
                                              .toDouble()
                                      ? double.parse(settingScrreenController
                                              .realtorFeesTextField.text)
                                          .toDouble()
                                      : 100.0;
                            },
                            keyboardType: TextInputType.number),
                      )),
                ],
              ).paddingOnly(top: 10, left: 20, right: 20),
//slider
              Obx(
                () => Slider(
                  thumbColor: AppColors.appColors,
                  activeColor: AppColors.appColors,
                  min: 0.0,
                  max: 100.0,
                  value: settingScrreenController.realtorFeeSlider.value,
                  onChanged: (value) {
                    settingScrreenController.realtorFeeSlider.value =
                        double.parse(value.toStringAsExponential(2));
                    settingScrreenController.realtorFeesTextField.text =
                        double.parse(value.toStringAsExponential(2)).toString();
                    print('realtorFeeSlider' +
                        settingScrreenController.realtorFeeSlider.value
                            .toString());
                  },
                ),
              ),
              CustomDivider().paddingOnly(left: 20, right: 20),
//Closing Cost
              Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: Text(
                        'Closing Cost',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: AppColors.appColors, fontSize: 15.sp),
                      )),
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 5.h,
                        child: TextFieldModule(
                            hintText: '',
                            fieldController:
                                settingScrreenController.closingCostsTextField,
                            suffixIcon: Text('%'),
                            onChange: (val) {
                              settingScrreenController.closingCostSlider
                                  .value = settingScrreenController
                                      .closingCostsTextField.text.isEmpty
                                  ? 0.0
                                  : 100 >=
                                          double.parse(settingScrreenController
                                                  .closingCostsTextField.text)
                                              .toDouble()
                                      ? double.parse(settingScrreenController
                                              .closingCostsTextField.text)
                                          .toDouble()
                                      : 100.0;
                            },
                            keyboardType: TextInputType.number),
                      )),
                ],
              ).paddingOnly(top: 10, left: 20, right: 20),
//slider
              Obx(
                () => Slider(
                  thumbColor: AppColors.appColors,
                  activeColor: AppColors.appColors,
                  min: 0.0,
                  max: 100.0,
                  value: settingScrreenController.closingCostSlider.value,
                  onChanged: (value) {
                    settingScrreenController.closingCostSlider.value =
                        double.parse(value.toStringAsExponential(2));
                    settingScrreenController.closingCostsTextField.text =
                        double.parse(value.toStringAsExponential(2)).toString();
                    print('closingCostSlider: ' +
                        settingScrreenController.closingCostSlider.value
                            .toString());
                  },
                ),
              ),
              CustomDivider().paddingOnly(left: 20, right: 20),
//Default Closing Cost
              Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: Text(
                        'Default Closing Cost',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: AppColors.appColors, fontSize: 15.sp),
                      )),
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 5.h,
                        child: TextFieldModule(
                            hintText: '',
                            fieldController: settingScrreenController
                                .defaultClosingCostsTextField,
                            suffixIcon: Text('\$'),
                            onChange: (val) {
                              print(settingScrreenController
                                  .defaultClosingCostsTextField.text);
                            },
                            keyboardType: TextInputType.number),
                      )),
                ],
              ).paddingOnly(top: 10, left: 20, right: 20, bottom: 10),
              CustomDivider().paddingOnly(left: 20, right: 20),
              Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: Text(
                        'Expected Hold Term (Month)',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: AppColors.appColors, fontSize: 15.sp),
                      )),
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 5.h,
                        child: TextFieldModule(
                            hintText: '',
                            fieldController: settingScrreenController
                                .expectedHoldTermTextField,
                            onChange: (val) {
                              print(settingScrreenController
                                  .expectedHoldTermTextField.text);
                            },
                            keyboardType: TextInputType.number),
                      )),
                ],
              ).paddingOnly(top: 10, left: 20, right: 20, bottom: 10),
              CustomDivider().paddingOnly(left: 20, right: 20),
            ],
          ),
        ),
      ),
    );
  }
}
