import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

BottomNavigationBar appBottomNavBar(currentIndex,onItemtapped) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "New"),
      BottomNavigationBarItem(icon: Icon(Icons.access_time_rounded), label: "Progress"),
      BottomNavigationBarItem(icon: Icon(Icons.check_circle_outlined), label: "Completed"),
      BottomNavigationBarItem(icon: Icon(Icons.cancel_outlined), label: "Deleted"),
    ],
    selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGray,
    currentIndex:currentIndex ,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: onItemtapped,
    type: BottomNavigationBarType.fixed,


  );
}
