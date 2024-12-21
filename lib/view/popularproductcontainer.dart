import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/home_controller.dart';
import 'package:grocery_application/custom_widgets/custom_text.dart';
import 'package:grocery_application/model/prodects_model.dart';
import 'package:grocery_application/view/bottomnavigationbar.dart';

class Containers extends StatelessWidget {
  Containers({super.key, required this.model});

  final ProductsModel model;
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller1) {
        return Container(

            // height: 280,
            // width: 300,
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                // color: Colors.green,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade400, width: 1.4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: controller1.favoritelist.contains(model)
                          ? Icon(
                              Icons.favorite,
                              color: Color(0xff4F7B39),
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                      onPressed: () {
                        if (controller1.favoritelist.contains(model)) {
                          controller1.removeFavorite(model);
                        } else {
                          controller1.addToFavorite(model);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        model.img,
                      ),
                    ),
                  ),
                  CustomText(
                      textAlign: TextAlign.left,
                      text: model.productname,
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                  CustomText(
                      text: model.price,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54)),
                        //    padding: EdgeInsets.only(bottom: 19),
                        alignment: Alignment.center,
                        height: 25,
                        width: 25,
                        child: GestureDetector(
                            onTap: () {
                              controller1.decrement(model);
                              // if (controller1.cartlist[].count == 0) {
                              //   Get.snackbar('Add to your Cart',
                              //       'product is added successfully');
                              // }
                            },
                            child: const Icon(Icons.remove)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            border: Border.all(color: Colors.black54)),
                        alignment: Alignment.center,
                        height: 25,
                        width: 25,
                        child: Text(
                          model.count.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54)),
                        height: 25,
                        width: 25,
                        child: GestureDetector(
                            onTap: () {
                              controller1.increment(model);
                            },
                            child: Icon(Icons.add)),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 17,
                        backgroundColor: Color(0xff4F7B39),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            controller1.addToCart(model);
                            Get.snackbar('Add to your Cart',
                                'product is added to your cart');
                            // Get.toNamed('/EmptyCart');
                          },
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            size: 19,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
      }),
    );
  }
}
