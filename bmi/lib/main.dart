

import 'package:flutter/material.dart';

void main(){
  runApp(BMIAPP());
}
class BMIAPP extends StatefulWidget{
  @override
  State<BMIAPP> createState() => _BMIAPPState();
}

class _BMIAPPState extends State<BMIAPP> {
  double sliderValue = 0;
  bool isMale = true;
  double weight = 20;
  double age = 20;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff0A0E21),
        appBar: AppBar(
          backgroundColor: const Color(0xff1A1F38),
          centerTitle: true,
          title: const Text("BMI calculator",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.white
          ),),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale? Color(0xff1A1F38):Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)
                          ),

                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.female,size: 70,color: Colors.white,),
                                Text("FEMALE",style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white

                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale? Colors.deepOrange: Color(0xff1A1F38),
                              borderRadius: BorderRadius.circular(20)
                          ),

                          child: const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.male,size: 70,color: Colors.white,),
                                Text("MALE",style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white

                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ) ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff1A1F38),
                    borderRadius: BorderRadius.circular(20),
                  ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text("HEIGHT",style: TextStyle(fontWeight: FontWeight.w500,
                            fontSize: 20,color: Colors.white),),
                          Text("CM",style: TextStyle(
                              fontSize: 10,color: Colors.white),),
                        ],
                      ),
                      Slider(value: sliderValue,
                      min: 0,
                      max: 120,
                      divisions: 4,
                      onChanged: (changedValue){
                        setState(() {
                          sliderValue = changedValue;
                        });
                        },),
                      Text("${sliderValue.round()}",style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 20,color: Colors.white),),
                    ],
                  ),
                ),

              ),
            )),
            Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff1A1F38),
                            borderRadius: BorderRadius.circular(20)
                        ),

                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("WEIGHT",style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white

                              ),),
                              Text("$weight",style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white

                              ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    child: Icon(Icons.remove),
                                  ),
                                  SizedBox(width: 10,),
                                  CircleAvatar(
                                    radius: 20,
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff1A1F38),
                            borderRadius: BorderRadius.circular(20)
                        ),

                        child:  Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("AGE",style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white

                              ),),
                              Text("$age",style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white

                              ),),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        if(age>12){
                                          age--;
                                        }
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 20,
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 20,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ) ),


          ],
        ),
      ),
    );
  }
}