import 'package:flutter/material.dart';
import 'package:pet_app_final_dicoding/drawer_screen.dart';
import 'package:pet_app_final_dicoding/home_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
