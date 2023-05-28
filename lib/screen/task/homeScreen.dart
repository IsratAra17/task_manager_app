import 'package:flutter/material.dart';
import 'package:taskmanager/component/TaskAppBar.dart';
import 'package:taskmanager/component/appBottomNavBar.dart';
import 'package:taskmanager/component/cancelTaskList.dart';
import 'package:taskmanager/component/completedTaskList.dart';
import 'package:taskmanager/component/newTaskList.dart';
import 'package:taskmanager/component/progressTaskList.dart';
import 'package:taskmanager/utility/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String,String>ProfileData={"email":"User Email","firstName":"User","lastName":"Name","photo":DefaultProfilePic};
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

  ReadAppBarData()async{
    String? email=await ReadUserData('email');
    String? firstName=await ReadUserData('firstName');
    String? lastName=await ReadUserData('lastName');
    String? photo=await ReadUserData('photo');
    setState(() {
      ProfileData={"email":'$email',"firstName":'$firstName',"lastName":'$lastName',"photo":'$photo'};    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(context,ProfileData),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNavBar(TabIndex,onItemTapped),
    );
  }
}
