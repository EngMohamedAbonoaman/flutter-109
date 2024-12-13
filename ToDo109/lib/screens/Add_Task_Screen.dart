import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo109/Network/DB.dart';
import 'package:todo109/Shared/app_colors.dart';
import 'package:todo109/Shared/app_strings.dart';
import 'package:todo109/Shared/app_styles.dart';
import 'package:todo109/screens/home_page.dart';
import 'package:todo109/state/add_task_state/add_task_cubit.dart';
import 'package:todo109/state/add_task_state/add_task_states.dart';
import 'package:todo109/widgets/build_text_field.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit,AllAddTaskState>(
      builder: (context,state)=> Scaffold(
        resizeToAvoidBottomInset: false,
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
              BuildTextField(title: "Title", hint: "Enter task title...", size: 10.0,textEditingController: titleController,
              ),
              SizedBox(height: 10,),
              BuildTextField(title: "Details", hint: "Enter task details...", size: 60.0,textEditingController: desController,),
              SizedBox(height: 10,),
              Row(

                children: [
                  const Column(
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
              state is AddTaskLoadingState? Center(child: CircularProgressIndicator()): SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                 BlocProvider.of<AddTaskCubit>(context).insert(title: titleController.text, description: desController.text, status: 0).then((value){
                   Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Added Successfully")));
                  }).catchError((onError){
                    print("********************\n $onError");
                  });
                }, child: Text("ADD",style: AppStyles.largeStyle.copyWith(color: Colors.white),),

                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),

                ),)
            ],
          ),
        ),
      ),
      listener: (context,state){

      },
    );
  }
}
