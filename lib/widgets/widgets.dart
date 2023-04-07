import 'package:flutter/material.dart';

const text_input_decoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 2)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2)));

void next_screen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void next_screen_replace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void snack_bar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(fontSize: 15),
    ),
    backgroundColor: color,
    action: SnackBarAction(label: "ok", onPressed: () {}),
  ));
}
