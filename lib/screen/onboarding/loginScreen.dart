import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/api/apiClient.dart';
import 'package:taskmanager/style/style.dart';
import 'package:taskmanager/utility/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Map<String,String> FormValues={"email":"", "password":""};
  bool Loading=false;

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['email']!.length==0){
      ErrorToast('Email Required !');
    }
    else if(FormValues['password']!.length==0){
      ErrorToast('Password Required !');
    }
    else{
      setState(() {Loading=true;});
      bool res=await LoginRequest(FormValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      }
      else{
        setState(() {Loading=false;});
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Stack(
        children: [
          ScreenBackground(context),
          Container(
alignment: Alignment.center,
              child: Loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(
                padding: EdgeInsets.all(30),

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
                      onChanged:(Textvalue) {
                        InputOnChange("email",Textvalue);
                      },

                      decoration: AppInputDecoration("Email Address"),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      onChanged: (Textvalue){InputOnChange("password", Textvalue);},
                      decoration: AppInputDecoration("Password"),
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
                          child: SuccessButtonChild('Login')),
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
