import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/controller/login_controller.dart';
import 'package:shopping_app/model/user_model_list.dart';
import 'package:shopping_app/view/cart/components/cart_page_background.dart';
import 'package:shopping_app/view/welcome_page/components/custom_button.dart';
import 'package:shopping_app/view/welcome_page/welcome_page.dart';

class LogoutPage extends StatelessWidget {
  LoginController loginController = Get.find();

   LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartPageBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Logout Page",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            CustomButton(
                buttonColor: Colors.purple,
                buttontext: "Logout",
                textColor: Colors.white,
                handleButtonClick: (){
                  loginController.logout();
                },
            )
          ],
        ),
      ),
    );
  }


}
