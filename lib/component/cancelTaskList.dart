import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/component/taskList.dart';

import '../api/apiClient.dart';

class cancelTaskList extends StatefulWidget {
  const cancelTaskList({Key? key}) : super(key: key);

  @override
  State<cancelTaskList> createState() => _cancelTaskListState();
}

class _cancelTaskListState extends State<cancelTaskList> {
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

  StatusChange(id) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  padding: EdgeInsets.all(30),
                  height: 300,
                  child: Column(),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Loading
        ? (Center(
      child: CircularProgressIndicator(),
    ))
        : RefreshIndicator(
        onRefresh: () async {
          await CallData();
        },
        child: TaskList(TaskItems,DeleteItem,StatusChange));
  }
}
