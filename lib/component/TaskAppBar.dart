import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';
import 'package:taskmanager/utility/utility.dart';

AppBar TaskAppBar(context,ProfileData) {
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: EdgeInsets.fromLTRB(10, 40, 20, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(
              child: Image.memory(
                ShowBase64Image(ProfileData['photo']),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${ProfileData['firstName']} ${ProfileData['lastName']}',
                style: Head7Style(colorWhite),
              ),
              Text(
                ProfileData['email'],
                style: Head9Style(colorWhite),
              ),
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.add_circle_outline_outlined),
      ),
      IconButton(
          onPressed: () async {
          await RemoveToken();
          Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
        },
        icon: Icon(Icons.output),
      )
    ],
  );
}
