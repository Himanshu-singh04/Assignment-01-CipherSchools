import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../widgets/widgets.dart';
import 'login_page.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  auth_service authservice = auth_service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text('sign out'),
        onPressed: () {
          authservice.sign_out();
          next_screen(context, login_page());
        },
      )),
    );
  }
}
