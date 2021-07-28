import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_pract/widgets/HadethTitleWidget.dart';

class HadethFragment extends StatefulWidget {
  @override
  _HadethFragmentState createState() => _HadethFragmentState();
}

class _HadethFragmentState extends State<HadethFragment> {
  @override
  void initState() {
    // TODO: implement initState
    loadHadethFile();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
         Expanded(flex: 1, child: Image.asset('assets/images/hadeth_logo.png')),
         Expanded(flex: 4, child: hadethList.length==0?
             Center(child: CircularProgressIndicator(color: Theme.of(context).accentColor,))
             :ListView.separated(itemBuilder: (context,index){
               return HadethTitleWidget(hadethList[index]);
         },itemCount: hadethList.length,separatorBuilder: (context,index){
               return Container(
                 height: 1, color: Theme.of(context).primaryColor,
                 margin: EdgeInsets.symmetric(horizontal: 25),
               );
         },)
         ),

      ],
    );
  }

  List<Hadeth> hadethList =[];

  void loadHadethFile()async{
    List<Hadeth> list=[];
    String fileContent = await rootBundle.loadString('assets/content/ahadeth.txt');
    List<String> allHadethContent = fileContent.split('#\r\n');
    print(allHadethContent.length);
    for(int i=0;i<allHadethContent.length;i++){
      String hadethContent = allHadethContent[i];
      List<String> hadethLines = hadethContent.split('\n');
      String title = hadethLines[0];
      String content ='';
      for(int j=0;j<hadethLines.length;j++){
        content =content+' '+ hadethLines[j];
      }
      Hadeth hadeth = Hadeth(title: title,content: content);
      list.add(hadeth);
    }
    setState(() {
      hadethList=list;
    });
  }
}
class Hadeth{
  String title;
  String content;
  Hadeth({this.title,this.content});
}
