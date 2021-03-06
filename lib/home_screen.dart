import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_app_final_dicoding/configuration.dart';
import 'package:pet_app_final_dicoding/screen2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xoffset = 0;
  double yoffset = 0;
  double scalefactor = 1;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(scalefactor),
      duration: Duration(milliseconds: 250),
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 35.0 : 0.0),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            background(size),
            Column(
              children: [
                customAppBar(size),
                SizedBox(
                  height: size.height / 25,
                ),
                searchBox(),
                menuBinatang(size),
                listBinatang(size, "images/pet-cat2.png", Colors.blueGrey[300],
                    "Gill", FontAwesomeIcons.mars, "2 years old", "5.5 km"),
                listBinatang(size, "images/pet-cat1.png", Colors.orange[300],
                    "Mia", FontAwesomeIcons.venus, "1.5 years old", "15 km"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container background(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.height / 7),
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(35)),
    );
  }

  Widget listBinatang(
    Size size,
    String image,
    Color color,
    String namePet,
    var gender,
    String age,
    String distance,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Screen2(
                    colorBackground: color,
                    image: image,
                    name: namePet,
                    age: age,
                    gender: gender,
                  ))),
      child: Container(
        padding: EdgeInsets.only(right: size.width / 25, left: size.width / 25),
        height: size.height / 3.5,
        child: Row(
          children: [
            Expanded(
                child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height / 21),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: color,
                      boxShadow: listShadow = [
                        BoxShadow(
                            color: Colors.grey[400],
                            blurRadius: 30,
                            offset: Offset(0, 5))
                      ]),
                ),
                Align(
                  child: Hero(tag: image, child: Image.asset(image)),
                )
              ],
            )),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: size.height / 15, bottom: size.height / 35),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(21),
                        bottomRight: Radius.circular(21)),
                    color: Colors.white,
                    boxShadow: listShadow = [
                      BoxShadow(
                          color: Colors.grey[400],
                          blurRadius: 30,
                          offset: Offset(0, 5))
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: size.height / 55, top: size.height / 159),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width / 35,
                            ),
                            child: Text(
                              namePet,
                              style: TextStyle(
                                  fontSize: size.width / 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                right: size.width / 35,
                                //bottom: size.height / 35,
                              ),
                              child: Icon(
                                gender,
                                size: size.width / 15,
                                color: Colors.black45,
                              )
                              /*Text(
                              gender,
                              style: TextStyle(
                                  fontSize: size.width / 25,
                                  fontWeight: FontWeight.bold),
                            ),*/
                              )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width / 39),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Abyssinian cat",
                            style: TextStyle(
                                fontSize: size.width / 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 99,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width / 39),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            age,
                            style: TextStyle(
                                fontSize: size.width / 29,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 99,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width / 55),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: size.width / 25,
                              ),
                              Text(
                                "Distance: $distance",
                                style: TextStyle(
                                    fontSize: size.width / 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // menu dibawah seach box
  Widget menuBinatang(Size size) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        height: size.height / 9,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: size.width / 19),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: index == 0 ? primaryColor : Colors.white,
                        boxShadow: listShadow = [
                          BoxShadow(
                              color: Colors.blueGrey[400],
                              blurRadius: 10,
                              offset: Offset(0, 5))
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Image(
                        image: AssetImage(categories[index]['iconPath']),
                        height: size.height / 13,
                        width: size.width / 6.1,
                        color: index == 0 ? Colors.white : null),
                  ),
                  Text(categories[index]['name'])
                ],
              ),
            );
          },
        ));
  }

  //widget search di bawah app bar
  Widget searchBox() {
    return Container(
      padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(30)),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            hintText: "Search Pet"),
      ),
    );
  }

  //app bar
  Container customAppBar(Size size) {
    return Container(
      padding: EdgeInsets.only(top: size.height / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (isDrawerOpen)
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    setState(() {
                      xoffset = 0;
                      yoffset = 0;
                      scalefactor = 1;
                      isDrawerOpen = !isDrawerOpen;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.menu,
                  ),
                  onPressed: () {
                    setState(() {
                      xoffset = size.width / 2;
                      yoffset = size.height / 5;
                      scalefactor = 0.6;
                      isDrawerOpen = !isDrawerOpen;
                    });
                  },
                ),
          Column(
            children: [
              Text("Location"),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: primaryColor,
                  ),
                  Text(
                    "Aceh, ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Indonesia")
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: size.width / 55),
            child: CircleAvatar(
              radius: size.width / 19,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: size.width / 21,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
