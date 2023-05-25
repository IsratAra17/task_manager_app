
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/api/apiClient.dart';
import 'package:taskmanager/style/style.dart';
import 'package:taskmanager/utility/utility.dart';
class PinVerification extends StatefulWidget {
  const PinVerification({Key? key}) : super(key: key);

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  Map<String,String> FormValues={"otp":""};
  bool Loading=false;

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['otp']!.length!=6){
      ErrorToast('PIN Required !');
    }
    else{
      setState(() {Loading=true;});
      String? emailAddress=await ReadUserData('EmailVerification');
      bool res=await VerifyOTPRequest(emailAddress,FormValues['otp']);
      if(res==true){
        Navigator.pushNamed(context, "/setPassword");
      }
      else{
        setState(() {Loading=false;});
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
            child: Loading?(Center(child: CircularProgressIndicator())):(SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("PIN Varification", style: Head1Text(colorDarkBlue)),
                  SizedBox(height: 10),
                  Text("A 6 digit pin has been send to your mobile number", style: Head6Style(colorLightGray)),
                  SizedBox(height: 20),
                  PinCodeTextField(
                      appContext: context,
                      length: 6,
                      pinTheme: AppOTPstyle(),
                      animationType: AnimationType.fade,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {

                      },
                      onChanged: (value) {
                        InputOnChange("otp",value);
                      }
                  ),
                  Container(child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Verify'),
                    onPressed: (){
                      FormOnSubmit();
                    },
                  ),)
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}