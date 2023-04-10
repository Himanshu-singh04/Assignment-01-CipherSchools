import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../widgets/helper.dart';
import '../widgets/widgets.dart';
import 'home_page.dart';
import 'login_page.dart';

class register_page extends StatefulWidget {
  const register_page({super.key});

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  final form_key = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String full_name = "";
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
                      Text("Create new account to explore more!!!",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300)),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 20,
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
                        decoration: text_input_decoration.copyWith(
                            labelText: "Enter full name",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            )),
                        onChanged: (val) {
                          setState(() {
                            full_name = val;
                          });
                        },
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return "Name block cannot be empty";
                          }
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
                            "Register Now",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            register();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(
                          text: "You have an account!! Come ",
                          children: <TextSpan>[
                            TextSpan(
                                text: "Sign In",
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    next_screen(context, login_page());
                                  })
                          ]))
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  register() async {
    if (form_key.currentState!.validate()) {
      setState(() {
        is_loading = true;
      });
      await authservice
          .register_user_with_email_and_password(full_name, email, password)
          .then((value) async {
        if (value == true) {
          await Helper_functions.save_user_log_in_status(true);
          await Helper_functions.save_useremail(email);
          await Helper_functions.save_username(full_name);
          next_screen_replace(context, home_page());
        } else {
          setState(() {
            snack_bar(context, Colors.blue, value);
            is_loading = false;
          });
        }
      });
    }
  }
}
