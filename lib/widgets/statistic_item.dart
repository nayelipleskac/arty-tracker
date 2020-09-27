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
      padding: EdgeInsets.all(10),
      child: Text(
        pounds.toString(),
        style: Theme.of(context).textTheme.headline6,
      ),
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(15),
      ),
      
    );
  }
}
