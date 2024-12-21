import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DeliverController extends GetxController {
  TextEditingController addressline1 = TextEditingController();
  TextEditingController addressline2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();

  final formkey = GlobalKey<FormState>();
  String? addressLine1Validation(String val) {
    if (val.isEmpty) {
      return 'required address';
    }
    return null;
  }

  String? addressLine2Validation(String val) {
    if (val.isEmpty) {
      return 'required address';
    }
    return null;
  }

  String? cityValidation(String val) {
    if (val.isEmpty) {
      return 'required address';
    }
    return null;
  }

  String? stateValidation(String val) {
    if (val.isEmpty) {
      return 'required address';
    }
    return null;
  }

  String? pincodeValidation(String val) {
    if (val.isEmpty) {
      return 'required address';
    }
    return null;
  }
}
