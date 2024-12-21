import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grocery_application/controller/signup1_controller.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';

import 'package:grocery_application/custom_widgets/custom_textformfield.dart';

class Signup1 extends StatelessWidget {
  Signup1({super.key});

  final Signup1Controller controller = Get.put(Signup1Controller());

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<Signup1Controller>(builder: (controller) {
            return Form(
              key: controller.formkey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("asset/logo.png"),
                  CustomTextformfield(
                    controller: controller.enteremail,
                    labelText: 'Enter Email',
                    validator: (val) {
                      return controller.emailvalidation(val);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => CustomTextformfield(
                      obscureText: !controller.isPasswordVisible.value,
                      controller: controller.enterpassword,
                      labelText: 'Enter Password',
                      suffixIcon: IconButton(
                        icon: Icon(controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.passwordVisibility();
                        },
                      ),
                      validator: (val) {
                        return controller.passwordValidation(val);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => CustomTextformfield(
                      obscureText: !controller.isPasswordVisible.value,
                      controller: controller.confirmpassword,
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.passwordVisibility();
                        },
                      ),
                      validator: (val) {
                        return controller.confirmpasswordValidation(val);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomElevatedbutton(
                      text: 'Next',
                      color: Colors.white,
                      width: double.infinity,
                      height: 50,
                      onPressed: () {
                        controller.formvalidation1().then(
                          (value) {
                            if (value) {
                              return Get.toNamed('/Signup2');
                            } else {
                              print('validation invalid');
                            }
                          },
                        );
                        // controller.formvalidation();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (ctx) => Signup2()));
                      },
                      backgroundColor: const Color(0xff4F7B39),
                      borderRadius: 7,
                      fontsize: 20,
                      fontWeight: FontWeight.w500),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
