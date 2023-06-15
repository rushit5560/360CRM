import 'dart:developer';

import 'package:crm_project/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class FieldValidation {
  validateZip(String value) {
    if (value.isEmpty) {
      return "Please enter zip value.";
    } else if (value.contains(".") ||
        value.contains(" ") ||
        value.contains("-") ||
        value.contains(",") ||
        value.length > 6) {
      return "Please enter valid zip value.";
    } else {
      return null;
    }
  }

  validateEmpty(String value, String fieldName) {
    if (value.isEmpty || value == ' ') {
      return "Please enter ${fieldName.toLowerCase()}.";
    } else {
      return null;
    }
  }



  validateAmount(String value, String fieldName) {
    if (value.isEmpty) {
      return "Please enter ${fieldName.toLowerCase()}.";
    } else if (value.contains(" ") ||
        value.contains("-") ||
        value.contains(",")) {
      return "Please enter ${fieldName.toLowerCase()}.";
    } else {
      return null;
    }
  }

  validateMobileNumber(String value) {
    RegExp mobileNumberRegex = RegExp(r'^[0-9+\s]+$');

    if (mobileNumberRegex.hasMatch(value) && !value.contains('+')) {
      return null; // Valid mobile number
    } else {
      return "Please Enter Valid mobile number"; // Invalid mobile number
    }
  }

  validateFaxNumber(String value) {
    RegExp mobileNumberRegex = RegExp(r'^[0-9+\s]+$');

    if (mobileNumberRegex.hasMatch(value) && !value.contains('+')) {
      return null; // Valid mobile number
    } else {
      return "Please Enter Valid Fax number"; // Invalid mobile number
    }
  }

  validateEmail(String value) {
    // Define the regex pattern for valid email addresses
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    // Check if the value matches the regex pattern
    // return emailRegex.hasMatch(value);
    if (emailRegex.hasMatch(value)) {
      return null;
    } else {
      return 'Please valid email address';
    }
  }

  validateDropDown(String value) {
    if (value.isEmpty || value == null) {
      Fluttertoast.showToast(
          msg: 'Please select company type',
          backgroundColor: AppColors.redColor);
      return null;
    } else {
      return null;
    }
  }

  validateNum(String value) {
    RegExp mobileNumberRegex = RegExp(r'^[0-9.]');

    if (mobileNumberRegex.hasMatch(value)&& !value.contains('+')&& !value.contains('-')&& !value.contains(' ')&& !value.contains(',')) {
      return null; // Valid mobile number
    } else {
      return "Please Enter amount between 0 to 99999999"; // Invalid mobile number
    }
  }
  startDateValidator(startDate,endDate){
    DateTime dt1 = DateTime.parse(startDate.toString());
    if(startDate.toString().isEmpty){
      return "Select start Date";
    }
    else{
      endDateValidator(startDate,endDate);
    }
  }

  endDateValidator(startDate , endDate) {
    DateTime dt1 = DateTime.parse(startDate.toString());
    DateTime dt2 = DateTime.parse(endDate.toString());

    log(">>>>>>> $dt1");
    if(true){

    }
    if(dt1.compareTo(dt2) == 0){
      // log("Both date time are at same moment.");
      return null;
    }
    if(dt1.compareTo(dt2) < 0){
      // log("DT1 is before DT2");
      return null;
    }

    if(dt1.compareTo(dt2) > 0) {
      log("DT1 is after DT2");
      return "Due date must be after start date";
    } }

}
