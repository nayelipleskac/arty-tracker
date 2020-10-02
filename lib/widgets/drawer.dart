import 'package:flutter/material.dart';

import '../screens/add_stat_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 30,
            fontWeight: FontWeight.w600),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: 280,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              'The Arty Weight Tracker',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Home', Icons.home, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Add', Icons.add, () {
            Navigator.of(context).pushReplacementNamed(AddStatScreen.routeName);
          }),
        ],
      ),
    );
  }
}
