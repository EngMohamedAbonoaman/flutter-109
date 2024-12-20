import 'package:flutter/material.dart';
import 'package:todo109/Models/task_model.dart';
import 'package:todo109/screens/edit_task.dart';

import '../Shared/app_colors.dart';
import '../Shared/app_styles.dart';

class BuildTaskItem extends StatelessWidget {
  BuildTaskItem({super.key,required this.taskModel});
  TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(taskModel.title,style: AppStyles.mediumStyle.copyWith(color: AppColors.primaryColor),),
                Text(taskModel.subTitle,style: AppStyles.smallStyle,)
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditTaskScreen(taskModel: taskModel,)));
            },icon: Icon(Icons.edit,color: AppColors.primaryColor,),),
            SizedBox(width: 10,),
            Icon(Icons.delete_outline,color: AppColors.primaryColor,),
            SizedBox(width: 10,),
            Icon(Icons.check_circle_outline_outlined,color: AppColors.primaryColor,),
          ],
        ),
      ),
    );
  }
}
