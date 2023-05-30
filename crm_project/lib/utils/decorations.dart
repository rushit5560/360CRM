import 'package:flutter/material.dart';

import '../constants/colors.dart';

InputDecoration dropdownInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: AppColors.redColor),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: AppColors.redColor),
  ),
);