import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class UserPassTextField extends StatefulWidget {
   UserPassTextField({
    Key? key,
    required this.userPasscontroller,
    required this.userPassErrorText,
    required this.userPassHintText,
    required this.userPassHintTextColor,
    required this.userPassTextFieldPrefixIcon,
    required this.userPassTextFieldPrefixIconColor,
    required this.onUserPassValueChange,
    required this.suffixIcon,
    required this.suffixIconColor,
  }) : super(key: key);

  final TextEditingController userPasscontroller;
  final String userPassErrorText;
  final String userPassHintText;
  final Color userPassHintTextColor;
  final IconData userPassTextFieldPrefixIcon;
  final Color userPassTextFieldPrefixIconColor;
  final Function onUserPassValueChange;
  final IconData suffixIcon;
  final Color suffixIconColor;


  @override
  State<UserPassTextField> createState() => _UserPassTextFieldState();
}

class _UserPassTextFieldState extends State<UserPassTextField> {
  bool isPassVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.userPasscontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return widget.userPassErrorText;
        } else {
          return null;
        }
      },
      onChanged: (value){
        widget.onUserPassValueChange(value);
      },
      cursorColor: Theme.of(context).colorScheme.secondary,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      obscureText: isPassVisible? false : true,
      decoration: InputDecoration(
        hintText: widget.userPassHintText,
        hintStyle: TextStyle(color: widget.userPassHintTextColor),
        border: InputBorder.none,
        prefixIcon: Icon(
          widget.userPassTextFieldPrefixIcon,
          color: widget.userPassTextFieldPrefixIconColor,
        ),
        suffixIcon: IconButton(
          icon: isPassVisible
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
          color: widget.suffixIconColor,
          onPressed: (){
            //todo: we will use getx here
            setState(() {
              isPassVisible = !isPassVisible; //true tahke false hobe r false thakle true hobe
            });
          },
        ),
      ),
    );
  }
}
