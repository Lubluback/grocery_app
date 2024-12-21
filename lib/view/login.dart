import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/login_controller.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';
import 'package:grocery_application/custom_widgets/custom_text.dart';
import 'package:grocery_application/custom_widgets/custom_textformfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final List<String> img = [
    "asset/googleiconimg.png",
    "asset/facebookimg.png",
  ];
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: GetBuilder<LoginController>(builder: (controller1) {
            return Form(
              key: controller1.formkey,
              child: Column(
                children: [
                  Image.asset("asset/logo.png"),
                  CustomTextformfield(
                    controller: controller1.emailController,
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.person),
                    validator: (val) {
                      return controller1.email(val);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextformfield(
                    obscureText: controller1.isPasswordVisible,
                    controller: controller1.passwordcontroller,
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.no_encryption_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(controller1.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        controller1.passwordVisibility();
                      },
                    ),
                    validator: (val) {
                      return controller1.passwordValidation(val);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomElevatedbutton(
                      text: 'Login',
                      color: Colors.white,
                      width: double.infinity,
                      height: 45,
                      onPressed: () {
                        controller1.login().then(
                          (value) {
                            if (value) {
                              Get.offAndToNamed('/BottomNavigationBarScreen');
                            } else {
                              print('invalid data');
                            }
                          },
                        );
                      },
                      backgroundColor: const Color(0xff4F7B39),
                      borderRadius: 10,
                      fontsize: 20,
                      fontWeight: FontWeight.w500),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                        text: 'Forgot Password?',
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          text: "Don\'t Have an Account?",
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (ctx) => Signup1()));
                          Get.toNamed('/Signup1');
                        },
                        child: const CustomText(
                            text: "Sign Up",
                            color: Color(0xff4F7B39),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //     text: 'Don\'t Have an Account? ',
                  //     style: TextStyle(color: Colors.black, fontSize: 15),
                  //     children: const <TextSpan>[
                  //       TextSpan(
                  //           text: 'Sign Up',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               color: Color(0xff4F7B39))),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                      text: 'Or',
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(img.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: const Color(0xffDDEED4),
                            child: Image.asset(
                              img[index],
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        );
                      }))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
