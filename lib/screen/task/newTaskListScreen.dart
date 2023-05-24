import 'package:flutter/material.dart';

import '../../utility/utility.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({Key? key}) : super(key: key);


  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();

}


class _NewTaskListScreenState extends State<NewTaskListScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("New",style: TextStyle(color: Colors.black87,fontSize: 30),)),
    );
  }
}
