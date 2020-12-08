import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/drawer.dart';
import '../screens/statistic_detail_screen.dart';

class AddStatScreen extends StatefulWidget {
  static const routeName = '/addStat';

  @override
  _AddStatScreenState createState() => _AddStatScreenState();
}

class _AddStatScreenState extends State<AddStatScreen> {
  final _poundsController = TextEditingController();
  final _rollsController = TextEditingController();
  DateTime selectedDate;
  String feedback = '';
  bool success = false;

  Future<void> _submitData() async {
    // setState(() {
    //   feedback = 'testing';
    // });
    if (_poundsController.text.isEmpty ||
        _rollsController.text.isEmpty ||
        selectedDate == null) {
      print('fail- one field is empty');

      setState(() {
        feedback = 'Enter a value for all fields!';
        success = false;
      });
      return;
    }
    final enteredPounds = double.parse(_poundsController.text);
    final enteredRolls = int.parse(_rollsController.text);

    if (enteredPounds <= 0 || enteredRolls <= 0) {
      print('fail- pounds or rolls not positive');

      setState(() {
        feedback = 'Remember to enter a positive weight/roll count!';
        success = false;
      });
      return;
    }
    print('success');
    success = true;
    Navigator.of(context).pushReplacementNamed(StatisticDetailScreen.routeName);

    CollectionReference statistics =
        FirebaseFirestore.instance.collection('Statistics');
    await statistics.add(
        {'pounds': enteredPounds, 'rolls': enteredRolls, 'date': selectedDate});
  }

  Widget _buildDirectionLabel(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 27,
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          icon: Icon(
            Icons.add_circle,
            size: 30,
          ),
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }

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
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildDirectionLabel('add a weight.'),
              _buildTextField('Weight:', _poundsController),
              SizedBox(
                height: 30,
              ),
              _buildDirectionLabel('add the number of rolls.'),
              _buildTextField('Rolls: ', _rollsController),
              SizedBox(
                height: 30,
              ),
              _buildDirectionLabel('add a date.'),
              Container(
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () => _presentDatePicker(context),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('choose date'),
                ),
              ),
              Container(
                //height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text('chosen date: '),
                    selectedDate == null
                        ? Text(
                            ' No Date Chosen!',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            DateFormat.yMMMd().format(selectedDate),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
              ),
              Container(
                height: 70,
                //height: MediaQuery.of(context).size.height * 0.1,
                alignment: Alignment.center,
                child: RaisedButton(
                  padding: EdgeInsets.all(15),
                  onPressed: () async {
                    // if (success == true) {
                    //   print('going to /');
                    // }
                    if (success == false) {
                      await _submitData();
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text(
                    'Save Statistic',
                  ),
                ),
              ),
              Center(
                child: Text(
                  feedback,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
