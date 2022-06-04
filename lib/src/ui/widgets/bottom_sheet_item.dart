import 'package:flutter/material.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem(
      {Key? key,
      required this.icon,
      required this.text,
      required this.callback})
      : super(key: key);

  final Icon icon;
  final String text;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: callback,
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
