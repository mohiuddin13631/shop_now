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

class DashboardController extends GetxController{

  var isDataSubmitting = false.obs;
  var isDataReadingCompleted = false.obs;

  loadUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.getString("userid");
    fetchData(userid: userid);
  }

  fetchData({userid}) async {
    isDataSubmitting.value = true; //when click login button

    Map<String, dynamic> dataBody = {
      CustomWebServices.USER_MOBILE : userid,
    };

    var dataToSend = json.encode(dataBody);
    var response = await http.post(Uri.parse(CustomWebServices.userprofiledata_url),body:dataToSend);

    if(response.statusCode == 200){
      isDataSubmitting.value = false; //when response send form api
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if(responseData['rMsg'] == "success"){

        //three ways to read data
        //todo: 1.Model
        // UserDataModel.fromMap(responseData).rUserProfileImg;
        // UserDataList.name = UserDataModel.fromMap(responseData).rUserName;
        // UserDataList.email = UserDataModel.fromMap(responseData).rUserEmail;
        // UserDataList.mobile = UserDataModel.fromMap(responseData).rUserMobile;
        // UserDataList.gender = UserDataModel.fromMap(responseData).rUserGender;

        //model alternate
        UserDataList.profilePic = responseData['rUserProfileImg'];
        UserDataList.name = responseData['rUserName'];
        UserDataList.email =  responseData['rUserEmail'];
        UserDataList.mobile = responseData['rUserMobile'];
        UserDataList.gender = responseData['rUserGender'];

        //todo: 2. Singleton class

        // LoginSingleton.setUserName(responseData['rUserName']);
        // LoginSingleton.setUserEmail(responseData['rUserEmail']);
        // LoginSingleton.setUserMobile(responseData['rUserMobile']);
        // LoginSingleton.setUserGender(responseData['rUserGender']);
        // LoginSingleton.setUserProfilePic(responseData['rUserProfileImg']);

        //todo: 3. shared Preferences
        // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        // Map<String,String> data = {
        //   "userProfile" : responseData['rUserProfileImg'],
        //   "userName" : responseData['rUserName'],
        //   "userEmail" : responseData['rUserEmail'],
        //   "userMobile" : responseData['rUserMobile'],
        //   "userGender" : responseData['rUserGender'],
        // };
        // sharedPreferences.setString("userdata", json.encode(data));

        isDataReadingCompleted.value = true;

        // Get.to(UserDashboard());
        Get.to(HomePage());
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
}