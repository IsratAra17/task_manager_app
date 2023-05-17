import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Set Password", style: Head1Text(colorDarkBlue)),
                    SizedBox(height: 1),
                    Text("Minimum length password 8 character with Latter and number combination ",
                        style: Head6Style(colorLightGray)),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: AppInputDecoration("Password"),
                    ),
                    TextFormField(
                      decoration: AppInputDecoration("Confirm Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ElevatedButton(
                          style: AppButtonStyle(),
                          onPressed: () {},
                          child: SuccessButtonChild('Confirm')),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
