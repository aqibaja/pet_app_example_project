import 'package:flutter/material.dart';
import 'package:pet_app_final_dicoding/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "pet app",
      home: HomePage(),
    );
  }
}
