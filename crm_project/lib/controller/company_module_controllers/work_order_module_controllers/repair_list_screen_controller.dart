import 'package:get/get.dart';

class RepairListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;






  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {

  }
}