import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/controller/cart_controller/product_details/cart_controller.dart';
import 'package:shopping_app/controller/login_controller.dart';
import 'package:shopping_app/view/cart/cart_page.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';
import 'package:shopping_app/view/home/home_page.dart';
import 'package:shopping_app/view/welcome_page/welcome_page.dart';

import 'controller/cart_controller/product_details/fav_counter_controller.dart';
import 'controller/gender_selection_controller.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  LoginController loginController =  Get.put(LoginController());
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  var isLoggedIn = (preferences.getBool("isLoggedin") == null)? false //when first time run it will be null
      : preferences.getBool("isLoggedin");

  runApp(MyApp(isLoggedIn: isLoggedIn,));
}

class MyApp extends StatelessWidget {

  final isLoggedIn;

  GenderSelectionController genderSelectionController =
  Get.put(GenderSelectionController());

  CartController cartController = Get.put(CartController());

  FavCounterController favCounterController = Get.put(FavCounterController());

  MyApp({Key? key,required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      home: isLoggedIn? HomePage(): welcomePage(),
      // home: CartPage()
    );
  }
}