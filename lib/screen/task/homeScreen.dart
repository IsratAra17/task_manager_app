import 'package:flutter/material.dart';
import 'package:taskmanager/component/appBottomNavBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomTabIndex=0;
  onItemTapped(int index)
  {
    setState(() {
      bottomTabIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(),
      bottomNavigationBar: appBottomNavBar(bottomTabIndex,onItemTapped),
    );
  }
}
