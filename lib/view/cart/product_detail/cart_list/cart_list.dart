import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shopping_app/controller/cart_controller/product_details/cart_controller.dart';
import 'package:shopping_app/view/cart/product_detail/cart_list/component/cart_list_background.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CartListBackground(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx( ()=>
                    ListView.builder(
                        itemCount: cartController.cartItems.length,
                        itemBuilder: (context, index) {
                          var currentItem = cartController.cartItems[index];
                          return Card(
                            clipBehavior: Clip.none,
                            color: Color(int.parse(currentItem.product.color)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  currentItem.product.image,
                                  width: 100,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Quantity: ${currentItem.qty}"),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          cartController.removeThisItemFromList(currentItem);
                                        },
                                        icon:const Icon(Icons.delete)),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MyTheme.defaultPadding,
                    right: MyTheme.defaultPadding,
                    bottom: 10),
                child: Obx( ()=>
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryVariant,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              "Total Amount: \n ${cartController.totalAmount.value.toString()}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryVariant,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Total Quantity: \n ${cartController.totalQty.value.toString()}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ]),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset(
          "assets/svg/back.svg",
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(
        "Item list",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
