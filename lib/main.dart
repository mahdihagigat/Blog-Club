// ignore_for_file: deprecated_member_use

import 'package:bloc/article.dart';
import 'package:bloc/carousel/carousel_slider.dart';
import 'package:bloc/data.dart';
import 'package:bloc/gen/assets.gen.dart';
import 'package:bloc/gen/fonts.gen.dart';
import 'package:bloc/home.dart';
import 'package:bloc/profile.dart';
import 'package:bloc/splash.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const praymeryColor = Color(0xff376ADE);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          titleSpacing: 32,
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          elevation: 0,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryTextColor,
          
        ),
        textTheme: const TextTheme(
          // ignore: deprecated_member_use
          subtitle1: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
              fontWeight: FontWeight.w200,
              fontSize: 18),
              
          headline4: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              fontSize: 22),
          headline5: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
              fontSize: 20),
          // ignore: deprecated_member_use
          headline6: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.bold,
              color: primaryTextColor),
          // ignore: deprecated_member_use
          bodyText2: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
              fontSize: 12),
          subtitle2: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 14),
          caption: TextStyle(
              fontFamily: FontFamily.avenir,
              color: Color(0xff788882),
              fontWeight: FontWeight.w700,
              fontSize: 10),
        ),
      ),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(
      //       bottom: 8,
      //       right: 20,
      //       left: 20,
      //       child: _BottomNavigaition(),
      //     ),
      //   ],
      // ),
      home: const Mainscren(),
    );
  }
}

class Mainscren extends StatefulWidget{
  const Mainscren({super.key});

  @override
  State<Mainscren> createState() => _MainscrenState();
}
const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 65;

class _MainscrenState extends State<Mainscren> {
  int selectedScreenIndex = homeIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _BottomNavigaition(onTap: (int index){
        setState(() {
          selectedScreenIndex=index;
        });
      },),
      body: IndexedStack(
        index: selectedScreenIndex,
        children: const [
          HomeScreen(),
          ArticleScreen(),
          SerchScreen(),
          ProfileScreen(),
          
        ],
      ),
    );
  }
}


class _BottomNavigaition extends StatelessWidget {
  final Function(int index) onTap;

  const _BottomNavigaition(
      {Key? key, required this.onTap,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            right: 10,
            left: 10,
            child: Container(
              height: 65,
              decoration: const BoxDecoration(
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xaa988487),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                      iconFileName: 'Home.png',
                      activeiconFileName: 'Home.png',
                      onTap: () {
                        onTap(homeIndex);
                      },
                      title: 'Home'),
                  BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      activeiconFileName: 'Articles.png',
                      onTap: () {
                        onTap(articleIndex);
                      },
                      title: 'Articles'),
                  SizedBox(
                    width: 8,
                  ),
                  BottomNavigationItem(
                      iconFileName: 'Search.png',
                      activeiconFileName: 'Search.png',
                      onTap: () {
                        onTap(searchIndex);
                      },
                      title: 'Search'),
                  BottomNavigationItem(
                      iconFileName: 'Menu.png',
                      activeiconFileName: 'Menu.png',
                      onTap: () {
                       onTap(menuIndex);
                      },
                      title: 'Menu'),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 65,
              child: Image.asset('assets/img/icons/plus.png'),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: Color(0xff376ADE),
                  border: Border.all(color: Colors.white, width: 4)),
            ),
          ),
        ],
      ),
    );
  }
}

class SerchScreen extends StatelessWidget{
  const SerchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Serch'),);
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeiconFileName;
  final String title;
  final Function() onTap;

  const BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeiconFileName,
      required this.title,
      required this.onTap,
      });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/icons/${iconFileName}'),
          SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
