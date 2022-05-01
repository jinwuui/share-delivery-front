import 'package:flutter/material.dart';

class ExpectedOrderTime extends StatelessWidget {
  const ExpectedOrderTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        color: Colors.white70,
      ),
      child: Center(
        child: Text(
          "4월 25일 오후 9시",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
