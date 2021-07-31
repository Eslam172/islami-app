import 'package:flutter/material.dart';
import 'package:islami_pract/home/HadethFragment.dart';
import 'package:islami_pract/home/QuranFragment.dart';
import 'package:islami_pract/home/RadioFragment.dart';
import 'package:islami_pract/home/SebhaFragment.dart';

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
    return SafeArea(
      top: true,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/dark_bg.png'))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
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
      ),
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
