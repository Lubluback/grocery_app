import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/home_controller.dart';
import 'package:grocery_application/view/cart.dart';
import 'package:grocery_application/view/favourite.dart';
import 'package:grocery_application/view/home.dart';
import 'package:grocery_application/view/profile.dart';
import 'package:grocery_application/view/wishlist.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int selectedIndex = 0;
  void currentIndex(index) {
    selectedIndex = index;
  }

  final _pageOptions = [
    const Home(),
    EmptyCart(),
    EmptyWishlist(),
    Profile(),
  ];
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: Color(0xff4F7B39),
              size: 35,
            ),
          ),
          BottomNavigationBarItem(
              label: 'Cart',
              icon: GetBuilder<HomeController>(builder: (controller1) {
                return Badge.count(
                  count: controller1.cartlist.length,
                  child: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Color(0xff4F7B39),
                    size: 35,
                  ),
                );
              })),
          const BottomNavigationBarItem(
            label: 'Fvaourite',
            icon: Icon(
              Icons.favorite,
              color: Color(0xff4F7B39),
              size: 35,
            ),
          ),
          const BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person,
              color: Color(0xff4F7B39),
              size: 35,
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: (val) {
          setState(() {});
          currentIndex(val);
        },
        elevation: 0,
      ),
      body: _pageOptions[selectedIndex],
    );
  }
}
