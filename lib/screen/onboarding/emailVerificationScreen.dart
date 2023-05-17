import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(('Your Email Address'),style: Head1Text(colorDarkBlue),),
              SizedBox(height: 1,),
              Text('A 6 digit pin will send to your email address',style: Head6Style(colorLightGray),),
              SizedBox(height: 20,),
              TextFormField(decoration: AppInputDecoration('Email Address'),),
              Container(child: ElevatedButton(style:AppButtonStyle(),onPressed:(){},child: SuccessButtonChild('Next'),),),

            ],
          ),

          ),




        ],
      ),
    );
  }
}
