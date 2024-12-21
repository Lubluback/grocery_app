import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/controller/home_controller.dart';
import 'package:grocery_application/custom_widgets/custom_appbar.dart';
import 'package:grocery_application/custom_widgets/custom_curcleavatar.dart';
import 'package:grocery_application/custom_widgets/custom_text.dart';

class EmptyWishlist extends StatelessWidget {
  EmptyWishlist({super.key});
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: CustomAppbar(title: Text("Wishlist"))),
        body: GetBuilder<HomeController>(builder: (controller1) {
          return controller1.favoritelist.isEmpty
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
                        text: "Your Wishlist is Empty",
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    const CustomText(
                        text:
                            "It seems like you haven’t added any\nitems to your wishlist",
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller1.favoritelist.length,
                                  itemBuilder: (context, index) {
                                    final product =
                                        controller1.favoritelist[index];
                                    return ListTile(
                                        title: Column(
                                          children: [
                                            Image.asset(
                                              product.img,
                                              height: 60,
                                            ),
                                            Text(product.productname)
                                          ],
                                        ),
                                        trailing: TextButton(
                                            onPressed: () {
                                              controller1
                                                  .removeFavorite(product);
                                            },
                                            child: const Text("Remove")));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        }));
  }
}
