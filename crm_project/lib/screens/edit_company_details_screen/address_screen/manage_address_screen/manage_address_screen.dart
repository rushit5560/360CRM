import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ManageAddressScreen extends StatelessWidget {
  const ManageAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "titleText", leadingShow: false, actionShow: false),
    );
  }
}
