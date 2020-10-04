import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/drawer.dart';

class AddStatScreen extends StatefulWidget {
  static const routeName = '/addStat';

  @override
  _AddStatScreenState createState() => _AddStatScreenState();
}

class _AddStatScreenState extends State<AddStatScreen> {
  //Navigator.of(context).pop();

  DateTime selectedDate;

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
        print(pickedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Stat!'),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                'add a weight.',
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 27,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Weight:',
                  icon: Icon(
                    Icons.add_circle,
                    size: 30,
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'add the number of rolls.',
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 27,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Rolls:',
                  icon: Icon(
                    Icons.add_circle,
                    size: 30,
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'add a date.',
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 27,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () => _presentDatePicker(context),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('chose date'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text('chosen date: '),
                  selectedDate == null
                      ? Text(
                          ' No Date Chosen',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          DateFormat.yMMMd().format(selectedDate),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
