import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanager/screen/onboarding/loginScreen.dart';
import 'package:taskmanager/screen/onboarding/pinVerifiScreen.dart';
import 'package:taskmanager/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager/screen/onboarding/splashScreen.dart';
import 'package:taskmanager/screen/task/homeScreen.dart';
import 'package:taskmanager/screen/task/newTaskListScreen.dart';
import 'package:taskmanager/screen/task/taskCreateScreen.dart';
import 'package:taskmanager/utility/utility.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token= await ReadUserData('token');
  if(token==null){
    runApp( MyApp("/login"));
  }
  else{
    runApp( MyApp("/"));
  }
}


class MyApp extends StatelessWidget {
  final String FirstRoute;
  MyApp(this.FirstRoute);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      initialRoute:FirstRoute,
      routes: {
        '/':(context)=>HomeScreen(),//home
        '/login':(context)=>LoginScreen(),
        '/registration':(context)=>RegistrationScreen(),
        '/emailVerification':(context)=>EmailVerification(),
        '/pinVerification':(context)=>PinVerification(),
        '/setPassword':(context)=>SetPasswordScreen(),
        '/newTaskList':(context)=>NewTaskListScreen(),
        '/taskCreate':(context)=>taskCreateScreen()

      },


    );
  }
}

