import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/apiClient.dart';

class completedTaskList extends StatefulWidget {
  const completedTaskList({Key? key}) : super(key: key);

  @override
  State<completedTaskList> createState() => _completedTaskListState();
}

class _completedTaskListState extends State<completedTaskList> {


  List TaskItems=[];
  bool Loading=true;
  @override
  void initState()
  {
    CallData();
    super.initState();
  }

  CallData()async{
    var data=await TaskListRequest("Completed");
    setState(() {
      Loading=false;
      TaskItems=data;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Loading?(Center(child: CircularProgressIndicator(),)):(Center(child:Text("Completed task")));
  }
}