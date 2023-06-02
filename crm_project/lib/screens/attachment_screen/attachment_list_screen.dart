import 'package:crm_project/common_modules/common_loader.dart';
import 'package:crm_project/controller/company_module_controllers/attachment_list_screen_controller.dart';
import 'package:crm_project/screens/attachment_screen/attachment_list_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/colors.dart';
import '../../../utils/messaging.dart';
import 'attachment_add_screen/attachment_add_screen.dart';

class AttachmentListScreen extends StatelessWidget {
  AttachmentListScreen({Key? key}) : super(key: key);
  final attachmentListScreenController =
      Get.put(AttachmentListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: AppMessage.attachmentList,
        leadingShow: false,
        actionShow: false,
      ),
      body: SafeArea(
        child: Obx(
          () => attachmentListScreenController.isLoading.value
              ? CommonLoader().showLoader()
              : Column(children: [
                  AttachmentSearchWidget(),
                  Expanded(child: AttachmentListWidget()),
                ]).paddingOnly(left: 15,right: 15),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'b',
        onPressed: () {
          Get.to(
            () => AttachmentAddScreen(),
              arguments: [attachmentListScreenController.companyId.toString(),
                attachmentListScreenController.attachmentComingFrom,

              ]
          )!.then((value)async {
            attachmentListScreenController.isLoading(true);
            attachmentListScreenController.hasMore = true;
            attachmentListScreenController.pageIndex = 1;
            attachmentListScreenController.attachmentList.clear();
            await attachmentListScreenController.attachmentListFunction();
          });
        },
        backgroundColor: AppColors.appColors,
        child: const Icon(Icons.add),
      ),
    );
  }
}
