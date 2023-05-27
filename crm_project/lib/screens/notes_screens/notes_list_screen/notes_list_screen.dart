import 'package:crm_project/screens/notes_screens/notes_manage_screen/notes_manage_screen.dart';
import 'package:crm_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_modules/common_loader.dart';
import '../../../../common_modules/divider.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../constants/colors.dart';
import '../../../../controller/company_module_controllers/notes_list_screen_controller.dart';
import '../../../../utils/messaging.dart';
import 'notes_list_screen_widgets.dart';

class NotesListScreen extends StatelessWidget {
  NotesListScreen({Key? key}) : super(key: key);
  final notesListScreenController = Get.put(NotesListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColorsSecondry,
      appBar: CustomAppBar(
        titleText: AppMessage.notesList,
        leadingShow: false,
        actionShow: false,
      ),
      body: Obx(
        () => notesListScreenController.isLoading.value
            ? CommonLoader().showLoader()
            : Column(
                children: [
                  NoteSearchBarWidget().paddingOnly(top: 20, bottom: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          AppMessage.notesList,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.appColors,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp),
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
                                  fontSize: 10.sp),
                            )
                          ],
                        ).paddingAll(4),
                      ),
                    ],
                  ).paddingOnly(top: 8),
                  const CustomDivider(),

                  Expanded(child: NotesListWidget()),


                ],
              ).paddingOnly(left: 10, right: 10),
      ),


      floatingActionButton: FloatingActionButton(
        heroTag: 'a',
        onPressed: () {
          Get.to(() => NotesManageScreen(),
                  arguments: [
                    NotesOption.create,
                    "",
                    notesListScreenController.companyId.toString(),
                  ],
                  transition: Transition.zoom)!.then((value) async {
                notesListScreenController.isLoading(true);
                notesListScreenController.hasMore = true;
                notesListScreenController.pageIndex = 1;
                notesListScreenController.notesList.clear();
                await notesListScreenController.getNotesFunction();

          });
        },
        backgroundColor: AppColors.appColors,
        child: const Icon(Icons.add),
      ),


    );
  }
}
