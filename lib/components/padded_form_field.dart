import 'package:flutter/material.dart';

class PaddedFormField extends StatelessWidget {
  double paddingValue;
  bool isPassword;
  String labelText;
  Function(String)? onChanged;
  Function(String?)? onSaved;

  PaddedFormField(
      {super.key,
      this.paddingValue = 8.0,
      this.isPassword = false,
      required this.labelText,
      required this.onChanged,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(paddingValue),
        child: TextFormField(
            obscureText: isPassword,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter a valid $labelText';
              }
              return null;
            },
            decoration: InputDecoration(labelText: labelText),
            onChanged: onChanged,
            onSaved: onSaved));
  }
}
