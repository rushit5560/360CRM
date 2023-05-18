import 'package:crm_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldModule extends StatelessWidget {
  TextEditingController fieldController;
  String hintText;
  TextInputType keyboardType;
  FormFieldValidator? validate;
  int? maxLength;
  Widget? suffixIcon;
  Widget? prifixIcon;
  Widget? icon;
  bool? obScureText;
  bool readOnly;
  Color? backgroundColor;
  Function(String)? onChange;

  // FormFieldValidator? validate;

  TextFieldModule(
      {required this.fieldController,
      required this.hintText,
      required this.keyboardType,
      this.validate,
      this.maxLength,
      this.suffixIcon,
      this.prifixIcon,
      this.icon,
      this.obScureText,
      this.readOnly = false,
      this.backgroundColor,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: readOnly,
        controller: fieldController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validate,
        obscureText: obScureText ?? false,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        maxLength: maxLength,
        cursorColor: AppColors.appColors,
        onChanged: onChange,
        decoration: InputDecoration(
          fillColor: backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.appColors, width: 1.5)),
          errorBorder: inputBorder(),
          filled: true,
          label: Text(hintText),
          labelStyle: TextStyle(color: AppColors.appColors),
          errorMaxLines: 2,
          suffixIcon: icon,
          suffixIconColor: AppColors.appColors,
          suffix: suffixIcon,
          prefix: prifixIcon,
          counterText: '',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        ));
  }

  InputBorder inputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.redColor, width: 1.5));
  }
}
