import 'package:flutter/material.dart';

class Notify {
  static void show(BuildContext context , String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      )
    );
  }
}