import '../widgets/statistic_item.dart';
import 'package:flutter/material.dart';

import '../models/statistic.dart';

class HomeScreen extends StatelessWidget {
  final List<Statistic> dummyStat = [
    Statistic(
      id: 's1',
      pounds: 30,
      rolls: 8,
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
          crossAxisSpacing: 15,
          mainAxisSpacing: 16,
        ),
      ),
    );
  }
}
