import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopping_app/controller/cart_controller/product_details/cart_controller.dart';
import 'package:shopping_app/model/cart_model/product_model.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';
class cartCounter extends StatelessWidget {
   cartCounter({Key? key, required this.products}) : super(key: key);

  final ProductModel products;
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutLineButton(icon: Icons.remove, press: () {
          cartController.removeItem();
        }),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MyTheme.defaultPadding,vertical: MyTheme.defaultPadding),
          child: Obx( ()=>
              Text(
                cartController.numberOfItems.toString().padLeft(2,"0"),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black),
              ),
          ),
        ),
        buildOutLineButton(icon: Icons.add, press: () {
          cartController.addItem();
        }),
      ],
    );
  }
  Widget buildOutLineButton({required IconData icon, required Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Color(int.parse(products.color)),
            elevation: 20,
            minimumSize: const Size(100, 50),
            shadowColor: Color(int.parse(products.color)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: () {
          press();
        },
        child: Icon(icon),
      ),
    );
  }
}
