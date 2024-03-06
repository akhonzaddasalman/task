import 'package:flutter/material.dart';

Widget customText(
  String text, {
  TextAlign? align,
  TextStyle? style,
}) {
  return Text(
    text,
    textAlign: align,
    style: style,
  );
}
