import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_pract/Providers/ThemeProvider.dart';
import 'package:islami_pract/suraDetails/ayaItem.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static final String ROUTE_NAME = 'sura_deatails';

  @override
  _SuraDetailsScreenState createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    var args = ModalRoute.of(context).settings.arguments as SuraDetailsArgs;
    readSuraContent('assets/content/${args.filePos}.txt');
    return SafeArea(
      top: true,
      child:
      themeProvider.isDarkModeEnabled()?
      Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/dark_bg.png')
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
            color: Theme.of(context).accentColor
            ),
            title: Text(
              args.suraName,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          body: Container(
            child: Center(
              child:ayatList.length==0?
              CircularProgressIndicator(color: Theme.of(context).accentColor,)
                  :Container(
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromRGBO(20, 26, 46, 0.7),

                ),
                    child: ListView.builder(itemBuilder: (context,index){
                      return AyaItem(ayatList[index], index+1);
              },
              itemCount: ayatList.length,),
                  )
              ,
            ),
          ),
        ),
      )
          :
      Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/quran_bg.png')
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
                color: Theme.of(context).accentColor
            ),
            title: Text(
              args.suraName,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          body: Container(
            child: Center(
              child:ayatList.length==0?
              CircularProgressIndicator(color: Theme.of(context).accentColor,)
                  :Container(
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromRGBO(254, 254, 254, 0.7),

                ),
                child: ListView.builder(itemBuilder: (context,index){
                  return AyaItem(ayatList[index], index+1);
                },
                  itemCount: ayatList.length,),
              )
              ,
            ),
          ),
        ),
      )
    );
  }
  List<String> ayatList =[];
  void readSuraContent(String fileName)async{
    String fileContent = await rootBundle.loadString(fileName);
    List<String> lines = fileContent.split('\n');
    setState((){
      ayatList=lines;
    });
  }
}


class SuraDetailsArgs {
  int filePos;
  String suraName;
  SuraDetailsArgs({this.filePos, this.suraName});
}
