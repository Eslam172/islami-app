import 'package:chat_screen/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyThemeData{
  static const  primaryColor=Colors.red;
  static const  accentColor=Color(0xfffef9eb);
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyThemeData.primaryColor,
        accentColor: MyThemeData.accentColor
      ),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen()
        },
        initialRoute: HomeScreen.routeName
    );
  }
}
