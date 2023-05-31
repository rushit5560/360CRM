import 'dart:developer';
import 'package:crm_project/constants/extension.dart';
import 'package:crm_project/controller/company_module_controllers/address_list_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/common_bottomsheet_module.dart';
import '../../../common_modules/common_textfield.dart';
import '../../../common_widgets/header_and_content_module.dart';
import '../../../constants/colors.dart';
import '../../../utils/enums.dart';
import '../../../utils/messaging.dart';
import '../../common_modules/common_loader.dart';
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
                  child: Column(children: [
                    Column(
                      children: [
                        HeaderAndContentModule(
                          headerText: "Address 1",
                          contentText: addressListScreenController
                              .addressList[i].address1,
                        ),
                        HeaderAndContentModule(
                          headerText: "Address 2",
                          contentText: addressListScreenController
                              .addressList[i].address2,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ).commonSymmetricPaddng(vertical: 8, horizontal: 8),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.appColors.withOpacity(0.1),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Transform.scale(
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
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(
                                () => CompanyManageAddressScreen(),
                                arguments: [
                                  AddressOption.update,
                                  addressListScreenController.companyId
                                      .toString(),
                                  addressListScreenController
                                      .addressList[i].addressId
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
                          ).paddingSymmetric(horizontal: 8),
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
                          ).paddingSymmetric(horizontal: 8),
                        ],
                      ),
                    )
                  ]),
                ).paddingSymmetric(vertical: 5);
              } else {
                return addressListScreenController.hasMore
                    ?  Center(child: CommonLoader().showLoader())
                    : Container();
              }
            },
          );
  }
}
