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
    return Stack(
      children: [
        ScreenBackground(context),
        Padding(padding: EdgeInsets.all(30)),
        Container(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
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
                    child: SuccessButtonChild('Login')),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
