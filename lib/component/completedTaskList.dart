import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/component/taskList.dart';

import '../api/apiClient.dart';

class completedTaskList extends StatefulWidget {
  const completedTaskList({Key? key}) : super(key: key);

  @override
  State<completedTaskList> createState() => _completedTaskListState();
}

class _completedTaskListState extends State<completedTaskList> {
  List TaskItems = [];
  bool Loading = true;
  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest("Completed");
    setState(() {
      Loading = false;
      TaskItems = data;
    });
  }
  DeleteItem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Onece delete, you can't get it back"),
            actions: [
              OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {Loading=true;});
                await TaskDeleteRequest(id);
                await CallData();
              }, child: Text('Yes')),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No')),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Loading
        ? (Center(
            child: CircularProgressIndicator(),
          ))
        : RefreshIndicator(onRefresh: () async { await CallData(); },
        child: TaskList(TaskItems));
  }
}
