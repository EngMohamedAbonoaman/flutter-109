import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo109/screens/home_page.dart';

void main(){
  runApp(ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
