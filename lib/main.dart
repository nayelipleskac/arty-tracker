// headline6 = title

import 'screens/statistic_home_screen.dart';
import 'package:flutter/material.dart';

import './screens/statistic_home_screen.dart';
import './widgets/statistic_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arty Tracker',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.grey,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 52, 1),
                fontSize: 18,
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 52, 1),
                fontSize: 18,
              ),
              headline6: TextStyle(
                fontSize: 35,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: StatisticHomeScreen(),
    );
  }
}
