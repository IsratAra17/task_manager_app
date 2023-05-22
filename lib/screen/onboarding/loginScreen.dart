import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskmanager/api/apiClient.dart';
import 'package:taskmanager/style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Map<String,String>FormValues={"email":"","password":""};
  bool Loading=false;
  InputOnChange(Mapkey,Textvalue)
  {
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);

  });

  }

  FormOnsubmit()async{
    if(FormValues['email']!.length==0)
    {
      ErrorToast('Email Required');

    }
    else if(FormValues['password']!.length==0)
    {
      ErrorToast('Password Required');

    }
    else{
      setState(() {
        Loading==true;
      });

      bool res=await LoginRequest(FormValues);
      if(res==true)
      {
        //navigate to dashboard
      }
      else
      {
        setState(() {
          Loading=false;
        });
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

              child: Center(
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

                              FormOnsubmit();
                            },
                            child: SuccessButtonChild('Sign Up')),
                      ),
                    ],
                  ),
                )),
              ),
          ),
        ],
      ),
    );
  }
}
