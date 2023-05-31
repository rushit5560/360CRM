import 'package:flutter/material.dart';

import '../ledger_screen_model/active_category_type_list_model.dart';
import 'active_payment_method_list_model.dart';
import 'active_payment_type_list_model.dart';

class PaymentListModel {
  TextEditingController amountFieldController;
  DateTime paymentDate;
  PaymentTypeData paymentTypeDataValue;
  PaymentMethodData paymentMethodDataValue;
  CategoryTypeData categoryTypeDataValue;
  TextEditingController referenceFieldController;

  PaymentListModel({
    required this.amountFieldController,
    required this.paymentDate,
    required this.paymentTypeDataValue,
    required this.paymentMethodDataValue,
    required this.categoryTypeDataValue,
    required this.referenceFieldController,
  });
}
