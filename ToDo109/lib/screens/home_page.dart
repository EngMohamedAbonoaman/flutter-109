import 'package:flutter/material.dart';
import 'package:todo109/Shared/app_colors.dart';
import 'package:todo109/Shared/app_strings.dart';
import 'package:todo109/Shared/app_styles.dart';
import 'package:todo109/screens/Add_Task_Screen.dart';
import 'package:todo109/screens/all_tasks_screen.dart';
import 'package:todo109/screens/complete_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget> screens = [
    AllTasksScreen(),
    CompleteTasksScreen()
  ];


  Future<void> getData() async{
   await Future.delayed(Duration(seconds: 3),()=>print("Future Fun is finished"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        toolbarHeight: 80,
        title:  Text(AppStrings.homeTitle,style: AppStyles.largeStyle.copyWith(color: Colors.white),),
        backgroundColor: AppColors.primaryColor,
        actions: const [

          Icon(Icons.calendar_month,size: 30,color: Colors.white,),
          SizedBox(width: 10,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTaskScreen()));
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list),label: "All Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.check),label: "Complete Tasks"),

        ],
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (returnedIndex){
         setState(() {
           selectedIndex = returnedIndex;
         });
        },
      ),
    );
  }
}
