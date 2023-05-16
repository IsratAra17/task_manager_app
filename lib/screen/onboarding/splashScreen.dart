import 'package:flutter/cupertino.dart';
import 'package:taskmanager/style/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScreenBackground(context),
        Container(padding: EdgeInsets.all(30),
        child: Center(child: Image.asset("assets/images/tasklogo.png")),alignment: Alignment.center,)
      ],
    );
  }
}
