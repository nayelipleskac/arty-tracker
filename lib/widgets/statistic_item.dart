import 'package:flutter/material.dart';

class StatisticItem extends StatelessWidget {
  final String id;
  final int pounds;
  final int rolls;
  final DateTime date;

  StatisticItem(this.id, this.pounds, this.rolls, this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: GridTile(
        child: Text(pounds.toString()),
      ),
    );
  }
}
