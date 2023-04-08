import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../auth/auth_service.dart';
import '../widgets/widgets.dart';
import 'login_page.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

bool iconbool = false;
IconData icon_light = Icons.wb_sunny;
IconData icon_dark = Icons.nights_stay;

ThemeData lighttheme = ThemeData.light();
ThemeData darktheme = ThemeData.dark();

class _home_pageState extends State<home_page> {
  auth_service authservice = auth_service();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: iconbool ? lighttheme : darktheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 40, 42, 57),
          leading: Image.asset(
            'assets/logo.png',
            fit: BoxFit.fill,
          ),
          leadingWidth: 150,
          title: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.compass,
                    color: Colors.white,
                  ),
                  label: Text('Browse', style: TextStyle(color: Colors.white))),
              IconButton(
                  onPressed: () {
                    setState(() {
                      iconbool = !iconbool;
                    });
                  },
                  icon: Icon(iconbool ? icon_dark : icon_light))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: Color.fromARGB(255, 255, 255, 255),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  label: 'Home',
                  backgroundColor: Color.fromARGB(255, 40, 42, 57)),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.book,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  label: 'Courses',
                  backgroundColor: Color.fromARGB(255, 40, 42, 57)),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.compass,
                    color: Colors.white,
                  ),
                  label: 'Trending',
                  backgroundColor: Color.fromARGB(255, 40, 42, 57)),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  label: 'Profile',
                  backgroundColor: Color.fromARGB(255, 40, 42, 57))
            ]),
        // // body: Center(
        //     child: ElevatedButton(
        //   child: Text('sign out'),
        //   onPressed: () {
        //     authservice.sign_out();
        //     next_screen(context, login_page());
        //   },
        // )),
      ),
    );
  }
}
