import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AveragesScreen extends StatefulWidget {
  static const routeName = '/statistic-average';

  @override
  _AveragesScreenState createState() => _AveragesScreenState();
}

class _AveragesScreenState extends State<AveragesScreen> {
  double average;

  final _factController = TextEditingController();

  String factFeedback = '';
  bool success = false;

  Future<QuerySnapshot> querySnapShot;

  Future<void> getAverage() async {
    //querySnapshot is the collection
    //.docs are the documents in the collection
    List<QueryDocumentSnapshot> docList = await _firestore
        .collection('Statistics')
        .get()
        .then((QuerySnapshot querySnapshot) => querySnapshot.docs);
    double total = 0;
    for (var i = 0; i < docList.length; i++) {
      print('Single doc : ' + docList[i].toString());
      total += docList[i]['pounds'].toDouble();
    }
    print(total);
    average = total / docList.length;
  }

  Future<void> getFacts() async {
    List<QueryDocumentSnapshot> factList = await _firestore
        .collection('Fun Facts')
        .get()
        .then((QuerySnapshot querySnapShot) => querySnapShot.docs);
    factList.forEach((doc) {
      facts.add(doc['fun fact']);
      print('added to the list -facts-');
    });
  }

  List<String> facts = [
    // 'His birthday is October 10, 2005.',
    // 'Arty likes to go on bikerides and trips to the beach.',
    // 'Smells rather like AGED cheese when he has no bath for more than two weeks.',
  ];

  void _submitFunFact() {
    if (_factController.text.isEmpty) {
      print('fun fact field is empty');

      setState(() {
        success = false;
        factFeedback = 'Enter a fun fact';
      });
      //return;
    }

    final enteredFact = _factController.text.toString();

    success = true;
    Navigator.of(context).pushReplacementNamed('/');
    print('SUCCESS FOR SAVED FACT');
    print(_factController);

    CollectionReference funFacts =
        FirebaseFirestore.instance.collection('Fun Facts');
    funFacts.add({'fun fact': enteredFact});
  }

  void _startAddFunFact(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Remember when adding a new fun fact, it should be relevant, unique and entertaining!',
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _factController,
                    decoration: InputDecoration(
                      labelText: 'Type fun fact here...',
                      icon: Icon(
                        Icons.note_add,
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text(
                    'Add Fun Fact',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _submitFunFact(),
                ),
                Center(
                  child: Text(
                    factFeedback,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    getAverage().then((_) {
      getFacts().then((_) {
        setState(() {
          print('completed');
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Home Screen'),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(50),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Text(
                    average == null
                        ? ''
                        : average.toStringAsFixed(1) + ' pounds',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 35,
                      color: Colors.white,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/arty.jpg",
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.add_circle,
                size: 40,
                color: Colors.lime,
              ),
              onPressed: () => _startAddFunFact(context),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Fun Facts About Arty!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                facts.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
