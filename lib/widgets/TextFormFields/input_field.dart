// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../theme/design_system.dart';

class InputField extends StatelessWidget {
  final String label;
  final Icon prefixIcon;
  final String? initValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  const InputField({
    Key? key,
    required this.label,
    required this.prefixIcon,
    required this.initValue,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.xs),
      child: TextFormField(
        onSaved: onSaved,
        decoration: _textFireldDecoration(label, prefixIcon),
        minLines: 1,
        initialValue: initValue,
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "value can't be null";
          }
          return null;
        },
      ),
    );
  }

  InputDecoration _textFireldDecoration(String label, Icon prefixIcon) {
    return InputDecoration(
      hintText: label,
      label: Text(label),
      focusColor: Colors.black,
      hoverColor: Colors.black,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.black87,
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), topRight: Radius.circular(10)),
      ),
    );
  }
}
