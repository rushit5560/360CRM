import 'dart:developer';
import 'package:crm_project/controller/company_module_controllers/address_list_screen_controller.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/common_bottomsheet_module.dart';
import '../../../common_modules/common_textfield.dart';
import '../../../constants/colors.dart';
import '../../../constants/single_list_tile_module.dart';
import '../../../utils/messaging.dart';
import 'address_manage_screen/address_manage_screen.dart';

class AddressSearchWidget extends StatelessWidget {
  AddressSearchWidget({Key? key}) : super(key: key);
  final addressListScreenController = Get.find<AddressListScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
            fieldController:
                addressListScreenController.searchTextFieldController,
            hintText: 'Search...',
            onChange: (text) {
              log(text.toString());
            },
            backgroundColor: AppColors.whiteColor,
            icon: const Icon(Icons.search).paddingOnly(left: 5, right: 5),
            keyboardType: TextInputType.text)
        .paddingOnly(top: 20, bottom: 5);
  }
}

class AddressListWidget extends StatelessWidget {
  AddressListWidget({Key? key}) : super(key: key);
  final addressListScreenController = Get.find<AddressListScreenController>();

  @override
  Widget build(BuildContext context) {
    log("addressListScreenController.addressList.length ${addressListScreenController.addressList.length}");
    return addressListScreenController.addressList.isEmpty
        ? const Center(child: Text('No Data'))
        : ListView.builder(
            itemCount: addressListScreenController.addressList.length + 1,
            controller: addressListScreenController.scrollController,
            itemBuilder: (context, i) {
              if (i < addressListScreenController.addressList.length) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.appColors.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(2.w)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(
                                () => CompanyManageAddressScreen(),
                                arguments: [
                                  AddressOption.update,
                                  addressListScreenController
                                      .addressList[i].addressId
                                      .toString(),
                                  addressListScreenController.companyId
                                      .toString(),
                                ],
                              )!
                                  .then((value) async {
                                addressListScreenController.isLoading(true);
                                addressListScreenController.hasMore = true;
                                addressListScreenController.pageIndex = 1;
                                addressListScreenController.addressList.clear();
                                await addressListScreenController
                                    .getAddressList();
                              });
                              log("addressListScreenController.addressList[i].addressId ${addressListScreenController.addressList[i].addressId}");
                            },
                            child: Icon(
                              Icons.edit_sharp,
                              size: 7.w,
                              color: AppColors.appColors,
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              CommonbottomSheetModule(
                                context: context,
                                icon: Icon(Icons.info_outline,
                                    color: AppColors.greyColor,
                                    size: Get.width * .4),
                                titleText: AppMessage.areYouSure,
                                subTitleText:
                                    AppMessage.doYouWantToDeleteThisRecord,
                                onYesText: AppMessage.yesDeleteIt,
                                onCancelText: AppMessage.cancel,
                                onYesTap: () async {
                                  log(" addressListScreenController.addressList[i].addressId ${addressListScreenController.addressList[i].addressId}");
                                  Get.back();
                                  await addressListScreenController
                                      .deleteAddressFunction(
                                    addressId: addressListScreenController
                                        .addressList[i].addressId
                                        .toString(),
                                    index: i,
                                  );
                                },
                                onCancelTap: () =>
                                    Navigator.of(context).pop(false),
                              );
                            },
                            child: Icon(
                              Icons.delete,
                              size: 7.w,
                              color: AppColors.redColor,
                            ),
                          ),
                        ],
                      ),
                      SingleListTileModuleCustom(
                        textValue:
                            addressListScreenController.addressList[i].address1,
                        textKey: 'Address 1',
                      ),
                      const SizedBox(height: 5),
                      SingleListTileModuleCustom(
                        textValue:
                            addressListScreenController.addressList[i].address2,
                        textKey: 'Address 2',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text('',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                    color:
                                        AppColors.blackColor.withOpacity(0.6))),
                          ),
                          Obx(
                            () => addressListScreenController.isLoading.value
                                ? Container()
                                : Transform.scale(
                                    alignment: AlignmentDirectional.centerEnd,
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                      activeColor: AppColors.appColors,
                                      trackColor: AppColors.appColorsSecondry,
                                      value: addressListScreenController
                                          .addressList[i].isActive,
                                      onChanged: (value) async {
                                        log("addressListScreenController .addressList[i].addressId ${addressListScreenController.addressList[i].addressId}");
                                        await addressListScreenController
                                            .changeAddressFunction(
                                          addressId: addressListScreenController
                                              .addressList[i].addressId
                                              .toString(),
                                          status: value,
                                          index: i,
                                        );
                                        // .notesList[i].isActive = value;
                                        // notesListScreenController.loadUI();
                                      },
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Text("Address 1"),
                      //     Text(
                      //       addressListScreenController
                      //           .addressList[i].address1,
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //       style: TextStyle(
                      //         fontSize: 17.sp,
                      //         fontWeight: FontWeight.bold,
                      //         color: AppColors.blackColor,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 15),
                    ],
                  ).paddingOnly(left: 10, right: 10, top: 10, bottom: 10),
                ).paddingOnly(bottom: 5);
              } else {
                return addressListScreenController.hasMore
                        ? const Center(child: CircularProgressIndicator())
                        : Container() /*const Center(
            child: Text(
              "No more companies!",

            ))*/
                    ;
              }
            },
          );
  }
}
