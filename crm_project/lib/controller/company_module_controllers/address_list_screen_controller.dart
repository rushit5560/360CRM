import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressListScreenController extends GetxController{

  final searchTextFieldController = TextEditingController();

  bool hasMore = true;
  int pageIndex = 1;
  int itemCount = 10;

}