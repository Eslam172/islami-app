import 'package:flutter/material.dart';
import 'package:islami_pract/Providers/ThemeProvider.dart';
import 'package:islami_pract/main.dart';
import 'package:islami_pract/suraDetails/SuraDetailsScreen.dart';
import 'package:provider/provider.dart';

class SuraNameWidget extends StatelessWidget {
  String suraName;
  int position;
  SuraNameWidget(this.suraName,this.position);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return InkWell(
      onTap:(){
        onItemClick(context);
      },
      child:
          themeProvider.isDarkModeEnabled()?
      Center(
          child: Text(
        suraName,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: MyThemeData.colorWhite),
      ))
              :
          Center(
              child: Text(
                suraName,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              )),
    );
  }
  void onItemClick(BuildContext context){
    Navigator.of(context).pushNamed(SuraDetailsScreen.ROUTE_NAME,
      arguments: SuraDetailsArgs(filePos: position,suraName: suraName)
    );
  }
}
