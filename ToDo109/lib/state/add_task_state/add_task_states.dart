abstract class AllAddTaskState{}
class AddTaskInitialState extends AllAddTaskState{}
class AddTaskErrorState extends AllAddTaskState{
  String error;
  AddTaskErrorState({required this.error});
}
class AddTaskLoadingState extends AllAddTaskState{}
class AddTaskSuccessState extends AllAddTaskState{}
