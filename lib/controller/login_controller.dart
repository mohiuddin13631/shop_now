import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/custom_web_services.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/model/login_singelton.dart';
import 'package:shopping_app/model/user_data_model.dart';
import 'package:shopping_app/model/user_model_list.dart';
import 'package:shopping_app/view/dashboard/user_dashboard.dart';
import 'package:shopping_app/view/home/home_page.dart';
import 'package:shopping_app/view/welcome_page/welcome_page.dart';

class LoginController extends GetxController{

  var isDataSubmitting = false.obs;
  var isDataReadingCompleted = false.obs;

  loginWithDetail(String id,String pass) async {
    isDataSubmitting.value = true; //when click login button

    Map<String, dynamic> dataBody = {
        CustomWebServices.USER_MOBILE : id,
        CustomWebServices.USER_PASS : pass
    };

    var dataToSend = json.encode(dataBody);
    var response = await http.post(Uri.parse(CustomWebServices.login_api_url),body:dataToSend);

    if(response.statusCode == 200){

     // SharedPreferences is what Android and iOS apps use to store simple data in an allocated space.
      // This data exists even when the app is shut down and starts up again; we can still retrieve the value as it was.
      //It has a method, getInstance , which is used to create an instance of a SharedPreferences .

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool("isLoggedin", true);//SharedPreferences stores the data in a key-value pair.
      preferences.setString("userid", id); //this value set for dashboard controller

      isDataSubmitting.value = false; //when response send form api

      Get.off(() => HomePage());

      Map<String, dynamic> responseData = jsonDecode(response.body);
      if(responseData['rMsg'] == "success"){
        isDataReadingCompleted.value = true;
      }
      else{
        Get.snackbar(
          "Login Failed",
          "Invalid User Id / Password",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
    }else{
      isDataSubmitting.value = false;
      Get.snackbar(
        "Login Failed",
        "Server problem",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
  }

  Future<void> logout() async {
    UserDataList.email = "";
    UserDataList.name = "";
    UserDataList.mobile = "";
    UserDataList.profilePic = "";
    UserDataList.gender = "";

    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLoggedin", false);
    Get.to(welcomePage());
  }
}