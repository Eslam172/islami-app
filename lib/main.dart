import 'package:flutter/material.dart';
import 'package:islami_pract/home/HomeScreen.dart';
import 'package:islami_pract/suraDetails/SuraDetailsScreen.dart';

void main() {
  runApp(MyApp());
}
class MyThemeData{
  static var  primaryColor = Color.fromRGBO(183, 147, 95, 1.0);
  static var accentColor =  Color.fromRGBO(36, 36, 36, 1.0);
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor:MyThemeData.primaryColor,
        accentColor: MyThemeData.accentColor
      ),
      routes: {
        HomeScreen.ROUTE_NAME:(context)=>HomeScreen(),
        SuraDetailsScreen.ROUTE_NAME:(context)=>SuraDetailsScreen()
      },
      initialRoute: HomeScreen.ROUTE_NAME,
    );
  }
}
