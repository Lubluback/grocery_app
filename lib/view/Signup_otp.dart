import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/signup1_controller.dart';
import 'package:grocery_application/controller/signupotp_controller.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';
import 'package:grocery_application/custom_widgets/custom_text.dart';

import 'package:pinput/pinput.dart';

class SignupOtp extends StatefulWidget {
  const SignupOtp({super.key});

  @override
  State<SignupOtp> createState() => _SignupOtpState();
}

class _SignupOtpState extends State<SignupOtp> {
  OtpController controller = Get.put(OtpController());
  Signup1Controller controller1 = Get.find();
  @override
  void initState() {
    controller.sendOtp(controller1.phonenumbercontroller.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Center(child: Image.asset("asset/logo.png")),
            const CustomText(
                text: "Verification",
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600),
            const CustomText(
                text: "Enter OTP code sent to your number",
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<OtpController>(builder: (controller) {
              return Pinput(
                length: 4,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff4F7B39), width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                errorBuilder: (errorText, pin) {
                  return Text(errorText ?? '');
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  controller.verifyOtp(pin);
                  print(pin);
                },
              );
            }),
            const SizedBox(
              height: 10,
            ),
            CustomElevatedbutton(
                text: 'Next',
                color: Colors.black,
                width: double.infinity,
                height: 40,
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (ctx) => SignupLocation()));
                  Get.toNamed('/SignupLocation');
                },
                backgroundColor: const Color(0xff4F7B39),
                borderRadius: 20,
                fontsize: 17,
                fontWeight: FontWeight.w500)
          ],
        ),
      ),
    );
  }
}
