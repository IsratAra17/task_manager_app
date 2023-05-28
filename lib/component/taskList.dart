import 'dart:js';
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
              Text(TaskItems[index]['description'],style: Head7Style(colorLightGray),)],
          )),
        );
      });
}
