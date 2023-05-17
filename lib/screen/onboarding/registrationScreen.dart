import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Join With Us",style: Head1Text(colorDarkBlue),),
                  SizedBox(height: 1,),
                  Text("Learn with israt ara",style: Head6Style(colorLightGray),),
SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration('First Name'),),
                  SizedBox(height: 20,),

                  TextFormField(decoration: AppInputDecoration('Last Name'),),
                  SizedBox(height: 20,),

                  TextFormField(decoration: AppInputDecoration('Mobile'),),
                  SizedBox(height: 20,),

                  TextFormField(decoration: AppInputDecoration('Password'),),
                  SizedBox(height: 20,),

                  TextFormField(decoration: AppInputDecoration('Confirm Password'),),
                  SizedBox(height: 20,),

                  Container(child: ElevatedButton(
                    style: AppButtonStyle(),
                    onPressed:(){},child: SuccessButtonChild('Registration'),),),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
