import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_application/custom_widgets/custom_appbar.dart';
import 'package:grocery_application/custom_widgets/custom_curcleavatar.dart';
import 'package:grocery_application/custom_widgets/custom_text.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      appBar: PreferredSize(
    preferredSize:  Size.fromHeight(100),
    child:CustomAppbar(title: Text("Notification", style: GoogleFonts.poppins(
                    color: Color(0xff4F7B39),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )))
  ),
   
      body: Center(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(child: Image.asset("asset/No notification 1.png")),
                const Positioned(
                    left: 200,
                    // top: 0,
                    child: Icon(
                      Icons.add,
                      size: 15,
                    )),
                const Positioned(
                  left: 100,
                  top: 70,
                  child: CustomCurcleavatar(radius: 5),
                ),
                const Positioned(
                  left: 260,
                  top: 120,
                  child: CustomCurcleavatar(radius: 5),
                ),
                const Positioned(
                  left: 280,
                  top: 50,
                  child: CustomCurcleavatar(radius: 6),
                ),
                const Positioned(
                    left: 120, child: CustomCurcleavatar(radius: 3)),
              ],
            ),
            CustomText(
                text: "NO Notifications",
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600),
            CustomText(
                text:
                    "It seems like you haven’t\nreceived any notifications yet",
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400)
          ],
        ),
      ),
    );
  }
}
