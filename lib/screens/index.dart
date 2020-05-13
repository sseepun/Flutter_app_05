import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './home.dart';
import './signin.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 0;
  List<Widget> _screens;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom,
    ]);
    
    _screens = [
      SignInScreen(),
      HomeScreen(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentScreenIndex],
    );
  }
}
