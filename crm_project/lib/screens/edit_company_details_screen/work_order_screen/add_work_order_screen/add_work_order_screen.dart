import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:crm_project/controller/company_module_controllers/add_work_order_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWorkOrderScreen extends StatelessWidget {
   AddWorkOrderScreen({Key? key}) : super(key: key);
   final addWorkOrderScreenController = Get.put(AddWorkOrderScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: CustomAppBar(titleText: 'titleText', leadingShow: false, actionShow: false),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
