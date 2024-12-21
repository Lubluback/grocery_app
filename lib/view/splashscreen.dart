//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/splashscreem_controller.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';
import 'package:grocery_application/custom_widgets/custom_text.dart';
import 'package:grocery_application/services/sharedpreferences/sharedpreference.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    controller.goToNextPage();
    super.initState();
  }

  SplashscreenController controller = Get.put(SplashscreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashscreenController>(builder: (controller1) {
        return PageView(
          controller: controller1.pageController,
          onPageChanged: (index) {
            controller1.currentpageindex(index);
          },
          children: [
            _buildPage(
                text2:
                    'Set your delivery location Choose your\ngroeries from a wide range of our\nrequired products',
                img: 'asset/figma splash fast deli 1.png',
                text1: "Shop for your daily needs",
                buttontext: 'Next'),
            _buildPage(
                text2: 'Keeping track of real-time delivery\nlocation',
                img: 'asset/figma splash delivery 1.png',
                text1: 'Real Time Reporting',
                buttontext: 'Next'),
            _buildPage(
                text2:
                    'Our delivery executive will deliver you\norder under 24 hours',
                img: 'asset/splash doorstep 1.png',
                text1: 'Fast Doorstep Delivery',
                buttontext: 'Get Start'),
          ],
        );
      }),
    );
  }

  Widget _buildPage({
    required String text2,
    required String img,
    required String text1,
    required String buttontext,
  }) {
    return GetBuilder<SplashscreenController>(builder: (controller1) {
      return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(img),
            CustomText(
              text: text1,
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              text: text2,
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 20,
            ),
            SmoothPageIndicator(
              controller: controller1.pageController,
              count: 3, // Total number of pages
              effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                dotColor: Color(0xffDDEED4),
                activeDotColor: Color(0xff4F7B39),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            CustomElevatedbutton(
              text: buttontext,
              color: Colors.white,
              width: 20,
              height: 40,
              onPressed: controller1.goToNextPage,
              backgroundColor: Color(0xff4F7B39),
              borderRadius: 30,
              fontsize: 16,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      );
    });
  }
}
