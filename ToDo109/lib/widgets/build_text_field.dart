import 'package:flutter/material.dart';

import '../Shared/app_styles.dart';

class BuildTextField extends StatelessWidget {
   BuildTextField({super.key,
     required this.title,
     required this.hint,
     required this.size});
  String title;
  String hint;
  double size;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppStyles.mediumStyle,),
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(
              hintText: hint,
              contentPadding:  EdgeInsets.all(size),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                // borderSide: BorderSide.none
              )
          ),
        ),
      ],
    );
  }
}
