import 'package:get/get.dart';

class BottomNavigationController extends GetxController{
  var currentIndex = 0.obs;
  void changeIndex(var _index){
    currentIndex.value = _index;
  }
}