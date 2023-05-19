import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailsScreen extends StatelessWidget {
   DetailsScreen({Key? key}) : super(key: key);
final detailsScreenController = Get.put(DetailsScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: detailsScreenController.companyName, leadingShow: false, actionShow: false),
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
