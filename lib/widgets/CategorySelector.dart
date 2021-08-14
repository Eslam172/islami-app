import 'package:chat_screen/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedCategory=0 ;
  final List<String> categories =['Massages','Online','Groups','Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: MyThemeData.primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ( context,index){
        return InkWell(
          onTap: (){
            setState(() {
              selectedCategory=index;
            });
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            child: Text(categories[index],style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color:index==selectedCategory? Colors.white:Colors.white60
            ),),
          ),
        );
      },
      itemCount: categories.length,
      ),
    );
  }
}
