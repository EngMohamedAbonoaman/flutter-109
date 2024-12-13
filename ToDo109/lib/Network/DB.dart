import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo109/Models/task_model.dart';

class DBRepo {
  static late Database mydb;
  static List<TaskModel> myList = [];
    static Future<List<TaskModel>> initializeDB() async {
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

//select * from tasks
  static Future<List<Map<String, Object?>>> getData(String tableName) async {
    List<Map<String, Object?>> myList = [];
    myList = await mydb.query(tableName);

    return myList;
  }

   static Future<List<TaskModel>> insert({
    required String title,
    required String description,
    required int status,
  }) async {

     await Future.delayed(Duration(seconds: 2));
    await mydb.insert('tasks', {
      'title': title,
      'description': description,
      'status': status,
    }
    );
     List<Map<String,dynamic>> tempList = [];
     tempList = await getData("tasks");
     myList = [];
     for(Map<String,dynamic> item in tempList){

       myList.add(TaskModel.fromJson(item));
     }
    return myList;
  }
//delete from tasks where id = 1
static Future<void> delete({required int id}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      await mydb.delete(
        //delete from tasks where id  = 1
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      );
      List<Map<String,dynamic>> tempList = [];
      tempList = await getData("tasks");
      for(Map<String,dynamic> item in tempList){
        myList.add(TaskModel.fromJson(item));
      }

      print("task deleted successfully");
    } catch (e) {}
  }

   static Future<void> update({
    required int id,
     required String title,
     required String subTitle,
     required int status
  }) async {
    await Future.delayed(Duration(seconds: 2));
    mydb.update(
      'tasks',
      {
        'title': title,
        'description': subTitle,
        'status': status,
      },
      where: 'id = ?',
      whereArgs: [id],
    ).then((value) {
      // List<Map<String,dynamic>> tempList = [];
      // tempList = await executeQuery("tasks");
      // for(Map<String,dynamic> item in tempList){
      //   myList.add(TaskModel.fromJson(item));
      // }
      print("Task updated successfully");
    });
  }
}
