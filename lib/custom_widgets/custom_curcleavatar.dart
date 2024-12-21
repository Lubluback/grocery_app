import 'package:flutter/material.dart';

class CustomCurcleavatar extends StatelessWidget {
  const CustomCurcleavatar({super.key, required this.radius});
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Color(0xff4F7B39),
    );
  }
}
