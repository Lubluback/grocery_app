import 'package:get/get.dart';
import 'package:grocery_application/model/prodects_model.dart';


class CartController extends GetxController {
  bool isCartempty = true;
  // Reactive list of products
  // List<ProductsModel> products = [];

  // Add a product to the list
  // void addProduct(String name) {
  //    ProductData.productsModels.add(ProductsModel(img: img, price: price, productname: productname, count: count));
  // }

  // Increase the count of a product
  void incrementProductCount(ProductsModel product) {
     product.count++;
   // ProductData.productsModels[index].count++;
   // ProductData.productsModels.refresh(); // Notify listeners of the state update.
  }
  
  // decrease the count of a product
  void decreaseProductCount(ProductsModel product) {
    product.count--;
    // ProductData.productsModels.refresh(); // Notify listeners of the state update.
  }
}
