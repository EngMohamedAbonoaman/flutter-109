import 'package:flutter/material.dart';
import 'package:todo109/Shared/app_colors.dart';
import 'package:todo109/Shared/app_strings.dart';
import 'package:todo109/Shared/app_styles.dart';
import 'package:todo109/widgets/build_text_field.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 80,
        title: Text(AppStrings.AddTaskTitle,style: AppStyles.largeStyle.copyWith(color: Colors.white)
          ,),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildTextField(title: "Title", hint: "Enter task title...", size: 10.0),
            SizedBox(height: 10,),
            BuildTextField(title: "Details", hint: "Enter task details...", size: 60.0),
            SizedBox(height: 10,),
            Row(

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("Status",style: AppStyles.mediumStyle,),
                    Text("(complete/incomplete)",style: AppStyles.smallStyle,),

                  ],
                ),
                Spacer(),
                Checkbox(value: false, onChanged: (value){})
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text("ADD",style: AppStyles.largeStyle,),

                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),

                  ),)
          ],
        ),
      ),
    );
  }
}
