import 'dart:developer';

import 'package:get/get.dart';
import 'package:grocery_application/model/prodects_model.dart';
import 'package:grocery_application/utils/groceryproducts/Popularproductsdata.dart';

class HomeController extends GetxController {
  List<ProductsModel> list = ConstData.productsModels;
  List<ProductsModel> cartlist = [];
  List<ProductsModel> favoritelist = [];

  void increment(ProductsModel product) {
    final result = list.indexWhere(
      (element) => element.id == product.id,
    );
    //log('${product.toString()}');
    //   print(result);
    int newCount = list[result].count;
    ++newCount;
    log(newCount.toString());
    list[result] = list[result].copyWith(count: newCount);
    log(list[result].toString());
    // if (!cartlist.any(
    //   (element) => element.id == product.id,
    // )) {
    //   cartlist.add(list[result]);
    //   // cartlist.toSet().toList();
    // }
    // log(list.toString());
    update();
  }

  void decrement(ProductsModel product) {
    final result = list.indexWhere(
      (element) => element.id == product.id,
    );
    if (list[result].count != 0) {
      int newCount = list[result].count;
      --newCount;
      // log(newCount.toString());
      list[result] = list[result].copyWith(count: newCount);
      log(list[result].toString());
      if (newCount == 0) {
        log(newCount.toString());
        cartlist.removeWhere(
          (element) => element.id == product.id,
        );
      }
    }

    update();
  }

  addToCart(ProductsModel product) {
    final result = list.indexWhere(
      (element) => element.id == product.id,
    );
    if (!cartlist.any(
      (element) => element.id == product.id,
    )) {
      cartlist.add(list[result]);
    }

    // void removeProductFromCart(Product product) {
    //   // Check if the product exists in the cart
    //   final index = cartItems.indexWhere((item) => item.id == product.id);
    //   if (index != -1) {
    //     if (cartItems[index].count > 1) {
    //       // Decrease the count if greater than 1
    //       cartItems[index].count--;
    //       cartItems.refresh(); // Update UI
    //     } else {
    //       // Remove the product if count is 1
    //       cartItems.removeAt(index);
    //     }
    //   }
    // }
  }

  addToFavorite(ProductsModel product) {
    if (!favoritelist.any(
      (element) => element.id == product.id,
    )) {
      favoritelist.add(product);
    }
    update();
  }

  removeFavorite(ProductsModel product) {
    favoritelist.removeWhere(
      (element) => element.id == product.id,
    );
    update();
  }
}
