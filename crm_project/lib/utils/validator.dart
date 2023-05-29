import 'package:crm_project/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      return "Please enter valid $fieldName.";
    } else {
      return null;
    }
  }



  validateAmount(String value, String fieldName) {
    if (value.isEmpty) {
      return "Please enter valid $fieldName.";
    } else if (value.contains(" ") ||
        value.contains("-") ||
        value.contains(",")) {
      return "Please enter valid $fieldName.";
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
}
