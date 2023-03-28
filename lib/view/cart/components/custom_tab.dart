import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomTab extends StatelessWidget {

  const CustomTab({
    Key? key, required this.tabName, required this.imgPath,
  }) : super(key: key);

  final String tabName;
  // final IconData tabIcon;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Expanded(
        child: Container(
          width: 50,
          margin: EdgeInsets.only(top: 10),
          // height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white54
          ),
          child: Column(
            children: [
              Tab(
                // icon: Icon(tabIcon,color: Colors.black,),
                child: SvgPicture.asset(imgPath,width: 30,),
              ),
              Text(tabName,style: TextStyle(color: Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
}
