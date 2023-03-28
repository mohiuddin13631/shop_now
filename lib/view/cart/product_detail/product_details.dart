
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shopping_app/controller/cart_controller/product_details/cart_controller.dart';
import 'package:shopping_app/controller/cart_controller/product_details/fav_counter_controller.dart';
import 'package:shopping_app/model/cart_model/product_model.dart';
import 'package:shopping_app/view/cart/product_detail/cart_list/cart_list.dart';
import 'package:shopping_app/view/cart/product_detail/favorite_list/favorite_list.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';

import 'component/product_details_body.dart';
class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key, required this.products}) : super(key: key);

  final ProductModel products;//come from card page
  FavCounterController favCounterController = Get.find();
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    //initilize quantity here so that it become 1 after going back product page
    cartController.initializeQuantity();

    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(
        int.parse(products.color),
      ),
      appBar: buildAppBar(),
      body: ProductDetailsBody(products: products,),

    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(
      int.parse(products.color),
      ),
      elevation: 0,
      leading: IconButton( //back button
        onPressed: (){
          Get.back();
        },
        icon: SvgPicture.asset("assets/svg/back.svg",color: Colors.white,),
      ),
      actions: [
        InkWell(
          onTap: (){
            Get.to(FavoriteList());
          },
          child: Padding(
            padding: EdgeInsets.only(left: MyTheme.defaultPadding,right: MyTheme.defaultPadding),
            child: Badge(
              label: Obx(()=> Text(favCounterController.numberOfItems.value.toString())),
                child: SvgPicture.asset("assets/svg/heart.svg",width: 30,)
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Get.to(CartList());
          },
          child: Padding(
            padding: EdgeInsets.only(left: MyTheme.defaultPadding,right: MyTheme.defaultPadding),
            child: Badge(
                label: Obx(()=> Text(cartController.totalQty.value.toString())),
                child: SvgPicture.asset("assets/svg/cart.svg")
            ),
          ),
        ),
      ],
    );
  }
}

