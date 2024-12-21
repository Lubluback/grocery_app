import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_application/custom_widgets/custom_appbar.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';
import 'package:grocery_application/custom_widgets/custom_text.dart';
import 'package:grocery_application/view/paymentpopup.dart';

class PaymentFinal extends StatelessWidget {
   PaymentFinal({super.key});
 final PaymentFinal controller = Get.put(PaymentFinal());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: CustomAppbar(
              title: Text("Payment",
                  style: GoogleFonts.poppins(
                    color: const Color(0xff4F7B39),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
                text: "Cash on Delivery",
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500),
            const SizedBox(
              height: 60,
            ),
            const Divider(
              color: Color(0xffDDEED4),
            ),
            const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal"),
                    Text("data"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery"),
                    Text("data"),
                  ],
                ),
                Divider(
                  color: Color(0xffDDEED4),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Grand Total"),
                    Text("30"),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: GetBuilder(
                builder: (controller1) {
                  return CustomElevatedbutton(
                      text: "Confirm",
                      color: Colors.white,
                      width: 100,
                      height: 40,
                      onPressed: () {
                      
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const PaymentPopup()));
                      },
                      backgroundColor: const Color(0xff4F7B39),
                      borderRadius: 5,
                      fontsize: 20,
                      fontWeight: FontWeight.w400);
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
