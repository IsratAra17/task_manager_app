import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

class taskCreateScreen extends StatefulWidget {
  const taskCreateScreen({Key? key}) : super(key: key);

  @override
  State<taskCreateScreen> createState() => _taskCreateScreenState();
}

class _taskCreateScreenState extends State<taskCreateScreen> {
  Map<String,String> FormValues={"title":"", "description":"","status":"New"};
  bool Loading=false;

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['title']!.length==0){
      ErrorToast('Title Required !');
    }
    else if(FormValues['Description']!.length==0){
      ErrorToast('Description Required !');
    }

    else{
      setState(() {Loading=true;});
      bool res=true;
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      }
      else{
        setState(() {Loading=false;});
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(backgroundColor:colorGreen,title: Text("Create New Task"),),
    );
  }
}
