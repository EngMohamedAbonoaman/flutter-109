import 'package:flutter/material.dart';

class BuildStatusWidget extends StatelessWidget {
   BuildStatusWidget({super.key,required this.name});
    String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 10,left: 10),
      child: Column(
        children: [
          Stack(
              alignment: Alignment.bottomRight,
              children:[
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
                Stack(
                    alignment: Alignment.center,
                    children:[
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                      ),
                    ]
                )
              ]
          ),
          Text(name,style: TextStyle(
            fontSize: 13,

          ),)
        ],
      ),
    );
  }
}
