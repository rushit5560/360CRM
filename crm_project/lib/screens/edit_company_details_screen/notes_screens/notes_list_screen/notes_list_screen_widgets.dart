import 'package:crm_project/controller/company_module_controllers/notes_list_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_bottomsheet_module.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/messaging.dart';
import '../notes_manage_screen/notes_manage_screen.dart';

class NotesListWidget extends StatelessWidget {
  NotesListWidget({Key? key}) : super(key: key);
  final notesListScreenController = Get.put(NotesListScreenController());

  @override
  Widget build(BuildContext context) {
    return notesListScreenController.notesList.isEmpty
        ? const Center(child: Text('No Data'))
        : ListView.builder(
            itemCount: notesListScreenController.notesList.length + 1,
            controller: notesListScreenController.scrollController,
            itemBuilder: (context, i) {
              if (i < notesListScreenController.notesList.length) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.appColors.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(2.w)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                                notesListScreenController.notesList[i].notes,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    () => NotesManageScreen(),
                                    arguments: [
                                      NotesOption.update,
                                      notesListScreenController
                                          .notesList[i].noteId
                                          .toString(),
                                      notesListScreenController.companyId
                                          .toString(),
                                    ],
                                  )!
                                      .then((value) async {
                                    notesListScreenController.isLoading(true);
                                    notesListScreenController.hasMore = true;
                                    notesListScreenController.pageIndex = 1;
                                    notesListScreenController.notesList.clear();
                                    await notesListScreenController
                                        .getNotesFunction();
                                  });
                                },
                                child: Icon(
                                  Icons.edit_sharp,
                                  size: 7.w,
                                  color: AppColors.appColors,
                                ),
                              ),
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
                                      await notesListScreenController
                                          .deleteNoteFunction(
                                              noteId: notesListScreenController
                                                  .notesList[i].noteId
                                                  .toString(),
                                              index: i);
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
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                                '${AppMessage.dateAdded}: ${DateFormatChanger().dateFormat(notesListScreenController.notesList[i].createdOn)}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                    color:
                                        AppColors.blackColor.withOpacity(0.6))),
                          ),
                          Obx(
                            () => notesListScreenController.isLoading.value
                                ? Container()
                                : Transform.scale(
                                    alignment: AlignmentDirectional.centerEnd,
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                      activeColor: AppColors.appColors,
                                      trackColor: AppColors.appColorsSecondry,
                                      value: notesListScreenController
                                          .notesList[i].isActive,
                                      onChanged: (value) async {
                                        await notesListScreenController
                                            .changeNoteFunction(
                                          noteId: notesListScreenController
                                              .notesList[i].noteId
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
                    ],
                  ).paddingOnly(left: 10, right: 10, top: 10, bottom: 10),
                ).paddingOnly(bottom: 5);
              } else {
                return notesListScreenController.hasMore
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
