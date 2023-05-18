import 'package:crm_project/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class EditCompanyDetailsScreen extends StatelessWidget {


  String companyName;
  EditCompanyDetailsScreen({required this.companyName});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: CustomAppBar(
        actionShow: false, leadingShow: false, titleText: companyName),
    body: SingleChildScrollView(

    )
    );
  }
}
