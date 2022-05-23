import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/theme/profile_theme.dart';

class ProfileTextFormField extends StatelessWidget {
  const ProfileTextFormField(
      {Key? key,
      required this.label,
      required this.onSaved,
      required this.validator,
      required this.initialValue})
      : super(key: key);

  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(label, style: profileTextStyle),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 60,
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.orangeAccent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
