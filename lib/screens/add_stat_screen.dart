import '../widgets/drawer.dart';
import 'package:flutter/material.dart';

class AddStatScreen extends StatelessWidget {
  static const routeName = '/addStat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Stat!'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'add a weight.',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 27,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add_circle,
              size: 30,
            ),
            
          ),
        ],
      ),
    );
  }
}
