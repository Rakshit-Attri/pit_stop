import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../utils/colors.dart';

class ToastManager {
  static void showToast(String message, BuildContext context) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Primary.brown,
        textColor: Primary.white,
        fontSize: 16);
  }

  static void errorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 6,
        backgroundColor: Primary.brown,
        textColor: Primary.white,
        fontSize: 16);
  }

  static void successToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Primary.brown,
        textColor: Primary.white,
        fontSize: 16);
  }

  static void warningToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.yellow[300],
        textColor: Primary.white,
        fontSize: 16);
  }
}
