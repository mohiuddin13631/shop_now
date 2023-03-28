import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:shopping_app/controller/signup_controller.dart';
import 'package:shopping_app/controller/login_controller.dart';
import 'package:shopping_app/controller/signup_controller.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';
import 'package:shopping_app/view/login/components/login_background.dart';
import 'package:shopping_app/view/login/components/password_field.dart';
import 'package:shopping_app/view/login/components/textfield_decorator.dart';
import 'package:shopping_app/view/signup/signup.dart';
import 'package:shopping_app/view/welcome_page/components/custom_button.dart';

import 'components/userid_text_field.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController useridcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  SignUpController signUpController = Get.put(SignUpController());
  LoginController loginController = Get.find();

  String userIdErrorText = "Mobile number can not be empty";
  String userIdHintText = "Enter Mobile Number";
  Color userIdHintTextColor = Colors.purple;
  IconData userIdTextFieldPrefixIcon = Icons.phone;
  Color userIdTextFieldPrefixIconColor = Colors.purple;

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: LoginBackground(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/Login.png"),
          const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldDecorator(
                  child: UserIdTextField(
                    useridcontroller: useridcontroller,
                    userIdErrorText: userIdErrorText,
                    userIdHintText: userIdHintText,
                    userIdHintTextColor: userIdHintTextColor,
                    userIdTextFieldPrefixIcon: userIdTextFieldPrefixIcon,
                    userIdTextFieldPrefixIconColor:
                        userIdTextFieldPrefixIconColor,
                    onUserIdValueChange: (value) {},
                  ),
                ),
                TextFieldDecorator(
                    child: UserPassTextField(
                  userPasscontroller: passcontroller,
                  userPassErrorText: "Password can not be empty",
                  userPassHintText: "Enter Password",
                  userPassHintTextColor: Colors.purple,
                  userPassTextFieldPrefixIcon: Icons.lock,
                  userPassTextFieldPrefixIconColor: Colors.purple,
                  suffixIcon: Icons.visibility_off,
                  suffixIconColor: Colors.purple,
                  onUserPassValueChange: (value) {},
                )),
                Obx(()=>loginController.isDataSubmitting.value == false ? CustomButton(
                    buttonColor: MyTheme.loginButtonColor,
                    buttontext: "LOGIN",
                    textColor: Colors.white,
                    handleButtonClick: () {
                      userLogin();
                    }):CircularProgressIndicator(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have account ?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.purple),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    )));
  }

  void userLogin() {
    final _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      loginController.loginWithDetail(
          useridcontroller.text, passcontroller.text);
    } else {
      return null;
    }
  }
}
