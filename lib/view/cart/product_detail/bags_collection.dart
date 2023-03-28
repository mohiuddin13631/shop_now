import 'package:flutter/material.dart';
import 'package:shopping_app/view/cart/components/cart_page_background.dart';
import 'package:shopping_app/view/home/home_page.dart';
class BagsCollection extends StatelessWidget {
  const BagsCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartPageBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Implementation in Progress",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                // HomePage(),
              ],
            ),
          ),
        )
      ),
    );
  }
}
