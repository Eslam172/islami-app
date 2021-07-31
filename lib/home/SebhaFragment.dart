import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class SebhaFragment extends StatefulWidget {

  @override
  _SebhaFragmentState createState() => _SebhaFragmentState();
}

class _SebhaFragmentState extends State<SebhaFragment> {
  int counter =0;
  int angle =0;
  List<String> tasbehList =['سبحان الله','الحمدلله','لا اله الا الله','الله اكبر'];
  int tasbehIndex =0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Center(
                      child: Image.asset(
                    'assets/images/headofsebha.png',
                    height: 80,
                  ))),
              InkWell(
                onTap: (){
                  onSebhaPressed();
                },

                    child: Container(
                        margin: EdgeInsets.only(top: 52),

                      child: Transform.rotate(
                        angle: Math.pi/180*angle,
                        child: Image.asset(
                            'assets/images/bodyofsebha.png',
                            height: 180,
                          ),
                      ),
                            ),

                
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'عدد التسبيحات',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).accentColor),
            )),
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
              color: Color.fromRGBO(201, 179, 150, 1.0),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            '$counter',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            '${tasbehList[tasbehIndex]}',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
        )
      ],
    );
  }
  void onSebhaPressed(){
    this.setState(() {
      counter++;
      angle+=40;
      if(counter%33==0){
        tasbehIndex+=1;
      }
      if(tasbehIndex==4){
        tasbehIndex=0;
      }
    });
  }
}
