import 'package:get/get.dart';
import 'package:grocery_application/services/sharedpreferences/sharedpreference.dart';

class LogoController extends GetxController {
  void goToNextPage() async {
    final data = await Sharedpreference.fetchUser();
    if (data != null) {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (ctx) => LoginPage()));
      Get.offAllNamed('/BottomNavigationBarScreen');
    } else {
      // Adjust based on total number of pages (3 in this case)
      Get.toNamed('/SplashScreen');
    }
  }
}
