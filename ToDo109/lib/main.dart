import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo109/Network/DB.dart';
import 'package:todo109/screens/home_page.dart';
import 'package:todo109/screens/responsive.dart';
import 'package:todo109/state/add_task_state/add_task_cubit.dart';
import 'package:todo109/state/blocObservable.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (_)=>AddTaskCubit()..initializeDB()),
      ], child: ToDo())
  );
}


class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveScreen(),
    );
  }
}
