import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//void main() => runApp(new MyApp());

class team_detailpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
//    Firestore.instance.collection('mountains').document()
//        .setData({ 'title': 'Mount Baker', 'type': 'volcano' });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Home"),
        ),
        body: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new teamlist(),
            ),
          ],
        ),
      ),
    );
  }
}

class teamlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(

      child: new Center(
        child: new StreamBuilder(
          stream: Firestore.instance.collection('ALFCteams').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return new Text('Loading...');
            return new ListView(
              children: snapshot.data.documents.map((document) {
                return new ListTile(
                  title: new Card(
                    child: new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Center(child: new Text(document['team name'])),
                    ),
                  ),
                  onTap: null,

                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

