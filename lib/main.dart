import 'dart:math';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Playground",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<int> password = [];
  RxBool CheckCircle = false.obs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body:Container(
            child: Column(
              children: <Widget>[
                ChooseCircle(),
                SizedBox(height: 50,),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        button(1),
                        button(4),
                        button(7),
                      ],
                    ),
                    SizedBox(width: 30,),
                    Column(
                      children: <Widget>[
                        button(2),
                        button(5),
                        button(8),
                      ],
                    ),
                    SizedBox(width: 30,),
                    Column(
                      children: <Widget>[
                        button(3),
                        button(6),
                        button(9),
                      ],
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    button(0),
                    TextButton(onPressed: ()=>deleteNumber(), child: Text("Delete", style: TextStyle(fontSize: 30),)),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

  //Добавление в массив
  addNumber(int value){
    if(password.length >= 0 && password.length<4){
      password.add(value);
      CheckCircle.value = !CheckCircle.value;
      return password;
    }
  }

  //Удаление из массива
  deleteNumber(){
    if(password.length>0){
      password.remove(password.last);
      CheckCircle.value = !CheckCircle.value;
      return password;
    }
  }

  //виджет для кнопок ввода
  Widget button(int value){
    return TextButton(onPressed: (){addNumber(value);}, child: Text("$value", style: TextStyle(fontSize: 30),));
  }

  //Реализация изменение состояния кружков
  Widget ChooseCircle(){
    return Obx((){
          (dynamic val) {}(CheckCircle.value);
      switch (password.length){
        case 1:
          return  Row(
            children: <Widget>[
              Circle(true),
              SizedBox(width: 10,),
              Circle(false),
              SizedBox(width: 10,),
              Circle(false),
              SizedBox(width: 10,),
              Circle(false)
            ],
          );

        case 2:
          return  Row(
            children: <Widget>[
              Circle(true),
              SizedBox(width: 10,),
              Circle(true),
              SizedBox(width: 10,),
              Circle(false),
              SizedBox(width: 10,),
              Circle(false)
            ],
          );

        case 3:
          return  Row(
            children: <Widget>[
              Circle(true),
              SizedBox(width: 10,),
              Circle(true),
              SizedBox(width: 10,),
              Circle(true),
              SizedBox(width: 10,),
              Circle(false)
            ],
          );

        case 4:
          return  Row(
            children: <Widget>[
              Circle(true),
              SizedBox(width: 10,),
              Circle(true),
              SizedBox(width: 10,),
              Circle(true),
              SizedBox(width: 10,),
              Circle(true),
            ],
          );

      }
      return  Row(
        children: <Widget>[
          Circle(false),
          SizedBox(width: 10,),
          Circle(false),
          SizedBox(width: 10,),
          Circle(false),
          SizedBox(width: 10,),
          Circle(false),
        ],
      );
    });
  }
  Widget Circle(bool value){
    return value ? CircleAvatar(backgroundColor: Colors.green, radius: 22,) : CircleAvatar(backgroundColor: Colors.black,radius: 22, child: CircleAvatar( backgroundColor: Colors.white, radius: 20,),);
  }

}

