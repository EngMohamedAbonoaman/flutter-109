// import 'package:flutter/material.dart';
// import 'package:todoapp2/screens/add_task_screen.dart';
// import 'package:todoapp2/screens/chat_screen.dart';
// import 'package:todoapp2/screens/home_screen.dart';
//
// class Routes {
//   static const HomeRoute = "/";
//   static const AddTaskRoute = "/addTask";
//   static const chat = "/chat";
// }
//
// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case Routes.HomeRoute:
//         return MaterialPageRoute(builder: (_) => HomeScreen());
//       case Routes.chat:
//         return MaterialPageRoute(builder: (_) => ChatScreen());
//       case Routes.AddTaskRoute:
//         return MaterialPageRoute(builder: (_) => AddTaskScreen());
//       default:
//         return MaterialPageRoute(
//           builder: (_) => const Scaffold(
//             body: Center(
//               child: Text("No routes"),
//             ),
//           ),
//         );
//     }
//   }
// }
