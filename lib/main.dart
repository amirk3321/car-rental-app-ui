import 'package:car_rental_app_ui/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental App UI',
      theme: ThemeData(
        fontFamily: "Roboto"
      ),
      home:HomeScreen(),
    );
  }
}
