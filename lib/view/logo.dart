import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/logo_controller.dart';
import 'package:grocery_application/view/splashscreen.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  LogoController controller = Get.put(LogoController());
  @override
  void initState() {
    Timer(Duration(seconds: 30), () => controller.goToNextPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "asset/logo.png",
          height: Get.height,
        ),
      ),
    );
  }
}
