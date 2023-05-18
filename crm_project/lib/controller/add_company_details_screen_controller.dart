import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddCompanyDetailsScreenController extends GetxController {
  GlobalKey<FormState> addCompanyKey = GlobalKey<FormState>();

  List<String> companyTypeListDropDown = [
    'Developer', 'Designer', 'Consultant', 'IT', 'Developer', 'Designer', 'Consultant', 'IT', 'Developer', 'Designer', 'Consultant', 'IT'];
  final companyNameTextField = TextEditingController();
  final phoneTextField = TextEditingController();
  final phone2TextField = TextEditingController();
  final faxTextField = TextEditingController();
  final fax2TextField = TextEditingController();
  final websiteTextField = TextEditingController();
  final emailTextField = TextEditingController();
  final companyTypeTextField = TextEditingController();
}
