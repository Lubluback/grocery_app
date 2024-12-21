import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_application/controller/profile_address.dart';
import 'package:grocery_application/custom_widgets/custom_appbar.dart';
import 'package:grocery_application/custom_widgets/custom_textformfield.dart';

class ProfileAddress extends StatelessWidget {
  ProfileAddress({super.key});
  final ProfileAddressController controller =
      Get.put(ProfileAddressController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppbar(
              title: Text("Address",
                  style: GoogleFonts.poppins(
                    color: Color(0xff4F7B39),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )))),
      body: GetBuilder<ProfileAddressController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Current Location",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                Text("Delivering to :",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 50,
                ),
                Text("Address",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                CustomTextformfield(
                  controller: controller.addressline1,
                  labelText: ' Address Line 1',
                  validator: (val) {
                    return controller.addressLine1Validation(val!);
                  },
                ),
                SizedBox(
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
                SizedBox(
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
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextformfield(
                        obscureText: true,
                        controller: controller.state,
                        labelText: 'State',
                        validator: (val) {
                          return controller.stateValidation(val!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomTextformfield(
                        obscureText: true,
                        controller: controller.pincode,
                        labelText: 'Pincode',
                        validator: (val) {
                          return controller.pincodeValidation(val!);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
