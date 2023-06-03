import 'package:crm_project/constants/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/contact_module_controller/pre_qualification_checklist_manage_screen_controller.dart';

class PreQualificationDatePickerModule extends StatelessWidget {
  PreQualificationDatePickerModule({Key? key}) : super(key: key);
  final preQualificationChecklistMangeScreenController =
      Get.find<PreQualificationChecklistMangeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: "Date",
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
                    preQualificationChecklistMangeScreenController
                        .showDate.value,
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
                    await preQualificationChecklistMangeScreenController
                        .selectDate(
                  context: context,
                  initialDate:
                      preQualificationChecklistMangeScreenController.date,
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
    ).commonSymmetricPaddng(vertical: 10);
  }
}

class CheckboxListModule extends StatefulWidget {
  CheckboxListModule({Key? key}) : super(key: key);

  @override
  State<CheckboxListModule> createState() => _CheckboxListModuleState();
}

class _CheckboxListModuleState extends State<CheckboxListModule> {
  final preQualificationChecklistMangeScreenController =
      Get.find<PreQualificationChecklistMangeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: preQualificationChecklistMangeScreenController
            .checkBoxListItems.keys
            .map((String key) {
          return Obx(
            () => CheckboxListTile(
              title: Text(key),
              value: preQualificationChecklistMangeScreenController
                  .checkBoxListItems[key]!.value,
              onChanged: (value) {
                setState(() {
                  preQualificationChecklistMangeScreenController
                      .checkBoxListItems[key] = value!.obs;
                });
                // preQualificationChecklistMangeScreenController.isLoading(true);
                // preQualificationChecklistMangeScreenController
                //     .checkBoxListItems[key] = value!.obs;
                // preQualificationChecklistMangeScreenController.isLoading(false);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
