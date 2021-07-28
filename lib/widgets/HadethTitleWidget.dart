import 'package:flutter/material.dart';
import 'package:islami_pract/HadethDetails/HadethDetailsScreen.dart';
import 'package:islami_pract/home/HadethFragment.dart';

class HadethTitleWidget extends StatelessWidget {
  Hadeth hadeth;
  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.ROUTE_NAME,arguments: hadeth);
      },
      child: Center(
        child: Text(
          hadeth.title,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
