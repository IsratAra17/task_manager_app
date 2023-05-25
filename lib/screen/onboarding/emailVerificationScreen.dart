import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

import '../../api/apiClient.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  Map<String, String> Formvalues = {"email": ""};
  bool Loading = true;
  InputOnChange(MapKey, Textvalue) {
    setState(() {
      Formvalues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnsubmit() async {
    if (Formvalues['emial']!.length == 0) {
      ErrorToast("Email Required!");
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await VerifyEmailRequest(Formvalues['email']);
      if (res == true) {
        Navigator.pushNamed(context, "/pinVerification");
      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Loading?(Center(child: CircularProgressIndicator())):(SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ('Your Email Address'),
                    style: Head1Text(colorDarkBlue),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    'A 6 digit pin will send to your email address',
                    style: Head6Style(colorLightGray),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange('email', Textvalue);
                    },
                    decoration: AppInputDecoration('Email Address'),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () {
                        FormOnsubmit();
                      },
                      child: SuccessButtonChild('Next'),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
