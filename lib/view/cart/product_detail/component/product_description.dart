import 'package:flutter/material.dart';
import 'package:shopping_app/model/cart_model/product_model.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';
class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.products,
  }) : super(key: key);

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MyTheme.defaultPadding * 2),
      child: Text(products.desc,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 15
        ),
      ),
    );
  }
}

