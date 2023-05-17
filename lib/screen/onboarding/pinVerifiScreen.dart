import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/style/style.dart';
class PinVerification extends StatefulWidget {
  const PinVerification({Key? key}) : super(key: key);

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
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
                Text(('Pin Verification'),style: Head1Text(colorDarkBlue),),
                SizedBox(height: 10,),
                Text('A 6 digit pin will send to your mobile number',style: Head6Style(colorLightGray),),
                SizedBox(height: 20,),
                PinCodeTextField(appContext: context,
                    length: 6,
                    pinTheme: AppOTPstyle(),
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v){},
                    onChanged: (value){}),
                Container(child: ElevatedButton(style:AppButtonStyle(),onPressed:(){},child: SuccessButtonChild('Next'),),),

              ],
            ),

          ),




        ],
      ),
    );
  }
}
