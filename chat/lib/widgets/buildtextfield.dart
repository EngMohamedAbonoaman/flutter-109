import 'package:flutter/material.dart';

import '../shared/fixed_size.dart';

class BuildTextField extends StatelessWidget {
  BuildTextField({
    super.key,
    required this.hint,
    required this.validate,
    required this.padding,
    required this.controller,
    required this.onPressed,
    this.prefixIcon = const Text(""),
    this.suffixIcon = const Text(""),
  });
  String hint;
  Function validate;
  double padding;
  TextEditingController controller;
  Function onPressed;
  Widget prefixIcon;
  Widget suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.padding4),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          validate;
        },
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding:
              EdgeInsets.symmetric(vertical: padding, horizontal: 10),
          hintText: hint,
          suffixIcon: IconButton(
              onPressed: () {
                onPressed();
              },
              icon: suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
