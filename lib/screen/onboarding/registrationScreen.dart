import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/api/apiClient.dart';
import 'package:taskmanager/style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map<String, String> FormValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "photo": "",
    "cpassword": ""
  };
  bool Loading = false;
  InputOnchange(Mapkey, Textvalue) {
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast('Email Required!');
    } else if (FormValues['firstName']!.length == 0) {
      ErrorToast('First Name Required!');
    } else if (FormValues['lastName']!.length == 0) {
      ErrorToast('Last Name Required!');
    } else if (FormValues['mobile']!.length == 0) {
      ErrorToast('Mobile Required!');
    } else if (FormValues['password']!.length == 0) {
      ErrorToast('Password Required!');
    } else if (FormValues['password'] != FormValues['cpassword']) {
      ErrorToast('Confirm Password should be same as Password!');}
    //  else if (FormValues['photo']!.length == 0) {
    //   ErrorToast('Photo Required!');}
    //
    else {
      setState(() {
        Loading = true;
      });
      bool res = await RegistrationRequest(FormValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
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
            padding: EdgeInsets.all(30),
            child: Loading?(Center(child: CircularProgressIndicator())):(SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
            "Join With Us",
            style: Head1Text(colorDarkBlue),
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            "Learn with israt ara",
            style: Head6Style(colorLightGray),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (Textvalue){
              InputOnchange('email', Textvalue);
            },
            decoration: AppInputDecoration('Email'),
          ),
          SizedBox(
            height: 20,
          ),

          TextFormField(
            onChanged: (Textvalue) {
              InputOnchange('firstName', Textvalue);
            },
            decoration: AppInputDecoration('First Name'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (Textvalue) {
              InputOnchange('lastName', Textvalue);
            },
            decoration: AppInputDecoration('Last Name'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(onChanged: (Textvalue){
            InputOnchange('mobile', Textvalue);
          },
            decoration: AppInputDecoration('Mobile'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(onChanged: (Textvalue){
            InputOnchange('password', Textvalue);
          },
            decoration: AppInputDecoration('Password'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (Textvalue){
              InputOnchange('cpassword', Textvalue);
            },
            decoration: AppInputDecoration('Confirm Password'),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: ElevatedButton(
              style: AppButtonStyle(),
              onPressed: () {
                FormOnSubmit();
              },
              child: SuccessButtonChild('Registration'),
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
