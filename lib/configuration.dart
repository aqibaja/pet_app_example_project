import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryColor = Color(0xff416d6d);

List<BoxShadow> listShadow = [
  BoxShadow(color: Colors.grey[200], blurRadius: 30, offset: Offset(0, 5))
];

List<Map> drawerItem = [
  {'icon': FontAwesomeIcons.paw, 'title': 'Adoption', 'color': Colors.white},
  {
    'icon': FontAwesomeIcons.houseUser,
    'title': 'Donation',
    'color': Colors.white54
  },
  {'icon': Icons.add, 'title': 'Add Pet', 'color': Colors.white54},
  {'icon': Icons.favorite, 'title': 'Favorites', 'color': Colors.white54},
  {'icon': Icons.mail, 'title': 'Messages', 'color': Colors.white54},
  {
    'icon': FontAwesomeIcons.userAlt,
    'title': 'Profile',
    'color': Colors.white54
  },
];

List<Map> categories = [
  {'name': 'Cat', 'iconPath': 'images/cat.png'},
  {'name': 'Dog', 'iconPath': 'images/dog.png'},
  {'name': 'Horse', 'iconPath': 'images/horse.png'},
  {'name': 'Parrot', 'iconPath': 'images/parrot.png'},
  {'name': 'Rabbit', 'iconPath': 'images/rabbit.png'},
];
