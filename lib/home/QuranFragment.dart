import 'package:flutter/material.dart';
import 'package:islami_pract/Providers/ThemeProvider.dart';
import 'package:islami_pract/main.dart';
import 'package:islami_pract/widgets/SuraNameWidget.dart';
import 'package:provider/provider.dart';

class QuranFragment extends StatelessWidget {
  List<String> names = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return
      Column(

      children: [
        Expanded(
            flex: 1,
            child: Center(child: Image.asset('assets/images/bg_quran.png'))),
        SizedBox(
          height: 8,
        ),
        Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                themeProvider.isDarkModeEnabled()?
                Container(

                  child:

                  Text(
                    'اسم السورة',
                    style: TextStyle(fontSize: 24,color: MyThemeData.colorWhite,fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,

                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: MyThemeData.darkAccent, width: 2),
                  ),
                )
                :
                Container(

                  child:

                  Text(
                    'اسم السورة',
                    style: TextStyle(fontSize: 24,color: Theme.of(context).accentColor,fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,

                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                ),
                Expanded(child: ListView.separated(itemBuilder: (context,index){
                  return SuraNameWidget(names[index],index+1);
                },
                  itemCount: names.length,
                  separatorBuilder: (context,index){
                 if(themeProvider.isDarkModeEnabled()) {
                   return Container(
                     height: 1, color: MyThemeData.darkAccent,
                     margin: EdgeInsets.symmetric(horizontal: 25),
                   );
                 }else {
                   return Container(
                     height: 1, color: Theme
                       .of(context)
                       .primaryColor,
                     margin: EdgeInsets.symmetric(horizontal: 25),
                   );
                 }
                  },
                ))
              ],
            )),

      ],
    );
  }
}
