import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_app/controller/bottom_navigation_controller.dart';
import 'package:shopping_app/view/cart/cart_page.dart';
import 'package:shopping_app/view/cart/cart_page_with_tab_bar.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';
import 'package:shopping_app/view/dashboard/user_dashboard.dart';
import 'package:shopping_app/view/logout/logout_page.dart';

class HomePage extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  HomePage({Key? key}) : super(key: key);

  final screens = [UserDashboard(), CartPageWithTabBar(), LogoutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationController.currentIndex.value,
          //indext ee je number ta thakbe list er sei position er screen ta show korbe. by default its 0 index
          children: screens, //this is list of screen
        ),
      ),

      // bottomNavigationBar: Obx( ()=>
      //   BottomNavigationBar(
      //     type: BottomNavigationBarType.shifting,
      //     // type: BottomNavigationBarType.fixed,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.white70,
      //     showSelectedLabels: true,
      //     // selectedIconTheme: IconThemeData(color: Colors.green),
      //     onTap: (index) {
      //       //todo: by default index number is 0
      //       bottomNavigationController.changeIndex(index); //change index number.. ei number onusare screen show korbe and bottom navigation oo change hobe
      //     },
      //
      //     currentIndex: bottomNavigationController.currentIndex.value,//bottom navigation will change according to this value
      //
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home
      //         ),
      //         label: "Home",
      //         backgroundColor: Colors.deepPurple,
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //             Icons.shop
      //         ),
      //         label: "Cart",
      //         backgroundColor: Colors.green,
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //             Icons.logout
      //         ),
      //         label: "Logout",
      //         backgroundColor: Colors.purple,
      //       ),
      //     ],
      //   ),
      // ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.black, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1)),
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10),
          child: GNav(
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.shop,
                text: "Cart",
              ),
              GButton(
                icon: Icons.logout,
                text: "Logout",
              ),
            ],
            activeColor: Colors.black,
            tabBackgroundColor: Colors.blue,
            tabActiveBorder: Border.all(color: Colors.purple,width: 2),
            color: Colors.orange,
            haptic: true,
            gap: 10,
            iconSize: 18,
            tabShadow: [
              BoxShadow(color: Colors.blue.withOpacity(0.2))
            ],
            duration: Duration(microseconds: 200),
            curve: Curves.decelerate,
            rippleColor: Colors.blue,
            tabBorder: Border.all(color: Colors.orange),
            hoverColor: Colors.purple,
            onTabChange: (value){
              bottomNavigationController.changeIndex(value);
            },
          ),
        ),
      ),
    );
  }
}
