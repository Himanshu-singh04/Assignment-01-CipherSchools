import 'package:cipher_schools/pages/home_page.dart';
import 'package:cipher_schools/pages/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

import '../auth/auth_service.dart';
import '../widgets/widgets.dart';
import 'course_page.dart';
import 'login_page.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

bool iconbool = false;
String val1 = 'Popular';
String val2 = 'Most_Viewed';
String val3 = 'A to Z';
IconData icon_light = Icons.wb_sunny;
IconData icon_dark = Icons.nights_stay;
List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Popular"), value: "Popular"),
    DropdownMenuItem(child: Text("Latest"), value: "Latest"),
  ];
  return menuItems;
}

String drop_value = "Popular";
ThemeData lighttheme = ThemeData.light();
ThemeData darktheme = ThemeData.dark();
int current_index = 0;
// final screens = [home_page(), course_page()];

class _home_pageState extends State<home_page> {
  auth_service authservice = auth_service();
  PageController pageController = PageController();
  // void ontapped(int index) {
  //   setState(() {
  //     current_index = index;
  //   });
  // }

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
          leadingWidth: 140,
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.compass,
                      color: Colors.white,
                      size: 15,
                    ),
                    label:
                        Text('Browse', style: TextStyle(color: Colors.white))),
                IconButton(
                    onPressed: () {
                      setState(() {
                        iconbool = !iconbool;
                      });
                    },
                    icon: Icon(
                      iconbool ? icon_dark : icon_light,
                      size: 20,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.bell_solid,
                      size: 20,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 20,
                    ))
              ],
            ),
          ),
        ),
        body: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [flutter(), python(), mock(), web()],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Text(
              "Recommended Courses",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 60,
            ),
            DropdownButton(
                items: dropdownItems, value: drop_value, onChanged: drop_down),
          ]),
          SingleChildScrollView()
        ]),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Color.fromARGB(255, 255, 255, 255),
          backgroundColor: Color.fromARGB(255, 40, 42, 57),
          currentIndex: current_index,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          // onTap: (index) => setState(() => current_index = index),
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(
                    CupertinoIcons.home,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () {
                    setState(() {
                      current_index = 0;
                      next_screen_replace(context, home_page());
                    });
                  },
                ),
                label: 'Home',
                backgroundColor: Color.fromARGB(255, 40, 42, 57)),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.book),
                  color: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {
                    setState(() {
                      current_index = 1;
                      next_screen_replace(context, course_page());
                    });
                  },
                ),
                label: 'Courses',
                backgroundColor: Color.fromARGB(255, 40, 42, 57)),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(
                    CupertinoIcons.compass,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                label: 'Trending',
                backgroundColor: Color.fromARGB(255, 40, 42, 57)),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      current_index = 3;
                      next_screen_replace(context, profile_page());
                    });
                  },
                ),
                label: 'Profile',
                backgroundColor: Color.fromARGB(255, 40, 42, 57))
          ],
        ),
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

  Widget flutter() => Container(
        child: InkWell(
          child: Image.asset(
            'assets/app_course.png',
            fit: BoxFit.fill,
          ),
          onTap: () {},
        ),
        width: 360,
        height: 300,
        color: Colors.red,
      );

  Widget python() => Container(
        child: InkWell(
          child: Image.asset(
            'assets/python_course.png',
            fit: BoxFit.fill,
          ),
          onTap: () {},
        ),
        width: 360,
        height: 300,
        color: Colors.red,
      );

  Widget mock() => Container(
        child: InkWell(
          child: Image.asset(
            'assets/mock.png',
            fit: BoxFit.fill,
          ),
          onTap: () {},
        ),
        width: 360,
        height: 300,
        color: Colors.red,
      );
  Widget web() => Container(
        child: InkWell(
          child: Image.asset(
            'assets/web_course.png',
            fit: BoxFit.fill,
          ),
          onTap: () {},
        ),
        width: 360,
        height: 300,
        color: Colors.red,
      );

  void drop_down(String? selected_value) {
    if (selected_value is String) {
      setState(() {
        drop_value = selected_value;
        next_screen_replace(context, home_page());
      });
    }
  }
}
