import 'package:flutter/material.dart';
import 'package:store_app_project/screens/add_product_screen.dart';


import 'screens/Home_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
