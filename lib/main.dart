import 'package:flutter/material.dart';
import 'package:islami_pract/HadethDetails/HadethDetailsScreen.dart';
import 'package:islami_pract/Providers/ThemeProvider.dart';
import 'package:islami_pract/home/HomeScreen.dart';
import 'package:islami_pract/suraDetails/SuraDetailsScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyThemeData{
  static var  primaryColor = Color.fromRGBO(183, 147, 95, 1.0);
  static var accentColor =  Color.fromRGBO(36, 36, 36, 1.0);
  static var darkPrimary = Color.fromRGBO(20, 26, 46, 1.0);
  static var darkAccent = Color.fromRGBO(250, 204, 29, 1.0);
  static var colorWhite = Color.fromRGBO(248, 248, 248, 1.0);
  static final lightTheme =ThemeData(
    primaryColor:MyThemeData.primaryColor,
    accentColor: MyThemeData.accentColor,
    brightness: Brightness.light,
  );
  static final darkTheme = ThemeData(
    primaryColor:MyThemeData.darkPrimary ,
    accentColor: MyThemeData.darkAccent,
    brightness: Brightness.dark,

  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
       create: (context)=>ThemeProvider(),
      builder: (context,widget){
         final themeProvider = Provider.of<ThemeProvider>(context);
         return MaterialApp(
           themeMode: themeProvider.themeMode,
           theme: MyThemeData.lightTheme,
           darkTheme:MyThemeData.darkTheme ,
           routes: {
             HomeScreen.ROUTE_NAME:(context)=>HomeScreen(),
             SuraDetailsScreen.ROUTE_NAME:(context)=>SuraDetailsScreen(),
             HadethDetailsScreen.ROUTE_NAME:(context)=>HadethDetailsScreen()
           },
           initialRoute: HomeScreen.ROUTE_NAME,
         );
      },
    );
  }
}
