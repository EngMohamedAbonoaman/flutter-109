import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo109/state/add_task_state/add_task_states.dart';
import 'package:path/path.dart';
import '../../Models/task_model.dart';

class AddTaskCubit extends Cubit<AllAddTaskState>{
  AddTaskCubit() : super(AddTaskInitialState());
  static late Database mydb;
   List<TaskModel> myList = [];
   Future<List<TaskModel>> initializeDB() async {
    String DBpath = await getDatabasesPath();
    String path = join(DBpath, "todo.db");
    print(path);
    await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
              create table tasks(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title text,
              description text,
              status int
             )''');
          print("Table Created");
        },
        onOpen: (Database db) async {
          mydb = db;
          List<Map<String,dynamic>> tempList = [];
          tempList = await getData("tasks");
          myList = [];
          for(Map<String,dynamic> item in tempList){
            myList.add(TaskModel.fromJson(item));
          }
        });

    return myList;
  }
  static Future<List<Map<String, Object?>>> getData(String tableName) async {
    List<Map<String, Object?>> myList = [];
    myList = await mydb.query(tableName);

    return myList;
  }
  Future<List<TaskModel>> insert({
    required String title,
    required String description,
    required int status,
  }) async {

    emit(AddTaskLoadingState());
    await Future.delayed(Duration(seconds: 2));
     mydb.insert('tasks', {
      'title': title,
      'description': description,
      'status': status,
    }
    ).then((value) {
      emit(AddTaskSuccessState());
     }).catchError((onError){
      emit(AddTaskErrorState(error: onError.toString()));
     });
    List<Map<String,dynamic>> tempList = [];
    tempList = await getData("tasks");
    myList = [];
    for(Map<String,dynamic> item in tempList){

      myList.add(TaskModel.fromJson(item));
    }
    return myList;
  }


}