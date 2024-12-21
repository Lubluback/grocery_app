import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grocery_application/firebase_options.dart';
import 'package:grocery_application/view/Signup_otp.dart';
import 'package:grocery_application/view/appsettings.dart';
import 'package:grocery_application/view/bottomnavigationbar.dart';
import 'package:grocery_application/view/cart.dart';
import 'package:grocery_application/view/deliver_to.dart';
import 'package:grocery_application/view/home.dart';
import 'package:grocery_application/view/login.dart';
import 'package:grocery_application/view/logo.dart';
import 'package:grocery_application/view/notification.dart';
import 'package:grocery_application/view/payment.dart';
import 'package:grocery_application/view/profile.dart';
import 'package:grocery_application/view/profile_address.dart';
import 'package:grocery_application/view/profile_contact.dart';
import 'package:grocery_application/view/profile_myorders.dart';
import 'package:grocery_application/view/profile_settings.dart';
import 'package:grocery_application/view/profile_trackorder.dart';
import 'package:grocery_application/view/signup_1.dart';
import 'package:grocery_application/view/signup_2.dart';
import 'package:grocery_application/view/signup_3.dart';
import 'package:grocery_application/view/signup_location.dart';
import 'package:grocery_application/view/splashscreen.dart';
import 'package:grocery_application/view/wishlist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
         GetPage(name: '/Logo', page: () => Logo()),
        GetPage(name: '/SplashScreen', page: () => SplashScreen()),
        GetPage(name: '/LoginPage', page: () => LoginPage()),
        GetPage(name: '/Signup1', page: () => Signup1()),
        GetPage(name: '/Signup2', page: () => Signup2()),
        GetPage(name: '/Signup3', page: () => Signup3()),
        GetPage(name: '/SignupOtp', page: () => SignupOtp()),
        GetPage(
            name: '/BottomNavigationBarScreen',
            page: () => BottomNavigationBarScreen()),
        GetPage(name: '/Myorders', page: () => ProfileMyorders()),
        GetPage(name: '/Trackorder', page: () => ProfileTrackorder()),
        GetPage(name: '/Address', page: () => ProfileAddress()),
        GetPage(name: '/ContactUs', page: () => ProfileContact()),
        GetPage(name: '/Settings', page: () => ProfileSettings()),
        GetPage(name: '/EmptyCart', page: () => EmptyCart())
      ],
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Logo(),
    );
  }
}
