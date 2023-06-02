import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_loader.dart';
import '../../../../common_modules/divider.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../constants/colors.dart';
import '../../../controller/company_module_controllers/contact_module_controller/contact_list_screen_controller.dart';
import '../../../../utils/messaging.dart';
import '../../../utils/enums.dart';
import '../contact_manage_screen/contact_manage_screen.dart';
import 'contact_list_screen_widgets.dart';

class ContactListScreen extends StatelessWidget {
  ContactListScreen({Key? key}) : super(key: key);
  final contactListScreenController = Get.put(ContactListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
        titleText: AppMessage.contactList,
        leadingShow: false,
        actionShow: false,
      ),
      body: SafeArea(
        child: Obx(
          () => contactListScreenController.isLoading.value
              ? CommonLoader().showLoader()
              : Column(
                  children: [
                    ContactSearchBarWidget(),

                    // Heading & Export button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            AppMessage.contactList,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.appColors,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.w),
                            border: Border.all(
                              color: AppColors.appColors,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_download,
                                size: 4.w,
                                color: AppColors.appColors,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                AppMessage.export,
                                style: TextStyle(
                                  color: AppColors.appColors,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                ),
                              )
                            ],
                          ).paddingAll(4),
                        ),
                      ],
                    ).paddingOnly(top: 8),
                    const CustomDivider(),

                    //
                    Expanded(child: ContactListWidget()),
                  ],
                ).paddingOnly(left: 10, right: 10),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'b',
        onPressed: () {
          Get.to(() => ContactManageScreen(),
                  arguments: [
                    ContactOption.create,
                    contactListScreenController.companyId.toString(),
                    "",
                    // contactListScreenController.companyId.toString(),
                  ],
                  transition: Transition.zoom)!
              .then((value) async {
            contactListScreenController.contactList.clear();
            contactListScreenController.pageIndex = 1;
            contactListScreenController.hasMore = true;
            await contactListScreenController.getContactsFunction();
          });
        },
        backgroundColor: AppColors.appColors,
        child: const Icon(Icons.add),
      ),
    );
  }
}
