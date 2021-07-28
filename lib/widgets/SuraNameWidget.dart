import 'package:flutter/material.dart';
import 'package:islami_pract/suraDetails/SuraDetailsScreen.dart';

class SuraNameWidget extends StatelessWidget {
  String suraName;
  int position;
  SuraNameWidget(this.suraName,this.position);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        onItemClick(context);
      },
      child: Center(
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
