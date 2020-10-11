import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatisticItem extends StatelessWidget {
  final String id;
  final double pounds;
  final int rolls;
  final DateTime date;

  StatisticItem(this.id, this.pounds, this.rolls, this.date);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                pounds.toString() + ' pounds',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                rolls.toString() + ' rolls',
              ),
              Text(
                DateFormat.yMMMd().format(date),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                iconSize: 30,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
