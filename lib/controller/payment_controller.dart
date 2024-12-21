import 'package:get/get.dart';

class PaymentController extends GetxController {
  int? _selectedValue;
  get selectedvalue => _selectedValue;

  void handleRadioSelection(int? value) {
    // Toggle logic: If already selected, unselect it
    _selectedValue = (_selectedValue == value) ? null : value;
    update();
  }
}
