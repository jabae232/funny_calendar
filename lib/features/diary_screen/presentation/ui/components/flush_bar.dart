import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

showFlushBar({
  required BuildContext context,
  required String message,
}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    title: "Ошибка",
    messageText: Text(
      message,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 3),
  ).show(context);
}
