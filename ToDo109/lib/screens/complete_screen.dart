import 'package:flutter/material.dart';

import '../Shared/app_colors.dart';
import '../Shared/app_styles.dart';

class CompleteTasksScreen extends StatelessWidget {
  const CompleteTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 1,
      itemBuilder: (context,index)=> Center(child:
        Text("Complete Screen"),)
    );
  }
}
//