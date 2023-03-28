import 'package:flutter/material.dart';
import 'package:shopping_app/model/cart_model/product_model.dart';

import 'product_detail_color.dart';
class ProductColorSize extends StatelessWidget {
  const ProductColorSize({
    Key? key,
    required this.products,
  }) : super(key: key);

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Color",
                  style: TextStyle(
                      color: Colors.black, fontSize: 20),
                ),
                Row(
                  children: [
                    ProductDetailColorDot(
                        color: Color(int.parse(products.color)),
                        isSelected: true),
                    const ProductDetailColorDot(
                      color: Colors.orange,
                    ),
                    const ProductDetailColorDot(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Spacer(),
          Expanded(
              child: RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Size\n",
                      style: TextStyle(color: Colors.black,fontSize: 20)
                  ),
                  TextSpan(text: "${products.size} CM",
                      style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold,color: Colors.black))
                ]),
              ))
        ],
      ),
    );
  }
}
