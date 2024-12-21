import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_application/controller/deliver_to_controller.dart';
import 'package:grocery_application/custom_widgets/custom_appbar.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';
import 'package:grocery_application/custom_widgets/custom_textformfield.dart';

class DeliverTo extends StatefulWidget {
  DeliverTo({super.key});

  @override
  State<DeliverTo> createState() => _DeliverToState();
}

class _DeliverToState extends State<DeliverTo> {
  String? _selectedOption;
  String currentlocation = "option 1";
  String newaddress = "option 2";
  void _handleRadioSelection(String? value) {
    setState(() {
      // Toggle logic: If already selected, unselect it
      _selectedOption = (_selectedOption == value) ? null : value;
    });
  }

  DeliverController controller = Get.put(DeliverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          title: Text(
        "Deliver to",
        style: GoogleFonts.poppins(
          color: Color(0xff4F7B39),
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            RadioListTile<String>(
                activeColor: Color(0xff4F7B39),
                fillColor: WidgetStatePropertyAll(
                  Color(0xff4F7B39),
                ),
                title: const Text("Current Location"),
                value: currentlocation,
                groupValue: _selectedOption,
                onChanged: _handleRadioSelection),
            RadioListTile<String>(
                activeColor: Color(0xff4F7B39),
                fillColor: WidgetStatePropertyAll(
                  Color(0xff4F7B39),
                ),
                title: const Text("New Address"),
                value: newaddress,
                groupValue: _selectedOption,
                onChanged: _handleRadioSelection),
            const SizedBox(height: 20),
            // Text(
            //   _selectedOption == null
            //       ? "No option selected"
            //       : "Selected: $_selectedOption",
            //   style: const TextStyle(fontSize: 16),
            // ),
            GetBuilder<DeliverController>(builder: (controller) {
              return Container(
                  child: _selectedOption == newaddress
                      ? Column(
                          children: [
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
                        )
                      : null);
            }),
            Spacer(),
            CustomElevatedbutton(
                text: "Continue",
                color: Colors.white,
                width: double.infinity,
                height: 40,
                onPressed: () {},
                backgroundColor:
                    _selectedOption == null ? Colors.grey : Color(0xff4F7B39),
                borderRadius: 5,
                fontsize: 20,
                fontWeight: FontWeight.w500)
          ],
        ),
      ),
    );
  }
}
