import '../widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AveragesScreen extends StatefulWidget {
  static const routeName = '/statistic-home';

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
      print('Single DOC : ' + docList[i].toString());
      total += docList[i]['pounds'].toDouble();
    }
    print(total);
    average = total / docList.length;
  }

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
        title: Text('The Averages'),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(70),
              ),
              child: Text(
                average.toString() + ' pounds',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
