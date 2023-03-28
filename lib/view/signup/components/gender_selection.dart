import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shopping_app/controller/gender_selection_controller.dart';

class GenderSelection extends StatelessWidget {
  GenderSelectionController genderSelectionController = Get.find();

  GenderSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Gender",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        Obx(()=>Radio(
          value: "Male",
          groupValue: genderSelectionController.selectedGender.value,
          onChanged: (value) {
            genderSelectionController.onChangeGender(value);
          },
          activeColor: Colors.purple,
          fillColor: MaterialStateProperty.all(Colors.purple),
        )),
        const Text(
          "Male",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        Obx(()=>Radio(
          value: "Famale",
          groupValue: genderSelectionController.selectedGender.value,
          onChanged: (value) {
            genderSelectionController.onChangeGender(value);
          },
          activeColor: Colors.purple,
          fillColor: MaterialStateProperty.all(Colors.purple),
        )),
        const Text(
          "Female",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
      ],
    );
  }
}
