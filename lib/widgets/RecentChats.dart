import 'dart:ui';

import 'package:chat_screen/main.dart';
import 'package:chat_screen/model/Massages.dart';
import 'package:chat_screen/model/User.dart';
import 'package:chat_screen/screens/ChatScreen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
   User user;
  RecentChats({this.user});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                topRight: Radius.circular(30))
        ) ,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
          topRight: Radius.circular(30)),
          child: Container(
            
            child: ListView.builder(itemBuilder: (context,index){
              final Massages chat = chats[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(user: chat.sender, )
                    )
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5,bottom: 5,right: 20),
                  decoration: BoxDecoration(
                      color:chat.unRead ?Color(0xffffefee) : Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                    bottomRight:  Radius.circular(20)
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            CircleAvatar(radius: 35,backgroundImage: AssetImage(chat.sender.imageUrl),),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(chat.sender.name,style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),),
                                SizedBox(height: 6,),
                                Container(
                                  width: MediaQuery.of(context).size.width*.45,
                                  child: Text(chat.text,style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(chat.time,style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),),
                          SizedBox(height: 5,),
                          chat.unRead?Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                  color: MyThemeData.primaryColor
                              ),
                              child: Text('NEW',style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white

                              ),))
                              :Text('')
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
              itemCount: chats.length,
            ),
          ),
        ),
      ),
    );
  }
}
