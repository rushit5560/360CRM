import 'dart:developer';
import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/constants/extension.dart';
import 'package:crm_project/controller/company_module_controllers/contact_module_controller/contact_list_screen_controller.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:crm_project/utils/messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_modules/common_textfield.dart';
import '../../../../constants/colors.dart';
import '../../../common_modules/common_bottomsheet_module.dart';
import '../../../common_widgets/header_and_content_module.dart';
import '../contact_manage_screen/contact_manage_screen.dart';
import '../edit_contact_options_screen.dart';

class ContactSearchBarWidget extends StatelessWidget {
  ContactSearchBarWidget({Key? key}) : super(key: key);
  final contactListScreenController = Get.find<ContactListScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
        fieldController: contactListScreenController.searchTextFieldController,
        hintText: 'Search...',
        onChange: (text) {
          log(text.toString());
        },
        backgroundColor: AppColors.whiteColor,
        icon: GestureDetector(
            onTap: () {
              log('Search... ${contactListScreenController.searchTextFieldController.text}');
            },
            child: const Icon(Icons.search).paddingOnly(left: 5, right: 5)),
        keyboardType: TextInputType.text);
  }
}

class ContactListWidget extends StatelessWidget {
  ContactListWidget({Key? key}) : super(key: key);
  final contactListScreenController = Get.find<ContactListScreenController>();

  @override
  Widget build(BuildContext context) {
    return contactListScreenController.contactList.isEmpty
        ? const Center(child: Text('No Data'))
        : ListView.builder(
            itemCount: contactListScreenController.contactList.length + 1,
            controller: contactListScreenController.scrollController,
            itemBuilder: (context, i) {
              if (i < contactListScreenController.contactList.length) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.appColors.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(2.w)),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          // first name
                          HeaderAndContentModule(
                            headerText: AppMessage.firstName.toUpperCase(),
                            contentText: contactListScreenController
                                .contactList[i].contact.firstName,
                          ),

                          // last name
                          HeaderAndContentModule(
                            headerText: AppMessage.lasttName.toUpperCase(),
                            contentText: contactListScreenController
                                .contactList[i].contact.lastName,
                          ),

                          // role
                          HeaderAndContentModule(
                            headerText: AppMessage.role.toUpperCase(),
                            contentText: contactListScreenController
                                .contactList[i].contactRole!.name
                                .toString(),
                          ),
                          // contact categories

                          // HeaderAndContentModule(
                          //   headerText:
                          //       AppMessage.contactCatecory.toUpperCase(),
                          //   contentText: contactListScreenController
                          //       .contactList[i].contactRole!.contactCategorys
                          //       .toString(),
                          // ),
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
                                    value: contactListScreenController
                                        .contactList[i].isActive,
                                    onChanged: (value) async {
                                      log("contactListScreenController.contactList[i].contactId ${contactListScreenController.contactList[i].contactId}");
                                      await contactListScreenController
                                          .changeContactFunction(
                                        contactId: contactListScreenController
                                            .contactList[i].mtmCompanyContactId
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
                                log("contactListScreenController.contactList[i].contactId ${contactListScreenController.contactList[i].contactId}");

                                Get.to(
                                  () => ContactOptionsScreen(),
                                  arguments: [
                                    ContactOption.update,
                                    contactListScreenController.companyId,
                                    contactListScreenController
                                        .contactList[i].contactId,
                                  ],
                                )!.then((value) async {
                                  contactListScreenController.isLoading(true);
                                  contactListScreenController.hasMore = true;
                                  contactListScreenController.pageIndex = 1;
                                  contactListScreenController.contactList
                                      .clear();
                                  await contactListScreenController
                                      .getContactsFunction();
                                });;
                                // Get.to(() => ContactManageScreen(), arguments: [
                                //   ContactOption.update,
                                //   contactListScreenController.companyId,
                                //   contactListScreenController
                                //       .contactList[i].contactId,
                                // ])!

                                // log("contactListScreenControlle.contactList[i].contactId ${contactListScreenController.contactList[i].contactId}");
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
                                    Get.back();
                                    log("contactListScreenController.contactList[i].contactId ${contactListScreenController.contactList[i].contactId}");
                                    await contactListScreenController
                                        .deleteContactFunction(
                                      contactId: contactListScreenController
                                          .contactList[i].mtmCompanyContactId
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
                    ],
                  ),
                );
              } else {
                return contactListScreenController.hasMore
                    ? Center(child: CommonLoader().showLoader())
                    : Container();
              }
            },
          );
  }
}
