import 'package:flutter/material.dart';

class AddOrderFormButton extends StatelessWidget {
  const AddOrderFormButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.grey.shade400),
        child: Icon(
          Icons.add_a_photo,
          size: 40,
        ),
      ),
    );
  }
}
