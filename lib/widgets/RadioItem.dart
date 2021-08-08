import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_pract/model/radio_response.dart';

class RadioItem extends StatefulWidget {
  Radios item;
  Function play ,stop;
  RadioItem(this.item,this.play,this.stop);

  @override
  _RadioItemState createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text('${widget.item.name}',style: TextStyle(
            color: Theme.of(context).accentColor,fontSize: 25,
            fontWeight: FontWeight.w500,
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){widget.play(widget.item.radioUrl);}, child: Icon(Icons.play_arrow,color: Theme.of(context).accentColor,)),
              TextButton(onPressed: (){widget.stop();}, child: Icon(Icons.pause,color: Theme.of(context).accentColor,))

            ],
          )
        ],
      ),
    );
  }
}
