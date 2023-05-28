import 'package:flutter/material.dart';
import 'package:taskmanager/component/TaskAppBar.dart';
import 'package:taskmanager/component/appBottomNavBar.dart';
import 'package:taskmanager/component/cancelTaskList.dart';
import 'package:taskmanager/component/completedTaskList.dart';
import 'package:taskmanager/component/newTaskList.dart';
import 'package:taskmanager/component/progressTaskList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int TabIndex=0;
  onItemTapped(int index)
  {
    setState(() {
      TabIndex=index;
    });
  }
  final widgetOptions=[
    newTaskList(),
    progressTaskList(),
    completedTaskList(),
    cancelTaskList()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNavBar(TabIndex,onItemTapped),
    );
  }
}
