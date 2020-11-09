import '../widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AveragesScreen extends StatefulWidget {
  static const routeName = '/statistic-detail';

  @override
  _AveragesScreenState createState() => _AveragesScreenState();
}

class _AveragesScreenState extends State<AveragesScreen> {
  double average;

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

  List<String> facts = [
    'His birthday is October 10, 2005.',
    'Arty likes to go on bikerides and trips to the beach.',
    'Smells rather like AGED cheese when he has no bath for more than two weeks.',
  ];

  @override
  void initState() {
    getAverage().then((_) {
      setState(() {
        print('completed');
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
                  average == null ? '' : average.toStringAsFixed(1) + ' pounds',
                  style: Theme.of(context).textTheme.headline6,
                ),
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
              onPressed: () {},
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                facts[0],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              facts[1],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                facts[2],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
