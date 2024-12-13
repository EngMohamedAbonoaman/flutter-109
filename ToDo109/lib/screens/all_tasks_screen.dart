import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo109/Network/DB.dart';
import 'package:todo109/state/add_task_state/add_task_cubit.dart';
import 'package:todo109/state/add_task_state/add_task_states.dart';
import 'package:todo109/widgets/build_task_item.dart';

import '../Shared/app_colors.dart';
import '../Shared/app_styles.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AllAddTaskState>(
      builder: (context,state)=>ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: BlocProvider.of<AddTaskCubit>(context).myList.length,
          itemBuilder: (context,index)=> BuildTaskItem(taskModel: BlocProvider.of<AddTaskCubit>(context).myList[index])),
      listener: (context,state){
        if(state is AddTaskLoadingState){
          print("Loading*********************");
        }else{
          print("Error************");
        }

      },
    );
  }
}
