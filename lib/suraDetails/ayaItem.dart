import 'package:flutter/material.dart';

class AyaItem extends StatelessWidget {
  String aya;
  int pos;
  AyaItem(this.aya,this.pos);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Center(child: Text(aya+' '+'($pos)',textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,style: TextStyle(
        color: Theme.of(context).accentColor,fontSize: 24,fontWeight: FontWeight.w600,

      ),)),
    );
  }
}
