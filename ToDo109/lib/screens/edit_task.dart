import 'package:flutter/material.dart';
import 'package:todo109/Models/task_model.dart';
import 'package:todo109/Network/DB.dart';

import '../Shared/app_colors.dart';
import '../Shared/app_strings.dart';
import '../Shared/app_styles.dart';
import '../widgets/build_text_field.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key,required this.taskModel});
  TaskModel taskModel;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController desController = TextEditingController();
  @override
  void initState() {
    titleController.text = widget.taskModel.title;
    desController.text = widget.taskModel.subTitle;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 80,
        title: Text(AppStrings.EditTaskTitle,style: AppStyles.largeStyle.copyWith(color: Colors.white)
          ,),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildTextField(title: "Title", 
                hint: "Enter task title...", 
                size: 10.0,textEditingController: titleController,),
              SizedBox(height: 10,),
              BuildTextField(title: "Details", hint: "Enter task details...", size: 60.0,textEditingController: desController,),
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
                child: ElevatedButton(onPressed: (){
                      DBRepo.update(id: widget.taskModel.id,
                      title: titleController.text,
                      subTitle: desController.text,
                      status: 0).then((value){

                      }).catchError((onError){
                        print(onError.toString());
                      });
                }, child: Text("Update",style: AppStyles.largeStyle.copyWith(color: Colors.white),),
          
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
          
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
