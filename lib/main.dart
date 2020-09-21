import 'package:arty_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arty Tracker',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.grey,
      ),
      home: HomeScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Arty Tracker',
        ),
      ),
      body: Center(
        child: Text('The listtiles'),
      ),
    );
  }
}
