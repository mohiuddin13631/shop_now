import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/model/user_model_list.dart';

class UserDetailsCard extends StatelessWidget {
  final String name;
  final String email;
  final String mobile;
  final String gender;
  final String profilePic;

  const UserDetailsCard({
    Key? key,
    required this.name,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.profilePic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //take screen size
    return Column(
      children: [
        Container(
          height: size.height * 0.4,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: size.height * 0.4 - 27,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Stack(
                  children: [
                    Positioned(
                      top:130,
                      left: 10,
                      child: Text(
                        "Hi, $name",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      // left: 240,
                      right: 25,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: SvgPicture.asset(
                          "assets/svg/welcome.svg",
                          width: 70,
                          matchTextDirection: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 55,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 110, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 50,
                            color: Colors.purple.withOpacity(0.90),
                          ),
                        ]),
                    child: Text(
                      "User Profile",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        Container(
          height: size.height * 0.3,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 90,
                  color: Colors.purple.withOpacity(0.90),
                ),
              ]),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset("assets/svg/ellipse_top_pink.svg"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset("assets/svg/ellipse_bottom_pink.svg"),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  )),
              Positioned(
                  top: 100,
                  left: 10,
                  child: Text(
                    mobile,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Positioned(
                  top: 130,
                  left: 10,
                  child: Text(
                    email,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  )),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    gender,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Positioned(
                  top: 50,
                  right: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: Colors.purple,
                              spreadRadius: 20)
                        ]),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: MemoryImage(base64Decode(profilePic)),
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
