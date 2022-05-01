import 'package:flutter/material.dart';

class UserWithDate extends StatelessWidget {
  const UserWithDate({Key? key, required this.user, required this.date})
      : super(key: key);

  final String user;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          user,
        ),
        SizedBox(
          height: 10,
          child: VerticalDivider(
            thickness: 2,
            color: Colors.black,
          ),
        ),
        Text(date),
      ],
    );
  }
}
