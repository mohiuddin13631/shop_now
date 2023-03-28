import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/view/cart/components/cart_page_background.dart';
import 'package:shopping_app/view/cart/pages/jacket_page.dart';
import 'package:shopping_app/view/cart/product_detail/bags_collection.dart';

import 'components/custom_tab.dart';
class CartPageWithTabBar extends StatelessWidget {
  const CartPageWithTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartPageBackground(
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder: (context,index){
              return [
                 SliverAppBar(
                  backgroundColor: Colors.purple,
                  expandedHeight: 100,
                  pinned: true,
                  centerTitle: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset("assets/images/product_bar_bg.jpg",fit: BoxFit.cover,),
                  ),
                  // leading: const Icon(Icons.arrow_back),
                  title: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Products",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),

                  bottom: const TabBar(
                    tabs: [
                      CustomTab(tabName: 'Jacket',imgPath: "assets/svg/jacket.svg",),
                      CustomTab(tabName: 'Bags',imgPath: "assets/svg/bag.svg",),
                      CustomTab(tabName: 'T-Shirt',imgPath: "assets/svg/t_shirt.svg",),
                      CustomTab(tabName: 'Gadget',imgPath: "assets/svg/gadget.svg",),
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [
                JacketPage(),
                BagsCollection(),
                BagsCollection(),
                BagsCollection(),
                // const BagsCollection(),
              ],
            ),
          ),
        )
      ),
    );
  }
}

