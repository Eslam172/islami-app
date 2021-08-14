import 'package:chat_screen/widgets/CategorySelector.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final routeName ='homeScreen';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            appBar: AppBar(
              title: Text('chats',style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),),

              centerTitle: true,
              leading: IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.menu),
                iconSize: 30,
              ),
              actions: [
                IconButton(onPressed: (){

                }, icon: Icon(Icons.search),
                  iconSize: 30,
                )
              ],
              elevation: 0,
            ),
            body: Column(
              children: [
                CategorySelector()
              ],
            )
          ),
        )
      ],
    );
  }
  }

