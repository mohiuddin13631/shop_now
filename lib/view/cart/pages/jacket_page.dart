import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/cart_controller/product_controller.dart';
import '../../custom_widget/my_theme.dart';
import '../components/item_cart.dart';
import '../product_detail/product_details.dart';
class JacketPage extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  JacketPage({
    Key? key,
    // required this.productController,
  }) : super(key: key);

  // final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return Obx( ()=> productController.isDataLoadingCompleted.value == true? Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: MyTheme.defaultPadding,horizontal: MyTheme.defaultPadding),
        child: GridView.builder(
            itemCount: productController.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                mainAxisSpacing: MyTheme.defaultPadding,//padding between two products
                crossAxisSpacing: MyTheme.defaultPadding
            ),
            itemBuilder: (context,index){

              var currentProduct = productController.products[index];
              return ItemCard(
                currentProduct: currentProduct,
                cardClickHandler: (){
                  Get.to(ProductDetailPage(products: currentProduct,));
                },
              );
            }),
      ),
    )
        :const CircularProgressIndicator(),
    );
  }
}
