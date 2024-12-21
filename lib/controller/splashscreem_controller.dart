import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocery_application/services/sharedpreferences/sharedpreference.dart';

class SplashscreenController extends GetxController {
  final PageController _pageController = PageController();
  get pageController => _pageController;
  int _currentPage = 0;
  get currentpage => _currentPage;

  void goToNextPage() async {
    if (_currentPage < 2) {
      // Adjust based on total number of pages (3 in this case)
      _pageController.nextPage(
        duration: Duration(microseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (ctx) => LoginPage()));
      Get.offAllNamed('/LoginPage');
    }
  }

  void currentpageindex(index) {
    _currentPage = index;
  }
}
