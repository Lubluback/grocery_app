import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/signup1_controller.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';
import 'package:grocery_application/custom_widgets/custom_textformfield.dart';

class Signup3 extends StatelessWidget {
  Signup3({super.key});
  
  final Signup1Controller controller = Get.put(Signup1Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GetBuilder<Signup1Controller>(builder: (controller) {
            return Form(
              key: controller.formkey,
              child: Column(
                children: [
                  Image.asset(
                    "asset/logo.png",
                    height: 260,
                  ),
                  CustomTextformfield(
                    controller: controller.addressline1,
                    labelText: ' Address Line 1',
                    validator: (val) {
                      return controller.addressLine1Validation(val!);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextformfield(
                    obscureText: true,
                    controller: controller.addressline2,
                    labelText: 'Address Line 2',
                    validator: (val) {
                      return controller.addressLine2Validation(val!);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextformfield(
                    obscureText: true,
                    controller: controller.city,
                    labelText: 'City',
                    validator: (val) {
                      return controller.cityValidation(val!);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextformfield(
                    obscureText: true,
                    controller: controller.state,
                    labelText: 'State',
                    validator: (val) {
                      return controller.stateValidation(val!);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextformfield(
                    obscureText: true,
                    controller: controller.pincode,
                    labelText: 'Pincode',
                    validator: (val) {
                      return controller.pincodeValidation(val!);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomElevatedbutton(
                      text: 'Next',
                      color: Colors.white,
                      width: double.infinity,
                      height: 40,
                      onPressed: () {
                        controller.formvalidation3().then(
                          (value) {
                            if (value) {
                              return Get.toNamed('/SignupOtp');
                            } else {
                              print('invalid');
                            }
                          },
                        );
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (ctx) => SignupOtp()));
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
