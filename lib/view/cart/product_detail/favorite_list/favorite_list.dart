import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shopping_app/controller/cart_controller/product_details/fav_counter_controller.dart';
import 'package:shopping_app/view/cart/product_detail/favorite_list/component/favorite_list_background.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';

class FavoriteList extends StatelessWidget {
  FavoriteList({Key? key}) : super(key: key);

  FavCounterController favCounterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          title: Text("Favorite List",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset("assets/svg/back.svg",color: Theme.of(context).colorScheme.primary,))),
      body: FavoriteListBackground(
        child: ListView.builder(
            itemCount: favCounterController.favList.length,
            itemBuilder: (context, index) {
              var currentItem = favCounterController.favList[index];
              return Card(
                color: Color(int.parse(currentItem.color)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      currentItem.image,
                      height: 100,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: MyTheme.defaultPadding),
                      child: Column(
                        children: [
                          Text(currentItem.name,style: const TextStyle(color: Colors.black),),
                          Text(currentItem.price.toString(),style: const TextStyle(color: Colors.black),),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
