import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/statistic_item.dart';
import '../models/statistic.dart';
import './add_stat_screen.dart';

class StatisticHomeScreen extends StatefulWidget {
  static const routeName = '/statistic-home';

  @override
  _StatisticHomeScreenState createState() => _StatisticHomeScreenState();
}

class _StatisticHomeScreenState extends State<StatisticHomeScreen> {
  

  final List<Statistic> dummyStat = [
    Statistic(
      id: 's1',
      pounds: 30,
      rolls: 8,
      date: DateTime.now(),
    ),
    Statistic(
      id: 's2',
      pounds: 50,
      rolls: 10,
      date: DateTime.now(),
    ),
    Statistic(
      id: 's3',
      pounds: 37,
      rolls: 6,
      date: DateTime.now(),
    ),
    Statistic(
      id: 's4',
      pounds: 33,
      rolls: 7,
      date: DateTime.now(),
    ),
  ];

  // void _addNewStatistic(int pounds, int rolls, DateTime selectedDate) {
  //   final newStat = Statistic(
  //     id: DateTime.now().toString(),
  //     pounds: pounds,
  //     rolls: rolls,
  //     date: selectedDate,
  //   );

  //   setState(() {
  //     dummyStat.add(newStat);
  //   });

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Arty Tracker',
        ),
      ),
      drawer: MainDrawer(),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: dummyStat.length,
        itemBuilder: (ctx, i) => StatisticItem(
          dummyStat[i].id,
          dummyStat[i].pounds,
          dummyStat[i].rolls,
          dummyStat[i].date,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
