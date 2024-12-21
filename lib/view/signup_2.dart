import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/signup1_controller.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';
import 'package:grocery_application/custom_widgets/custom_textformfield.dart';

class Signup2 extends StatelessWidget {
  Signup2({super.key});
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
                  Image.asset("asset/logo.png"),
                  CustomTextformfield(
                    controller: controller.usernameController,
                    labelText: 'Enter Username',
                    validator: (val) {
                      return controller.username(val);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextformfield(
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    controller: controller.phonenumbercontroller,
                    labelText: 'Enter PhoneNumber',
                    validator: (val) {
                      return controller.phoneNumber(val);
                    },
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
                        controller.formvalidation2().then(
                          (value) {
                            if (value) {
                              return Get.toNamed('/Signup3');
                            } else {
                              print('value invalid');
                            }
                          },
                        );
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (ctx) => Signup3()));
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
