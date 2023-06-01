import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/company_module_controllers/work_order_module_controllers/repair_list_screen_controller.dart';

class RepairListScreen extends StatelessWidget {
  RepairListScreen({Key? key}) : super(key: key);
  final repairListScreenController = Get.put(RepairListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
