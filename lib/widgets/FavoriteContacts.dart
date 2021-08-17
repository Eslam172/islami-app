import 'package:chat_screen/model/Massages.dart';
import 'package:chat_screen/model/User.dart';
import 'package:chat_screen/screens/ChatScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Favorite Contacts',style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,size: 30,color: Colors.blueGrey,))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),

            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => ChatScreen(user: favorites[index], )
                      )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(favorites[index].imageUrl)),
                      SizedBox(height: 8,),
                      Text(favorites[index].name,style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),),

                    ],
                  ),
                ),
              );
            },
              itemCount: favorites.length,
            ),
          )
        ],
      ),
    );
  }
}
