import 'package:chat_screen/main.dart';
import 'package:chat_screen/model/Massages.dart';
import 'package:chat_screen/model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static final String routeName ='chat screen';
  User user;
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyThemeData.primaryColor,
      appBar: AppBar(
        title: Text(widget.user.name),
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.more_horiz),
            iconSize: 30,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),
              topLeft: Radius.circular(30)
          )
        ),
         child:  Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)
                      )
                  ),
                   child: ClipRRect(
                       borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                           topLeft: Radius.circular(30)
                       ),
                     child: ListView.builder(
                       reverse: true,
                       padding: EdgeInsets.only(top: 15),
                       itemBuilder: (context,index){
                      final Massages massage = massages[index];
                      final bool isMe = massage.sender.id==currentUser.id;
                      return buildMassage(massage,isMe);
                  },
                      itemCount: massages.length,
                  ),
                   ),
                ),
              ),
              sendMassage(),
            ],
          ),
       
      ),
    );
  }
  buildMassage(Massages massage , bool isMe){
    return Container(
      margin: isMe? EdgeInsets.only(top: 8,bottom: 8,left: 80)
          :EdgeInsets.only(top: 8,bottom: 8,right: 80),
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        decoration: BoxDecoration(
          color: isMe? MyThemeData.accentColor :Color(0xffffefee) ,
          borderRadius:isMe? BorderRadius.only(topLeft: Radius.circular(15),
              bottomLeft:Radius.circular(15) ):BorderRadius.only(topRight: Radius.circular(15),
              bottomRight:Radius.circular(15) ),
        ),

        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(massage.time),
            SizedBox(height: 8,),
            Text (massage.text,),

          ],
        ));
  }
  sendMassage(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.photo,color: MyThemeData.primaryColor,size: 25,)),
          Expanded(child: TextField(decoration: InputDecoration(
            hintText: 'Send a maasgae ...'
          ),)),
          IconButton(onPressed: (){},
              icon: Icon(Icons.send,color: MyThemeData.primaryColor,size: 25,))
        ],
      ),
    );
  }
}
