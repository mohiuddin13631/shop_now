import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/cart_model/product_model.dart';

class ProductController extends GetxController
{
  var products = <ProductModel>[].obs;
  var isDataLoadingCompleted = false.obs;

  @override
  void onInit() { //when product controller initialize automatically onInit will call
    // TODO: implement onInit
    super.onInit();

    fetchData();
  }

  Future<void> fetchData() async {
    var productJson = await rootBundle.loadString("assets/json/tutorial_product.json");

    var decodedData = jsonDecode(productJson);

    products.value = List.from(decodedData).map((e) => ProductModel.fromMap(e)).toList(); //stored json data in product variable

    isDataLoadingCompleted.value = true;
  }

  void destroy(){
    products.value = [];
  }
}