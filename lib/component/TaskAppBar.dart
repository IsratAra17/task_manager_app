import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';
import 'package:taskmanager/utility/utility.dart';

AppBar TaskAppBar()
{
  return AppBar(
    backgroundColor: colorGreen,

   flexibleSpace:Container(
     margin: EdgeInsets.fromLTRB(10,40,20,0),
     child: Row(
       children: [
         CircleAvatar(backgroundColor:Colors.transparent,
           radius: 24,
           child: ClipOval(
             child: Image.memory(ShowBase64Image("Base64String")),
           ),

         ),

       ],
     ),
   ) ,

  );
}