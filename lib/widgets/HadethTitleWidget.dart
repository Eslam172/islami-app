import 'package:flutter/material.dart';
import 'package:islami_pract/HadethDetails/HadethDetailsScreen.dart';
import 'package:islami_pract/Providers/ThemeProvider.dart';
import 'package:islami_pract/home/HadethFragment.dart';
import 'package:islami_pract/main.dart';
import 'package:provider/provider.dart';

class HadethTitleWidget extends StatelessWidget {
  Hadeth hadeth;
  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.ROUTE_NAME,arguments: hadeth);
      },
      child:
          themeProvider.isDarkModeEnabled()?
      Center(
        child: Text(
          hadeth.title,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: MyThemeData.colorWhite),
        ),
      )
              :
          Center(
            child: Text(
              hadeth.title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
          )
    );
  }
}
