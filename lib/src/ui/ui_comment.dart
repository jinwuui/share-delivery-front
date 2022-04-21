import 'package:flutter/material.dart';

Widget UIComment({required String content, double size = 15.0}) {
  return Text(
    content,
    style: TextStyle(
        fontWeight: FontWeight.w700, color: Colors.red, fontSize: size),
  );
}
