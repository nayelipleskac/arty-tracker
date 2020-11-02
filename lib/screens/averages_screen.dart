import 'package:arty_tracker/widgets/drawer.dart';
import 'package:flutter/material.dart';

class AveragesScreen extends StatelessWidget {

  static const routeName = '/statistic-home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Averages'),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('the total average of pounds'),
            Text('week of 25-31:'),
          ],
        ),
      ),
    );
  }
}
