import 'package:flutter/material.dart';
import 'package:islami_pract/home/HadethFragment.dart';

class HadethDetailsScreen extends StatelessWidget {
  static final String ROUTE_NAME = 'hadeth_details';
  @override
  Widget build(BuildContext context) {
    var hadethArgs = ModalRoute.of(context).settings.arguments as Hadeth;
    return SafeArea(
      top: true,
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage('assets/images/dark_bg.png'),
            fit: BoxFit.fill
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Theme.of(context).accentColor
            ),
            centerTitle: true,
            title: Text(
              hadethArgs.title,style: TextStyle(
              fontSize: 24,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor,

            ),
            ),
          ),
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50,left: 12,right: 12,bottom: 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(20, 26, 46, 0.7),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50,left: 12,right: 12,bottom: 10),
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Text(hadethArgs.content,textDirection: TextDirection.rtl,style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,

                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
