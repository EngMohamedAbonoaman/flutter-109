import 'package:chatting/build_custom_msg.dart';

import 'package:chatting/constant.dart';
import 'package:chatting/fire/firestor.dart';
import 'package:chatting/widgets/buildtextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> msgs = [];

  @override
  void initState() {
    FirebaseFireStoreService.getDocsData(tableName: "msg").then((value) {
      msgs = value;
    }).catchError((onError) {
      print(onError.toString());
    });
    super.initState();
  }

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('msg').orderBy('date').snapshots();
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "Mohamed Noaman",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Online",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          actions: [
            const CircleAvatar(
              child: Icon(Icons.phone_bluetooth_speaker),
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Icon(
              Icons.group,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(
              width: width * 0.03,
            ),
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return LayoutBuilder(
              builder: (context, constraints) => Column(

                children: [
                  SizedBox(
                    height: constraints.maxHeight * .8,
                    child: Container(
                      color: Colors.orangeAccent.withOpacity(.1),
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) => BuildCustomMSG(
                            msg: snapshot.data!.docs[index].data()
                                as Map<String, dynamic>),
                      ),
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight *.2,
                    color: Colors.white,
                    child: BuildTextField(
                      hint: "Enter your msg",
                      validate: () {},
                      suffixIcon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      padding: 10,
                      controller: controller,
                      onPressed: () {
                        FirebaseFireStoreService.addData(
                            tableName: "msg",
                            data: {
                              'text': controller.text,
                              'senderId': "nF67RQlpykNGoKZG48YSLxEYuDT2",
                              'date': DateTime.now()
                            }).then((value) {
                          setState(() {
                            controller.clear();
                            scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: Duration(seconds:1 ),
                              curve: Curves.fastOutSlowIn,
                            );
                          });
                        });
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
