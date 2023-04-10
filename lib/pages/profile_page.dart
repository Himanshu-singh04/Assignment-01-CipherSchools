import 'package:cipher_schools/auth/auth_service.dart';
import 'package:cipher_schools/auth/auth_service.dart';
import 'package:cipher_schools/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'course_page.dart';
import 'home_page.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
  // // body: Center(
  //     child: ElevatedButton(
  //   child: Text('sign out'),
  //   onPressed: () {
  //     authservice.sign_out();
  //     next_screen(context, login_page());
  //   },
  // )),
}

class _profile_pageState extends State<profile_page> {
  int current_index = 0;
  auth_service authservice = auth_service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile_Page'),
      ),
      body: Column(children: [
        Image.asset("assets/profile.png"),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              authservice.sign_out();
              next_screen_replace(context, login_page());
            },
            child: Text("SignOut"))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 40, 42, 57),
        currentIndex: current_index,
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
    );
  }
}
