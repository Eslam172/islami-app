import 'package:flutter/material.dart';
import 'package:islami_pract/Providers/ThemeProvider.dart';
import 'package:islami_pract/home/HadethFragment.dart';
import 'package:islami_pract/home/QuranFragment.dart';
import 'package:islami_pract/home/RadioFragment.dart';
import 'package:islami_pract/home/SebhaFragment.dart';
import 'package:islami_pract/main.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final ROUTE_NAME = 'home';

  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      top: true,

      child:
          themeProvider.isDarkModeEnabled()?
      Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/dark_bg.png')

            )),

        child: Scaffold(
          drawer: DrawerHeader(
            child: InkWell(
                onTap: (){
                  if(themeProvider.isDarkModeEnabled())
                    themeProvider.toggleTheme();
                  Navigator.pop(context);
                },
                child: Icon(Icons.change_circle,size: 40,color: Theme.of(context).accentColor,)),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
                child: Text(
              'اسلامي',
              style: TextStyle(
                  color: MyThemeData.colorWhite,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
            elevation: 0,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              onTap: onBootomNavigationBarItemClick,
              currentIndex: selectedIndex,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedIconTheme: IconThemeData(
                color: Theme.of(context).accentColor,
                size: 30,
              ),
              selectedItemColor: Theme.of(context).accentColor,
              unselectedIconTheme: IconThemeData(
                color: MyThemeData.colorWhite
              ),

              items: [
                BottomNavigationBarItem(icon: ImageIcon(
                  AssetImage('assets/images/radio_ic.png'),

                ),
                  label: 'الراديو'
                ),
                BottomNavigationBarItem(icon: ImageIcon(
                  AssetImage('assets/images/sebha_ic.png')
                ),
                  label: 'التسبيح'
                ),
                BottomNavigationBarItem(icon: ImageIcon(
                  AssetImage('assets/images/hadeth_ic.png')
                ),label: 'الحديث'),
                BottomNavigationBarItem(icon: ImageIcon(
                  AssetImage('assets/images/quran_ic.png')
                ),label: 'القران الكريم')
              ],
            ),
          ),
          body: getMainView(),
        ),
      )
              : Container(

            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/quran_bg.png')

                )),

            child: Scaffold(
              drawer: DrawerHeader(

                child: InkWell(
                    onTap: (){
                      if(!themeProvider.isDarkModeEnabled())
                        themeProvider.toggleTheme();
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.change_circle,color: Theme.of(context).accentColor,size: 40,)),
              ),
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Theme.of(context).accentColor
                ),
                backgroundColor: Colors.transparent,
                title: Center(
                    child: Text(
                      'اسلامي',
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                elevation: 0,
              ),
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
                child: BottomNavigationBar(
                  onTap: onBootomNavigationBarItemClick,
                  currentIndex: selectedIndex,
                  showUnselectedLabels: true,
                  showSelectedLabels: true,
                  selectedIconTheme: IconThemeData(
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  selectedItemColor: Theme.of(context).accentColor,
                  items: [
                    BottomNavigationBarItem(icon: ImageIcon(
                      AssetImage('assets/images/radio_ic.png'),

                    ),
                        label: 'الراديو'
                    ),
                    BottomNavigationBarItem(icon: ImageIcon(
                        AssetImage('assets/images/sebha_ic.png')
                    ),
                        label: 'التسبيح'
                    ),
                    BottomNavigationBarItem(icon: ImageIcon(
                        AssetImage('assets/images/hadeth_ic.png')
                    ),label: 'الحديث'),
                    BottomNavigationBarItem(icon: ImageIcon(
                        AssetImage('assets/images/quran_ic.png')
                    ),label: 'القران الكريم')
                  ],
                ),
              ),
              body: getMainView(),
            ),
          )
    );
  }
  Widget getMainView(){
    if(selectedIndex == 0){
      return RadioFragment();
    }else if(selectedIndex==1){
      return SebhaFragment();
    }else if(selectedIndex==2){
      return HadethFragment();
    }else if(selectedIndex==3){
      return QuranFragment();
    }
  }
  void onBootomNavigationBarItemClick(int pos){
    setState(() {
      selectedIndex=pos;
    });
  }
}
