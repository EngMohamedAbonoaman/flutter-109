import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: LayoutBuilder(
          builder: (context,constraints){
            return Column(
              children: [
                Container(
                  width: width,
                  height: constraints.maxHeight *.2,
                  child: Text("C1"),
                  color: Colors.red,
                ),
                Container(
                  width:width,
                  height: constraints.maxHeight * .6,
                  color: Colors.yellow,
                  child:  LayoutBuilder(
                    builder:(context,constraint)=> Column(
                      children: [
                       Container(
                         width: constraints.maxWidth,
                         height: constraint.maxHeight *.2,
                         child:  Text("Inner C2"),
                         color: Colors.green,
                       ),
                       Container(
                         width: constraints.maxWidth,
                         height: constraint.maxHeight *.2,
                         child:  Text("Inner C2"),
                         color: Colors.white,
                       ),
                       Container(
                         width: constraints.maxWidth,
                         height: constraint.maxHeight *.6,
                         color: Colors.black,
                         child:  Text("Inner C2"),
                       ),

                      ],
                    ),
                  ),
                ),
                Container(
                  width: width,
                  height: constraints.maxHeight *.2,
                  child: Text("C3"),
                  color: Colors.blue,
                ),
              ],
            );
          },
        ),
      )
    );
  }
}
