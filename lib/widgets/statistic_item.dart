import 'package:flutter/material.dart';

import '../screens/statistic_home_screen.dart';

class StatisticItem extends StatelessWidget {
  final String id;
  final int pounds;
  final int rolls;
  final DateTime date;

  StatisticItem(this.id, this.pounds, this.rolls, this.date);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              pounds.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
            Text('another thing'),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
