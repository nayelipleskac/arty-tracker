import '../widgets/drawer.dart';

import '../widgets/statistic_item.dart';
import 'package:flutter/material.dart';

import '../models/statistic.dart';

class StatisticHomeScreen extends StatelessWidget {

  static const routeName = '/statistic-home';

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
