import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield(
      {super.key,
      required this.controller,
      required this.labelText,
       this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.obscureText = false});
  final TextEditingController controller;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType ,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xff4F7B39),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xff4F7B39),
            ),
          ),
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelStyle: TextStyle(
            color: Color(0xffD3DFCD),
          )),
    );
  }
}
