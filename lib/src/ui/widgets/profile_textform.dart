import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/theme/profile_theme.dart';

class ProfileTextFormField extends StatelessWidget {
  ProfileTextFormField(
      {Key? key,
      required this.label,
      required this.onSaved,
      required this.validator,
      required this.initialValue,
      required this.onChanged,
      this.button})
      : super(key: key);

  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final String initialValue;
  final onChanged;
  Widget? button;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: profileTextStyle),
            button ?? Container()
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 60,
          child: TextFormField(
            onSaved: onSaved,
            onChanged: onChanged,
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
