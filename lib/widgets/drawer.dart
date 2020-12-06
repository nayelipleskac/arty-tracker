import 'package:flutter/material.dart';

import '../screens/add_stat_screen.dart';
import '../screens/statistic_detail_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.2,
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: tapHandler,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Container(
            height: 120,
            width: 280,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.16,
              child: Text(
                'The Arty Weight Tracker',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Container(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
          ),
          buildListTile('Home', Icons.home, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Tiles', Icons.line_style, () {
            Navigator.of(context)
                .pushReplacementNamed(StatisticDetailScreen.routeName);
          }),
          buildListTile('Add', Icons.add, () {
            Navigator.of(context).pushReplacementNamed(AddStatScreen.routeName);
          }),
        ],
      ),
    );
  }
}
