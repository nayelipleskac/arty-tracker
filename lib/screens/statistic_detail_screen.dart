import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/statistic_item.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StatisticDetailScreen extends StatefulWidget {
  static const routeName = '/statistic-home';

  @override
  _StatisticDetailScreenState createState() => _StatisticDetailScreenState();
}

class _StatisticDetailScreenState extends State<StatisticDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Arty Tracker',
      ),
    );
    return Scaffold(
      appBar: appBar,
      drawer: MainDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('Statistics')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong...');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          return GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (ctx, i) {
                DocumentSnapshot statDoc = snapshot.data.docs[i];
                print(statDoc.data());
                return StatisticItem(
                  statDoc.id,
                  statDoc['pounds'].toDouble(),
                  statDoc['rolls'],
                  DateTime.parse(statDoc['date'].toDate().toString()),
                );
              });
        },
      ),
    );
  }
}
