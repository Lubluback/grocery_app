import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_application/custom_widgets/custom_appbar.dart';
import 'package:grocery_application/custom_widgets/custom_textformfield.dart';

class ProfileSettings extends StatelessWidget {
  ProfileSettings({super.key});
  final TextEditingController firstname = TextEditingController();
  final TextEditingController secondname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppbar(title: Text("My Order", style: GoogleFonts.poppins(
                    color: Color(0xff4F7B39),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )))),
      body: Column(
        children: [
          CustomTextformfield(
            controller: firstname,
            labelText: 'First Name',
            validator: (val) {
              // return controller.username(val);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextformfield(
            controller: secondname,
            labelText: 'Second Name',
            validator: (val) {
              // return controller.username(val);
            },
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextformfield(
            controller: email,
            labelText: 'Enter Email',
            validator: (val) {
              //    return controller.emailvalidation(val);
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextformfield(
            obscureText: true,
            keyboardType: TextInputType.number,
            controller: phoneNumber,
            labelText: 'Enter PhoneNumber',
            validator: (val) {
              //    return controller.phoneNumber(val);
            },
          ),
        ],
      ),
    );
  }
}
