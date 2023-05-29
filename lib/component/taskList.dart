import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

ListView TaskList(TaskItems) {
  return ListView.builder(
      itemCount: TaskItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ItemSizebox(
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TaskItems[index]['title'],style: Head6Style(colorDarkBlue),),
              Text(TaskItems[index]['description'],style: Head7Style(colorLightGray),),
              Text(TaskItems[index]['createDate'],style: Head7Style(colorDarkBlue),),
              SizedBox(height: 20,),
              Row(
                children: [
                  StatusChild(TaskItems[index]['status'],statusColor),
                  Container(child: Row(
                    children: [
                      SizedBox(height: 30,width: 50,child: ElevatedButton(onPressed: (){},child: Icon(Icons.edit_location_alt_outlined,size: 16,),style: AppStatusBtnStyle(colorBlue),),),
                      SizedBox(height: 30,width: 50,child: ElevatedButton(onPressed: (){},child: Icon(Icons.delete_outline,size: 16,),style: AppStatusBtnStyle(colorRed),),),
                    ],
                  ),)
                ],
              )g

            ],
          )),
        );
      });
}
