import 'package:crm_project/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFieldModule extends StatelessWidget {
  final TextEditingController fieldController;
  final String hintText;
  final TextInputType keyboardType;
  final FormFieldValidator? validate;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? prifixIcon;
  final Widget? icon;
  final bool? obScureText;
  final bool readOnly;
  final Color? backgroundColor;
  final Function(String)? onChange;
  // FormFieldValidator? validate;

  const TextFieldModule(
      {super.key,
      required this.fieldController,
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
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.appColors, width: 1.5)),
          errorBorder: inputBorder(),
          filled: true,
          label: Text(hintText),
          labelStyle: const TextStyle(color: AppColors.appColors),
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
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.redColor, width: 1.5));
  }
}
