import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_application/controller/payment_controller.dart';
import 'package:grocery_application/custom_widgets/custom_appbar.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';
import 'package:grocery_application/view/payment_final.dart';

class Payment extends StatelessWidget {
  Payment({super.key});

  final PaymentController controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: CustomAppbar(
                title: Text("Payment",
                    style: GoogleFonts.poppins(
                      color: const Color(0xff4F7B39),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )))),
        body: GetBuilder<PaymentController>(builder: (controller1) {
          return Column(
            children: [
              RadioListTile<int>(
                activeColor: const Color(0xff4F7B39),
                fillColor: const WidgetStatePropertyAll(
                  Color(0xff4F7B39),
                ),
                value: 1,
                groupValue: controller1.selectedvalue,
                title: const Text('Cash on Delivery'),
                onChanged: (value) {
                  controller1.handleRadioSelection(value);
                },
              ),
              RadioListTile<int>(
                activeColor: const Color(0xff4F7B39),
                fillColor: const WidgetStatePropertyAll(
                  Color(0xff4F7B39),
                ),
                value: 2,
                groupValue: controller1.selectedvalue,
                title: const Text('Debit/Credit Card'),
                onChanged: (value) {
                  controller1.handleRadioSelection(value);
                },
              ),
              RadioListTile<int>(
                activeColor: const Color(0xff4F7B39),
                fillColor: const WidgetStatePropertyAll(
                  Color(0xff4F7B39),
                ),
                value: 3,
                groupValue: controller1.selectedvalue,
                title: const Text('Google Pay'),
                onChanged: (value) {
                  controller1.handleRadioSelection(value);
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [Text("data"), Text("data")],
                    ),
                    CustomElevatedbutton(
                        text: 'Next',
                        color: Colors.white,
                        width: 100,
                        height: 40,
                        onPressed: () {
                          if (controller1.selectedvalue != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => PaymentFinal()));
                          }
                        },
                        backgroundColor: controller1.selectedvalue == null
                            ? Colors.grey
                            : const Color(0xff4F7B39),
                        borderRadius: 30,
                        fontsize: 16,
                        fontWeight: FontWeight.bold)
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
