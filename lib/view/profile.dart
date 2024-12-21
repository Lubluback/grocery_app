import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grocery_application/controller/profile_controller.dart';
import 'package:grocery_application/custom_widgets/custom_listtile.dart';
import 'package:grocery_application/view/profile_address.dart';
import 'package:grocery_application/view/profile_contact.dart';
import 'package:grocery_application/view/profile_myorders.dart';
import 'package:grocery_application/view/profile_settings.dart';
import 'package:grocery_application/view/profile_trackorder.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<ProfileController>(builder: (controller1) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    //  padding: EdgeInsets.only(top: 60),
                    height: 250,
                    width: 370,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 280),
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.settings)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                actionsAlignment:
                                    MainAxisAlignment.spaceBetween,
                                title: Text("Choose an Option"),
                                content:
                                    Text("Select one of the options below."),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      await controller
                                          .pickImageFromGallery()
                                          .then(
                                        (value) {
                                          Get.back();
                                        },
                                      );
                                      // // Action for Button 1
                                      // Close the dialog
                                      // Get.snackbar(
                                      //     "Action", "You clicked Button 1");
                                    },
                                    child: Icon(Icons.browse_gallery),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await controller.captureImageWithCamera();
                                      // Action for Button 2
                                      Get.back(); // Close the dialog
                                      // Get.snackbar(
                                      //     "Action", "You clicked Button 2");
                                    },
                                    child: Icon(Icons.camera),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: GetBuilder<ProfileController>(builder: (ctrl) {
                            return CircleAvatar(
                              radius: 60,
                              backgroundImage: ctrl.selectedImage.value != null
                                  ? FileImage(ctrl.selectedImage.value!)
                                  : null,
                            );
                          }),
                        ),
                        Text("data"),
                        Text("data")
                      ],
                    ),
                  ),
                ),
                CustomListTile(
                  icons: Icons.access_time_sharp,
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (ctx) => ProfileMyorders()));
                    Get.toNamed('/Myorders');
                  },
                  text: "My Orders",
                ),
                CustomListTile(
                  icons: Icons.track_changes_rounded,
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (ctx) => ProfileTrackorder()));
                    Get.toNamed('/Trackorder');
                  },
                  text: "Track Order",
                ),
                CustomListTile(
                  icons: Icons.location_on_outlined,
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (ctx) => ProfileAddress()));
                    Get.toNamed('/Address');
                  },
                  text: "Address",
                ),
                CustomListTile(
                  icons: Icons.call,
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (ctx) => ProfileContact()));
                    Get.toNamed('/ContactUs');
                  },
                  text: "Contact Us",
                ),
                CustomListTile(
                  icons: Icons.settings,
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (ctx) => ProfileSettings()));
                    log("haiiiii");
                    Get.toNamed('/Settings');
                  },
                  text: "Settings",
                ),
                CustomListTile(
                  icons: Icons.logout_outlined,
                  onPressed: () async {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (ctx) => ProfileSettings()));
                    await controller1.logout();
                    Get.offAndToNamed('/LoginPage');
                  },
                  text: " Logout",
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
