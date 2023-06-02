import 'package:flutter/material.dart';

import 'active_repair_area_list_model.dart';

class RepairItemModel {
  TextEditingController qtyFieldController = TextEditingController();
  RepairAreaData repairAreaDataValue = RepairAreaData();
  String itemDataValue = "";
  TextEditingController descriptionFieldController = TextEditingController();
  TextEditingController unitCostFieldController = TextEditingController();
  TextEditingController totalFieldController = TextEditingController();
  DateTime dueDate = DateTime.now();
  DateTime completedDate = DateTime.now();
  bool isCompleted = false;

  RepairItemModel({
    required this.qtyFieldController,
    required this.repairAreaDataValue,
    required this.itemDataValue,
    required this.descriptionFieldController,
    required this.unitCostFieldController,
    required this.totalFieldController,
    required this.dueDate,
    required this.completedDate,
    required this.isCompleted,
  });
}
