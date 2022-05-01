import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.label,
      required this.onSaved,
      required this.validator})
      : super(key: key);

  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 60,
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
          ),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
