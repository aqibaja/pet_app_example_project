import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pet_app_final_dicoding/configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topProfile(size),
            listMenu(size),
            bottomSetting(size),
          ],
        ),
      ),
    );
  }

  //menu list
  Container listMenu(Size size) {
    return Container(
      margin: EdgeInsets.only(left: size.width / 25, bottom: size.width / 9),
      child: Column(
          children: drawerItem
              .map((element) => Container(
                    margin: EdgeInsets.only(
                      bottom: size.height / 25,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          element['icon'],
                          color: element['color'],
                          size: size.height / 19,
                        ),
                        SizedBox(
                          width: size.width / 25,
                        ),
                        Text(
                          element['title'],
                          style: TextStyle(
                            color: element['color'],
                            fontWeight: FontWeight.bold,
                            fontSize: size.width / 19,
                          ),
                        )
                      ],
                    ),
                  ))
              .toList()),
    );
  }

  // row setting in bottom page
  Container bottomSetting(Size size) {
    return Container(
      margin: EdgeInsets.only(left: size.width / 25, bottom: size.width / 19),
      child: Row(
        children: [
          Icon(
            Icons.settings,
            color: Colors.white54,
            size: size.height / 25,
          ),
          SizedBox(
            width: size.height / 99,
          ),
          Text(
            "Settings",
            style: TextStyle(
                fontSize: size.width / 25,
                color: Colors.white54,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: size.height / 99,
          ),
          Container(
            color: Colors.white54,
            height: size.height / 55,
            width: size.width / 155,
          ),
          SizedBox(
            width: size.height / 99,
          ),
          Text(
            "Log out",
            style: TextStyle(
                fontSize: size.width / 25,
                color: Colors.white54,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

//profile in top page
  Container topProfile(Size size) {
    return Container(
      margin: EdgeInsets.only(left: size.width / 25, top: size.height / 13),
      child: Row(
        children: [
          CircleAvatar(
            radius: size.width / 13.5,
            backgroundColor: Color(0xffFDCF09),
            child: CircleAvatar(
              radius: size.width / 15,
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
          ),
          SizedBox(
            width: size.width / 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "M. Husnul Aqib",
                style: TextStyle(
                    fontSize: size.width / 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Active status",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white54),
              ),
            ],
          )
        ],
      ),
    );
  }
}
