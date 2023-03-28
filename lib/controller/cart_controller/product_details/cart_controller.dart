import 'dart:ffi';

import 'package:get/get.dart';
import 'package:shopping_app/model/cart_model/cart_lilst_model.dart';
import 'package:shopping_app/model/cart_model/product_model.dart';

class CartController extends GetxController{
  var numberOfItems = 1.obs;
  var totalQty = 0.obs;
  var cartItems = <CartItemListModel>[].obs;
  var totalAmount = 0.obs;


  void addItem(){
    numberOfItems.value++;
  }
  void removeItem(){
    if(numberOfItems.value > 1){
      numberOfItems.value--;
    }
  }

  void addItemInCart(ProductModel product) {


    //it will check product exist cartItems or not if exist it will return product index number from cart items otherwise it will return 0
    final index = cartItems.indexWhere((element) => element.product == product);

    if(index >= 0){
      //here product already in list. so we will update only quantity.
      cartItems[index] = CartItemListModel(product: product, qty: numberOfItems.value + cartItems[index].qty);
    }

    else{
      //here product will added and quantity also. here is not any previous quantity.
      cartItems.add(CartItemListModel(product: product, qty: numberOfItems.value));
    }

    // cartItems.add(product);
    totalQty.value = totalQty.value + numberOfItems.value;
    totalAmount.value = totalAmount.value +  (numberOfItems.value * product.price);
    numberOfItems.value = 1;

  }

  void initializeQuantity(){
    numberOfItems.value = 1;
  }

  void removeThisItemFromList(CartItemListModel currentItem) {
    cartItems.remove(currentItem);
    totalAmount.value = totalAmount.value - (currentItem.product.price * currentItem.qty);
    totalQty.value = totalQty.value - currentItem.qty;
  }
}