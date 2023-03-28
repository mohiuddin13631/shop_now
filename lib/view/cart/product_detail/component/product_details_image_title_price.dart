import 'package:flutter/material.dart';
import 'package:shopping_app/model/cart_model/product_model.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';

class ProductDetailsImageTitlePrice extends StatelessWidget {
  const ProductDetailsImageTitlePrice({
    Key? key,
    required this.products,
  }) : super(key: key);

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyTheme.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            products.name,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MyTheme.defaultPadding * 0.5),
          Row(
            children: [
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: "Price\n",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  TextSpan(
                      text: products.price.toString(),
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold))
                ],
              )),
              SizedBox(
                width: MyTheme.defaultPadding * 2,
              ),
              Expanded(
                  child: Hero(
                      tag: products.id,
                      child: Image.asset(
                        products.image,
                        fit: BoxFit.fill,
                      )))
            ],
          )
        ],
      ),
    );
  }
}
