import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_application/controller/app_settings_controller.dart';
import 'package:grocery_application/custom_widgets/custom_appbar.dart';

class AppSettings extends StatelessWidget {
  AppSettings({super.key});
  final AppSettingsController controller = Get.put(AppSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppbar(
              title: Text("My Order",
                  style: GoogleFonts.poppins(
                    color: Color(0xff4F7B39),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )))),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notification",
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  Switch(
                    activeColor: Color(0xff4F7B39),
                    value: controller.isSwitchedOn1.value,
                    onChanged: (value) {
                      controller.isSwitchedOn1.value = value;
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Mode",
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  Switch(
                    activeColor: Color(0xff4F7B39),
                    value: controller.isSwitchedOn2.value,
                    onChanged: (value) {
                      controller.isSwitchedOn2.value = value;
                    },
                  ),
                ],
              ),
              Text("Language",
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("About Us",
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("Terms and Condition",
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
