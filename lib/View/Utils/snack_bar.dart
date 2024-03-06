import 'package:flutter/material.dart';

// SnackBar which is accessible globally in the project
void openSnackBar(context, snackMessage, color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      action: SnackBarAction(
        label: "OK",
        textColor: Colors.white,
        onPressed: () {},
      ),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 190, left: 5, right: 5),
      content: Text(
        snackMessage,
        style: const TextStyle(fontSize: 14),
      )));
}
