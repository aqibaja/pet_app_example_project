import 'package:flutter/material.dart';
import 'package:pet_app_final_dicoding/configuration.dart';

// ignore: must_be_immutable
class Screen2 extends StatefulWidget {
  Color colorBackground;
  String image;
  Screen2({@required this.colorBackground, @required this.image});
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
          background(),
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
                  "Adopsi",
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
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: listShadow),
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

  Column background() {
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
          ),
        )
      ],
    );
  }
}
