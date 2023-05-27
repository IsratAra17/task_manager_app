import 'package:flutter/material.dart';

BottomNavigationBar appBottomNavBar()
{
  return BottomNavigationBar(
      items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "New"
        ),
        BottomNavigationBarItem(icon:Icon(Icons.list_alt) ,label: "Progress"),
        BottomNavigationBarItem(icon:Icon(Icons.list_alt) ,label: "Completed"),
        BottomNavigationBarItem(icon:Icon(Icons.list_alt) ,label: "Deleted"),

      ] );
}