import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/custom_web_services.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/view/login/login_page.dart';

class SignUpController extends GetxController {
  var isProfilePathSet = false.obs;
  var profilePath = "".obs;

  var profileImageBase64;

  String userName = "";
  String userEmail = "";
  String userMobile = "";
  String userPass = "";
  String userGender = "";

  var isSendingData = false.obs;
  // var successMsgLoginPage = false.obs;

  void setProfileImagePath(String path) {
    profilePath.value = path;
    isProfilePathSet.value = true;

    final bytes =
        File(profilePath.value).readAsBytesSync(); //image byte ee read korse
    profileImageBase64 = base64.encode(bytes);
  }

  void signUpUser(String name, String email, String mobile, String pass,
      String rePass, String gender) {
    if (isProfilePathSet.value == false) {
      Get.snackbar(
        "Sign up Failed",
        "Please capture/Select profile picture",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else if (pass != rePass) {
      Get.snackbar(
        "Sign up Failed",
        "Password does not match",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else if (!isEmailValid(email)) {
      Get.snackbar(
        "Sign up Failed",
        "Email id is not valid",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else {
      userName = name;
      userEmail = email;
      userMobile = mobile;
      userPass = pass;
      userGender = gender;
      sendUserDataToServer();
    }
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  void sendUserDataToServer() async {
    isSendingData.value = true;

    Map<String, dynamic> dataBody = {
      CustomWebServices.PROFILE_IMAGE: profileImageBase64,
      CustomWebServices.USER_NAME: userName,
      CustomWebServices.USER_EMAIL: userEmail,
      CustomWebServices.USER_MOBILE: userMobile,
      CustomWebServices.USER_PASS: userPass,
      CustomWebServices.USER_GENDER: userGender
    };
    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.signup_api_url),
        body: dataToSend);

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      isSendingData.value = false;
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if(responseData['r_msg'] == 'success'){
        Get.snackbar(
          "Signup successful",
          "You registered successfully",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
        Get.to(LoginPage());
      }
      else if(responseData['r_msg'] == 'failed'){
        Get.snackbar(
          "Sign up Failed",
          "Surver problem occured",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
      else if(responseData['r_msg'] == 'mobile number already exist'){
        Get.snackbar(
          "Sign up Failed",
          "You have already registered",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
    }
    else{
      isSendingData.value = false;
      Get.snackbar(
        "Sign up Failed",
        "API problem",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
  }
}
