import 'package:get/get.dart';
import 'package:shopping_app/view/cart/cart_page.dart';
import 'package:shopping_app/view/cart/product_detail/bags_collection.dart';

class CategoryController extends GetxController{
  var currentIndex = 0.obs;

  List<String> categoryList = [
    "jacket",
    "Bags",
    "Over cost",
    "Hand Bags",
    "Perfume",
    "Pants",
    "Jeans",
    "Top",
  ];

  List categoryPage = [CartPage(),const BagsCollection()];

  void changeIndex(int index){
    currentIndex.value = index;
  }

}