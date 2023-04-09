import 'package:cipher_schools/pages/course_page.dart';
import 'package:cipher_schools/pages/register_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../auth/database_services.dart';
import '../widgets/helper.dart';
import '../widgets/widgets.dart';
import 'home_page.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final form_key = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool is_loading = false;
  auth_service authservice = auth_service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: is_loading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.blue,
            ))
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Form(
                  key: form_key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hey Friends",
                        style: TextStyle(
                            fontSize: 55, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Login to find out new friends",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300)),
                      Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.fill,
                      ),
                      TextFormField(
                        decoration: text_input_decoration.copyWith(
                            labelText: "Email Address",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            )),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                              ? null
                              : "please enter a valid email";
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: text_input_decoration.copyWith(
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            )),
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        validator: (val) {
                          if (val!.length < 6) {
                            return "password should have atleast 6 characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            login();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(
                          text: "Still Don't have an account ? ",
                          children: <TextSpan>[
                            TextSpan(
                                text: "Register Now",
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    next_screen(context, register_page());
                                  })
                          ]))
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  login() async {
    if (form_key.currentState!.validate()) {
      setState(() {
        is_loading = true;
      });
      await authservice
          .login_with_email_and_password(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot = await database_service(
                  uid: FirebaseAuth.instance.currentUser!.uid)
              .getting_user_data(email);
          await Helper_functions.save_user_log_in_status(true);
          await Helper_functions.save_useremail(email);
          await Helper_functions.save_username(snapshot.docs[0]['fullname']);
          next_screen_replace(context, course_page());
        } else {
          setState(() {
            snack_bar(context, Colors.blue, value);
            setState(() {
              is_loading = false;
            });
          });
        }
      });
    }
  }
}
