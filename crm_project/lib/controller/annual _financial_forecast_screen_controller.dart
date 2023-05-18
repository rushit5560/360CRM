import 'package:get/get.dart';

class AnnualFinancialForecastController extends GetxController{
  RxBool isLoading = false.obs;
  RxString selectedYear = ''.obs;

  List<String> yearDownList = [
    'Year 1',
    'Year 2',
    'Year 3',
    'Year 4',
    'Year 5',
    'Year 6',
    'Year 7',
    'Year 8',
    'Year 9',
    'Year 10',
  ];

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}