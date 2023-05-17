import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskmanager/style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Stack(
        children: [
          ScreenBackground(context),
          Container(

              padding: EdgeInsets.all(30),

              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get Started With', style: Head1Text(colorDarkBlue)),
                      SizedBox(
                        height: 1,
                      ),
                      Text('Learn with Ara', style: Head6Style(colorLightGray)),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: AppInputDecoration("Email Address"),
                      ),
                      TextFormField(
                        decoration: AppInputDecoration("Password"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: ElevatedButton(
                            style: AppButtonStyle(),
                            onPressed: () {},
                            child: SuccessButtonChild('Sign Up')),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
