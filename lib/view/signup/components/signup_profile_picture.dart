import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/controller/signup_controller.dart';
import 'package:shopping_app/view/custom_widget/my_theme.dart';

class SignUpProfilePicture extends StatelessWidget {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  SignUpController signUpController = Get.find();

  SignUpProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(() => CircleAvatar(
              backgroundImage: signUpController.isProfilePathSet.value == true
                  ? FileImage(File(signUpController.profilePath.value))
                      as ImageProvider
                  : const AssetImage("assets/images/profilepic.png"),
              radius: 80,
            )),
        Positioned(
          bottom: 0,
          child: InkWell(
            child: Icon(Icons.camera,color: MyTheme.whiteColor,),
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (context) => bottomSheet(context));
            },
          ),
        )
      ],
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2, //screen er 20% height
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text(
            "Choose profile photo",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.image,
                      color: Colors.purple,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    )
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
              const SizedBox(
                width: 80,
              ),
              InkWell(
                child: Column(
                  children: const [
                    Icon(
                      Icons.camera,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
    Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    signUpController.setProfileImagePath(pickedFile!.path);
    Get.back();
  }
}
