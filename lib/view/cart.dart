import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/cart_controller.dart';
import 'package:grocery_application/controller/home_controller.dart';
import 'package:grocery_application/custom_widgets/custom_curcleavatar.dart';
import 'package:grocery_application/custom_widgets/custom_elevatedbutton.dart';
import 'package:grocery_application/custom_widgets/custom_text.dart';
import 'package:grocery_application/utils/groceryproducts/Popularproductsdata.dart';
import 'package:grocery_application/view/payment.dart';

class EmptyCart extends StatelessWidget {
  EmptyCart({super.key});
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller1) {
        // final product = controller1.products[index];
        return controller1.cartlist.isEmpty
            ? Column(
                //  crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(child: Image.asset("asset/empty cart 1.png")),
                      const Positioned(
                          left: 200,
                          top: 1,
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
                          left: 140, child: CustomCurcleavatar(radius: 3)),
                    ],
                  ),
                  const CustomText(
                      text: "Your Cart is Empty",
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  const CustomText(
                      text: "Add items to the cart to view\nit here.",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)
                ],
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller1.cartlist.length,
                                itemBuilder: (context, index) {
                                  final product = controller1.cartlist[index];
                                  return ListTile(
                                    title: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text("data"),
                                            TextButton(
                                                onPressed: () {},
                                                child: const Text("Change"))
                                          ],
                                        ),
                                        Image.asset(
                                          product.img,
                                          height: 60,
                                        ),
                                        Text(product.productname)
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {
                                            // controller1.decreaseProductCount();
                                          },
                                        ),
                                        Text("Count: ${product.count}"),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            //    controller1.incrementProductCount();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Subtotal"),
                                  Text("data"),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery"),
                                  Text("free"),
                                ],
                              ),
                              const Divider(
                                color: Color(0xffDDEED4),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Grand Total"),
                                  Text("30"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // How wide the shadow spreads
              blurRadius: 3, // Blur effect
              offset: Offset(0, -4), // Negative y-offset for top shadow
            ),
          ],
        ),
        height: kToolbarHeight + 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Grand Total"),
                Text("30"),
              ],
            ),
            CustomElevatedbutton(
                text: "Proceed",
                color: Colors.white,
                width: 100,
                height: 40,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => Payment()));
                },
                backgroundColor: const Color(0xff4F7B39),
                borderRadius: 5,
                fontsize: 20,
                fontWeight: FontWeight.w400),
          ],
        ),
      ),
    );
  }
}
