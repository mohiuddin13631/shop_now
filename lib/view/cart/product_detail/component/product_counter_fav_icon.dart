import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopping_app/controller/cart_controller/product_details/cart_controller.dart';
import 'package:shopping_app/controller/cart_controller/product_details/fav_counter_controller.dart';
import 'package:shopping_app/model/cart_model/product_model.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';

import 'cart_counter.dart';

class ProductCounterFavIcon extends StatelessWidget {
   ProductCounterFavIcon({
    Key? key,
    required this.products,
  }) : super(key: key);


  FavCounterController favCounterController = Get.find();
  final ProductModel products;
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MyTheme.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          cartCounter(products: products),

          InkWell(
            onTap: (){
              favCounterController.addFavItemToList(products);
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle
              ),
              child: SvgPicture.asset("assets/svg/heart.svg"),
            ),
          )
        ],
      ),
    );
  }
}
