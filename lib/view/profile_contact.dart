import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_application/custom_widgets/custom_appbar.dart';

class ProfileContact extends StatelessWidget {
  const ProfileContact({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
    preferredSize:  Size.fromHeight(100),
    child:CustomAppbar(title: Text("My Order", style: GoogleFonts.poppins(
                    color: Color(0xff4F7B39),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )))
  ),
    );
  }
}