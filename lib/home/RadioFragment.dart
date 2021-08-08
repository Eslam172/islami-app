import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami_pract/main.dart';
import 'package:islami_pract/model/radio_response.dart';
import 'package:islami_pract/widgets/RadioItem.dart';

class RadioFragment extends StatefulWidget{

  @override
  _RadioFragmentState createState() => _RadioFragmentState();
}

class _RadioFragmentState extends State<RadioFragment> {
  Future<RadioResponse> radioResponse;
  AudioPlayer audioPlayer ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    radioResponse=fetchRadios();
    audioPlayer=AudioPlayer();
  }

  play(String url) async {
    int result = await audioPlayer.play(url);

  }
  stop()async{
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioResponse>(
        future: radioResponse,

        builder: (buildContext,snapShot){
          if(snapShot.hasData){
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/images/radio.png',
                    width: MediaQuery.of(context).size.width*.9,
                    height: MediaQuery.of(context).size.height*.3,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    physics: PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapShot.data.radios.length,
                      itemBuilder: (buildContext,index){

                    return RadioItem(snapShot.data.radios[index],play,stop);

                  }),
                )
              ],
            );
          }else if(snapShot.hasError){
            return Center(
              child: IconButton(
                icon: Icon(Icons.refresh,color: MyThemeData.primaryColor,),
                onPressed: (){
                  radioResponse=fetchRadios();
                },
              ),
            );
          }else {
            return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
          }
        });
  }

  Future<RadioResponse> fetchRadios() async {
    final response = await http
        .get(Uri.parse('http://api.mp3quran.net//radios//radio_arabic.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return RadioResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }
}
