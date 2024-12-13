import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String title;
  final String hint;
  var controller;

  BuildTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontSize: 13),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10.0)),
        ),
      ],
    );
  }
}
