import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shopping_app/controller/dashboard_controller.dart';
import 'package:shopping_app/controller/login_controller.dart';
import 'package:shopping_app/model/login_singelton.dart';
import 'package:shopping_app/model/user_model_list.dart';
import 'package:shopping_app/view/dashboard/component/dashboard_background.dart';

import 'component/user_detail_card.dart';

class UserDashboard extends StatelessWidget {

  DashboardController dashboardController = Get.put(DashboardController());
  LoginController loginController = Get.find();

  UserDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dashboardController.loadUserData();
    return Scaffold(
      body: DashboardBackground(
        // child: Text("Home"),
        child: Obx(() => dashboardController.isDataReadingCompleted.value == true
            ? UserDetailsCard(
          //using model
          name: UserDataList.name,
          email: UserDataList.email,
          mobile: UserDataList.mobile,
          gender: UserDataList.gender,
          profilePic: UserDataList.profilePic,
        )
            : CircularProgressIndicator()),
        //todo: using singleton
        // child: UserDetailsCard(
        //   name: LoginSingleton.getUserName(),
        //   email: LoginSingleton.getUserEmail(),
        //   mobile: LoginSingleton.getUserMobile(),
        //   gender: LoginSingleton.getUserGender(),
        //   profilePic: LoginSingleton.getUserProfilePic(),
        //
        // ),
      ),
    );
  }
}
