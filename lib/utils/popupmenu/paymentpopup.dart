import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Paymentpopup {
 static void showPaymentPopup(bool isSuccess) {
    Get.defaultDialog(
      title: isSuccess ? 'Payment Success' : 'Payment Failed',
      titleStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isSuccess ? Colors.green : Colors.red,
      ),
      content: Icon(
        isSuccess ? Icons.check_circle : Icons.error,
        size: 80,
        color: isSuccess ? Colors.green : Colors.red,
      ),
      confirm: ElevatedButton(
        onPressed: () => Get.back(),
        child: const Text('OK'),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSuccess ? Colors.green : Colors.red,
        ),
      ),
    );
  }
 

}

