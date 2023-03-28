import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopping_app/controller/cart_controller/category_controller.dart';
import 'package:shopping_app/view/cart/product_detail/bags_collection.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';

import '../cart_page.dart';
class Categories extends StatelessWidget {
  CategoryController categoryController = Get.put(CategoryController());
  Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryController.categoryList.length,
        itemBuilder: (context, index) {
          return buildCategory(index,context);
        },
      ),
    );
  }

  Widget buildCategory(int index,BuildContext context) {
    return InkWell(
          onTap: () {
            categoryController.changeIndex(index);
            changePage(index);
          },
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Obx(
                  () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( // category text
                    categoryController.categoryList[index],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                        categoryController.currentIndex.value ==
                            index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.primaryVariant
                    ),
                  ),
                  Container( //category text underline
                    margin: EdgeInsets.only(
                        top: MyTheme.defaultPadding * 0.4),
                    height: 2,
                    width: 30,
                    color: categoryController.currentIndex.value ==
                        index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                  )
                ],
              ),
            ),
          ),
        );
  }

  void changePage(int index) {
    List categoryPage = [CartPage(),const BagsCollection()];
    // Get.to(categoryController.categoryPage[index]);
    Get.to(categoryPage[index]);
  }
}
