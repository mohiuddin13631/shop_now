class LoginSingleton{

  static String userName = "";
  static String userMobile = "";
  static String userGender = "";
  static String userEmail = "";
  static String userProfile = "";

  static bool isUserNameSet = false;
  static bool isUserMobileSet = false;
  static bool isUserGenderSet = false;
  static bool isUserEmailSet = false;
  static bool isUserProfilePicSet = false;

  //basic structure of singelton
  LoginSingleton._internal();

  static final LoginSingleton _singleton = LoginSingleton._internal();//_internal() means private object

  factory LoginSingleton(){ //factory -- public static in java
    return _singleton;
  }
  //---- basic structure of sigelton end--------

  //setter methode
  static void setUserName(String name){
    userName = name;
    isUserNameSet = true;
  }
  static void setUserEmail(String email){
    userEmail = email;
    isUserEmailSet = true;
  }
  static void setUserMobile(String mobile){
    userMobile = mobile;
    isUserMobileSet = true;
  }
  static void setUserGender(String gender){
    userGender = gender;
    isUserGenderSet = true;
  }
  static void setUserProfilePic(String profilePic){
    userProfile = profilePic;
    isUserProfilePicSet = true;
  }

  //getter methode
  static String getUserName(){
    return userName;
  }
  static String getUserEmail(){
    return userEmail;
  }
  static String getUserMobile(){
    return userMobile;
  }
  static String getUserGender(){
    return userGender;
  }
  static String getUserProfilePic(){
    return userProfile;
  }
}