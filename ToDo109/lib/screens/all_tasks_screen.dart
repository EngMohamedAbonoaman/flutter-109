import 'package:flutter/material.dart';
import 'package:todo109/Network/DB.dart';
import 'package:todo109/widgets/build_task_item.dart';

import '../Shared/app_colors.dart';
import '../Shared/app_styles.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: DBRepo.myList.length,
      itemBuilder: (context,index)=> BuildTaskItem(taskTitle: DBRepo.myList[index]['title'],
          taskSubTitle: DBRepo.myList[index]['description']) ,
    );
  }
}
