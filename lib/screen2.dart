import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pet_app_final_dicoding/configuration.dart';

class Screen2 extends StatefulWidget {
  final Color colorBackground;
  final String image;
  final String name;
  final gender;
  final String age;
  Screen2(
      {@required this.colorBackground,
      @required this.image,
      this.name,
      this.gender,
      this.age});
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          background(size),
          customBarIcon(size, context),
          pet(size),
          centerContainer(size),
          bottomBar(size)
        ],
      ),
    );
  }

  Align bottomBar(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height / 9,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  favorite = !favorite;
                });
              },
              child: Container(
                height: size.height / 15,
                width: size.width / 7,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: (favorite == false)
                    ? Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: size.width / 11,
              ),
              height: size.height / 15,
              width: size.width / 2.5,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "Adoption",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width / 21,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align centerContainer(Size size) {
    return Align(
      child: Container(
        margin: EdgeInsets.only(left: size.width / 17, right: size.width / 17),
        height: size.height / 5.5,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: listShadow),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height / 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width / 21),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          fontSize: size.width / 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                        right: size.width / 25,
                        //bottom: size.height / 35,
                      ),
                      child: Icon(
                        widget.gender,
                        size: size.width / 11,
                        color: Colors.black45,
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height / 155),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width / 21),
                    child: Text(
                      "Abyssinian cat",
                      style: TextStyle(
                        fontSize: size.width / 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      right: size.width / 25,
                      //bottom: size.height / 35,
                    ),
                    child: Text(
                      widget.age,
                      style: TextStyle(
                        fontSize: size.width / 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height / 155, left: size.width / 21),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: size.width / 25,
                  ),
                  Text(
                    // ignore: unnecessary_brace_in_string_interps
                    "Jln.panglima No.1, Desa.Ulee kareng",
                    style: TextStyle(
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align pet(Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height / 2.7,
        margin: EdgeInsets.only(top: size.height / 29),
        child: Hero(tag: widget.image, child: Image.asset(widget.image)),
      ),
    );
  }

  Container customBarIcon(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height / 25),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Column background(Size size) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: widget.colorBackground,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: size.width / 25),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 8.5,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: size.width / 16.5,
                          backgroundImage: AssetImage('images/law.jpg')),
                      Padding(
                        padding: EdgeInsets.only(left: size.width / 33),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Trafalgar Law",
                                  style: TextStyle(
                                      fontSize: size.width / 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: size.width / 11,
                                ),
                                Text("01 January 2020",
                                    style: TextStyle(
                                        fontSize: size.width / 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45))
                              ],
                            ),
                            Text("Owner",
                                style: TextStyle(
                                    fontSize: size.width / 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45))
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height / 69, right: size.width / 45),
                    child: Text(
                        "Pekerjaan saya sebagai bajak laut sehingga saya tidak memiliki cukup waktu untuk menjaga dan merawat kucing ini. Saya mencari orang yang baik dan penyayang untuk mengadopsi kucing kesayangan saya ini.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: size.width / 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
