import 'package:crm_project/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar(
    {required String titleText,
    required bool leadingShow,
    Widget? leadingIcon,
    Function()? leadingOnTop,
    required bool actionShow,
    Widget? actionIcon,
    Function()? actionOnTap}) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 50,
    backgroundColor: AppColors.appColors,
    leading: leadingShow
        ? IconButton(
            onPressed: leadingOnTop??() {},
            icon: leadingIcon!,
          )
        : null,
    title: Align(alignment:Alignment.centerLeft,
      child: Text(
        titleText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    actions: [
      actionShow
          ? IconButton(onPressed: actionOnTap ?? () {}, icon: actionIcon!)
          : Container()
    ],
  );
}
