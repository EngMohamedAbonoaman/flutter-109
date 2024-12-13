class TaskModel{
  int id;
  String title;
  String subTitle;
  bool complete;
  TaskModel({required this.id,
  required this.title,
  required this.subTitle,
  required this.complete});

  factory TaskModel.fromJson(Map<String, dynamic> data){
    return TaskModel(id: data['id'],
        title: data['title'],
        subTitle: data['description'],
        complete: data['status']==1?true:false
    );
  }


}