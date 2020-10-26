import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/statistic_home_screen.dart';

class StatisticItem extends StatefulWidget {
  final String id;
  final double pounds;
  final int rolls;
  final DateTime date;

  StatisticItem(this.id, this.pounds, this.rolls, this.date);

  @override
  _StatisticItemState createState() => _StatisticItemState();
}

class _StatisticItemState extends State<StatisticItem> {
  final appBar = AppBar(
    title: Text(
      'Arty Tracker',
    ),
  );

  Future<void> _submitDelete(String id) async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection('Statistics').doc(id);
    await ref.delete();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
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
                widget.pounds.toString() + ' pounds',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                widget.rolls.toString() + ' rolls',
              ),
              Text(
                DateFormat.yMMMd().format(widget.date),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                iconSize: 30,
                onPressed: () async {
                  await _submitDelete(widget.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
