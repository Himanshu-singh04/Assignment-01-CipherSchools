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
        ),
        endDrawer: Container(
          color: Colors.black,
          child: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Column(children: [
                    Image.asset("assets/white_logo.png"),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Cipher_School presents to you....",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: Text('Home'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                  ),
                  title: const Text('Courses'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.compass,
                  ),
                  title: const Text('Trending'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.person_add),
                  title: const Text('Following'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.person_3_fill,
                  ),
                  title: const Text('Discord'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.briefcase,
                  ),
                  title: const Text('Creators Access'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.feedback,
                  ),
                  title: const Text('Send Feedback'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.arrow_back),
                  title: Text("logout"),

                  onTap: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("logout"),
                            content: Text("are you sure you want to logout ??"),
                            actions: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    await authservice.sign_out();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => login_page()),
                                        (route) => false);
                                  },
                                  icon: Icon(
                                    Icons.done,
                                    color: Colors.green,
                                  ))
                            ],
                          );
                        });
                  },
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.arrow_back,
                  //   ),
                  //   title: const Text('LogOut'),
                  //   onTap: () {
                  //     authservice.sign_out();
                  //     next_screen(context, login_page());
                  //   },
                  // ),
                )
              ],
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Text("    Welcome to",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 38,
                          fontWeight: FontWeight.bold)),
                  Text(
                    " the",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 38),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "  Future",
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                  Text(
                    " of Learning !",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 38),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Start Learning by best creators for",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "absolutely Free !",
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Image.asset("assets/home.png"),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  onPressed: () {
                    next_screen_replace(context, course_page());
                  },
                  child: Text("Start Learning Now")),
              Container(
                padding: EdgeInsets.only(top: 50, bottom: 50),
                height: 300,
                child: ListWheelScrollViewX(
                    physics: FixedExtentScrollPhysics(),
                    itemExtent: 250,
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(child: Image.asset("assets/rb_1.png")),
                      InkWell(child: Image.asset("assets/rb_2.png")),
                      InkWell(child: Image.asset("assets/rb_3.png")),
                      InkWell(child: Image.asset("assets/rb_4.png")),
                    ]),
              ),
            ],
          ),
        ),

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
