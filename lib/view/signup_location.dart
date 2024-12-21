import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/signup_location_controller.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';
import 'package:grocery_application/custom_widgets/custom_text.dart';

class SignupLocation extends StatelessWidget {
  SignupLocation({super.key});
  final SignupLocationController controller =
      Get.put(SignupLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("asset/logo.png"),
            const CustomText(
              text: ' Enable Location',
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            const CustomText(
              text:
                  'We will need your location to give you \nbetter experience. ',
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 29,
            ),
            GetBuilder<SignupLocationController>(builder: (controller) {
              return CustomElevatedbutton(
                  text: 'Enable Location',
                  color: Colors.white,
                  width: double.infinity,
                  height: 40,
                  onPressed: () {
                    controller.getCurrentLocation().then(
                      (value) {
                        Get.toNamed('/BottomNavigationBarScreen');
                      },
                    );
                  },
                  backgroundColor: const Color(0xff4F7B39),
                  borderRadius: 7,
                  fontsize: 20,
                  fontWeight: FontWeight.w500);
            }),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (ctx) => BottomNavigationBarScreen()));
                Get.toNamed('/BottomNavigationBarScreen');
              },
              child: const CustomText(
                text: ' Not now',
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
