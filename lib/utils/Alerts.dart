import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Alerts {
  static errorFlushbar(BuildContext context, String title, String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      title: title,
      message: message,
      backgroundColor: Colors.red,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static loading(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Container(
                  alignment: FractionalOffset.center,
                  height: 80.0,
                  padding: const EdgeInsets.all(20.0),
                  child: const CircularProgressIndicator()),
            ));
  }
}
