// headline6 = title

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/statistic_home_screen.dart';
import './screens/add_stat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

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
      // home: StatisticHomeScreen(),
      routes: {
        '/': (ctx) => StatisticHomeScreen(),
        StatisticHomeScreen.routeName: (ctx) => StatisticHomeScreen(),
        AddStatScreen.routeName: (ctx) => AddStatScreen(),
      },
    );
  }
}
