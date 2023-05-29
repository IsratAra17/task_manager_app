import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

ListView TaskList(TaskItems) {

  return ListView.builder(
      itemCount: TaskItems.length,
      itemBuilder: (context, index)

      {

        Color statusColor=colorGreen;
        if(TaskItems[index]['status']=="New")
          {
            statusColor=colorBlue;
          }

       else if(TaskItems[index]['status']=="Progress")
        {
          statusColor=colorOrange;
        }
       else if(TaskItems[index]['status']=="Canceled")
        {
          statusColor=colorRed;
        }


        return Card(
          child: ItemSizebox(
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TaskItems[index]['title'],style: Head6Style(colorDarkBlue),),
              Text(TaskItems[index]['description'],style: Head7Style(colorLightGray),),
              Text(TaskItems[index]['createdDate'],style: Head9Style(colorDarkBlue),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  StatusChild(TaskItems[index]['status'],statusColor),
                  Container(child: Row(
                    children: [
                      SizedBox(height: 30,width: 50,child: ElevatedButton(onPressed: (){},child: Icon(Icons.edit_location_alt_outlined,size: 16,),style: AppStatusBtnStyle(colorBlue),),),
                      SizedBox(width: 10,),
                      SizedBox(height: 30,width: 50,child: ElevatedButton(onPressed: (){},child: Icon(Icons.delete_outline,size: 16,),style: AppStatusBtnStyle(colorRed),),),
                    ],
                  ),)
                ],
              )

            ],
          )),
        );
      });
}
