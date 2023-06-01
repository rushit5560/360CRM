import 'package:flutter/material.dart';

import '../ledger_screen_model/active_category_type_list_model.dart';

class ItemDetailsModel {
  String? itemId;
  TextEditingController qtyFieldController;
  CategoryTypeData categoryTypeDataValue;
  // List<CategoryTypeData> categoryTypeList;
  TextEditingController descriptionFieldController;
  TextEditingController unitFieldController;
  TextEditingController priceFieldController;
  TextEditingController itemTotalFieldController;
  bool isActive;

  ItemDetailsModel({
    this.itemId,
    required this.qtyFieldController,
    required this.categoryTypeDataValue,
    // required this.categoryTypeList,
    required this.descriptionFieldController,
    required this.unitFieldController,
    required this.priceFieldController,
    required this.itemTotalFieldController,
    required this.isActive,
  });
}