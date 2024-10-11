import 'package:flutter/material.dart';
import 'package:messenger109/buildStatusWidget.dart';

class MessengerScreen extends StatelessWidget {
 MessengerScreen({super.key});
  List<Map<String,String>> users = [
    {
      'name':"Martin",
      'image':"assets/images/face.jpg"
    },
    {
      'name':"Karen",
      'image':"assets/images/face.jpg"
    },
    {
      'name':"Randolph",
      'image':"assets/images/face.jpg"
    },
    {
      'name':"Martin",
      'image':"assets/images/face.jpg"
    },
    {
      'name':"Karen",
      'image':"assets/images/face.jpg"
    },
    {
      'name':"Randolph",
      'image':"assets/images/face.jpg"
    },
    {
      'name':"Martin",
      'image':"assets/images/face.jpg"
    },
    {
      'name':"Karen",
      'image':"assets/images/face.jpg"
    },
    {
      'name':"Randolph",
      'image':"assets/images/face.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
             Expanded(

                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(

                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/face.jpg"),
                                fit: BoxFit.cover
                              ),
                              shape: BoxShape.circle
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("Chats",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                          ),),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            child: Icon(Icons.camera_alt,color: Colors.black,),
                          ),
                          SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            child: Icon(Icons.edit,color: Colors.black,),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.5),
                          hintText: "search",
                          prefixIcon: Icon(Icons.search,),
                          contentPadding: EdgeInsets.all(8),
                        ),
                        
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                  child: ListView.builder(
                    itemCount: users.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>BuildStatusWidget(name: users[index]['name']!)
                  ),
              ),
              Expanded(
                flex: 3,
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context,index)=>Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/face.jpg"),
                                  fit: BoxFit.cover
                              ),
                              shape: BoxShape.circle
                          ),
                        ),
                        SizedBox(width: 10,),
                        const Column(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("Martin Randolph",style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("You",style: TextStyle(
                                  fontSize: 14
                                ),),
                                SizedBox(width: 5,),
                                Text("What's man! ",style: TextStyle(
                                  fontSize: 14
                                ),),
                                SizedBox(width: 5,),
                                CircleAvatar(backgroundColor: Colors.grey,
                                radius: 2,),
                                SizedBox(width: 5,),
                                Text("9:40 AM",style: TextStyle(
                                  fontSize: 14
                                ),),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.check_circle_outline_outlined)

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
    ),
    );
  }
}
