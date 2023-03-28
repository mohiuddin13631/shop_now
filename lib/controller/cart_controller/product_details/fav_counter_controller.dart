import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/cart_model/product_model.dart';
import 'package:get/get.dart';

class FavCounterController extends GetxController {
  var numberOfItems = 0.obs;
  var favList = <ProductModel>[].obs;

  void addFavItemToList(ProductModel product) {
    if (favList.contains(product)) {
      Get.snackbar(
          "Already There", "You Already Liked this item.",
          backgroundColor: Color(int.parse(product.color)),
          snackPosition: SnackPosition.BOTTOM,
          borderColor: Colors.indigo,
          borderRadius: 0,
          borderWidth: 2,
          colorText: Colors.white,
          barBlur: 0
      );
    } else {
      favList.add(product);
      numberOfItems++;
    }
  }
}
