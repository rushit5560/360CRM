import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/address_list_screen_controller.dart';
import 'package:crm_project/screens/address_screen/address_list_screen_widget.dart';
import 'package:crm_project/screens/address_screen/address_manage_screen/address_manage_screen.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/common_loader.dart';
import '../../../common_modules/divider.dart';
import '../../../constants/colors.dart';

class CompanyAddressListScreen extends StatelessWidget {
  CompanyAddressListScreen({Key? key}) : super(key: key);
  final addressListScreenController = Get.put(AddressListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: AppMessage.companyAddress,
        leadingShow: false,
        actionShow: false,
      ),
      body: SafeArea(
        child: Obx(
          () => addressListScreenController.isLoading.value
              ? CommonLoader().showLoader()
              : Column(
                  children: [
                    AddressSearchWidget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            AppMessage.addressList,
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
                                  color: AppColors.appColors, width: 1)),
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
                        )
                      ],
                    ).paddingOnly(top: 8),
                    const CustomDivider(),
                    Expanded(child: AddressListWidget()),
                  ],
                ).paddingAll(15),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'b',
        onPressed: () {
          Get.to(() => CompanyManageAddressScreen(),
                  arguments: [
                    AddressOption.create,
                    addressListScreenController.companyId.toString(),
                    "",
                  ],
                  transition: Transition.zoom)!
              .then((value) async {
            addressListScreenController.addressList.clear();
            addressListScreenController.pageIndex = 1;
            addressListScreenController.hasMore = true;
            await addressListScreenController.getAddressList();
          });
          
        },
        backgroundColor: AppColors.appColors,
        child: const Icon(Icons.add),
      ),
    );
  }
}
