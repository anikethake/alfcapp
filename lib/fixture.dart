import 'dart:async';

import 'package:alfcapp/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:async/async.dart';

//void main() => runApp(new MyApp());

class Fixtures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fixture',
      home: new MyFixtures(),
    );
  }
}

class MyFixtures extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyFixtures> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF240629),
      body: new Column(
        children: <Widget>[
          new SafeArea(
            child: new AppBar(
              backgroundColor: Color(0xFF781336),
              title: new Center(
                  child: new Padding(
                padding: const EdgeInsets.all(4.0),
                child: new Text(
                  "Fixtures",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.white.withOpacity(1.0)),
                ),
              )),
            ),
          ),
          new Expanded(child: new TeamList()),
        ],
      ),
    );
  }
}

class TeamList extends StatelessWidget {
  DateTime now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new Container(
            decoration: new BoxDecoration(
              color: Color(0xFF240629),
            ),
            child: new StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('ALFCdata')
                  .limit(2)
                  .orderBy('matchdate')
                  .where('done', isEqualTo: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return new ProgressHUD(
                    backgroundColor: Colors.black12,
                    color: Colors.white,
                    containerColor: Colors.blue,
                    borderRadius: 5.0,
                  );

                return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document1) {
                    DateTime now = new DateTime.now();
                    DateTime matchdate = document1['matchdate'];
                    var formatter = new DateFormat('dd-MM');
                    String formatted;
                    if (formatter.format(now) == formatter.format(matchdate)) {
                      formatted = "Today";
                    } else {
                      formatted = formatter.format(matchdate);
                    }

                    return new Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 120.0,
                        child: new InkWell(
                          child: new Card(
                            color: Color(0xFF240629),
                            child: Container(
                              decoration: new BoxDecoration(
                                color: Color(0xFF00BCD4),
                                shape: BoxShape.rectangle,
                                borderRadius: new BorderRadius.circular(18.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.only(
                                        left: 28.0, right: 28.0),
                                    child: new Text(
                                      formatted,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18.0,
                                          color: Colors.white.withOpacity(1.0)),
                                    ),
                                  ),
                                  Container(
                                    height: 120.0,
                                    width: 1.0,
                                    color: Colors.black87,
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                  ),
                                  new Expanded(
                                    child: new Column(
                                      children: <Widget>[
                                        new Expanded(
                                          child: new Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: new Text(
                                              document1['team1'],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                  color: Colors.white
                                                      .withOpacity(1.0)),
                                            ),
                                          ),
                                        ),
                                        new Expanded(
                                            child: new Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: new Text(
                                            document1['team2'],
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(1.0)),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => new fixopen(),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
        new Expanded(
          child: new Container(
            decoration: new BoxDecoration(
              color: Color(0xFF240629),
            ),
            child: new StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('ALFCdata')
                  .limit(5)
                  .orderBy('matchdate')
                  .where('done', isEqualTo: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return new ProgressHUD(
                    backgroundColor: Colors.black12,
                    color: Colors.white,
                    containerColor: Colors.blue,
                    borderRadius: 5.0,
                  );

                return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return new Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 120.0,
                        child: new Card(
                          color: Color(0xFF240629),
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Color(0xFFBA3D68),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(18.0),
                            ),
                            child: Row(
                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: new Text(
                                        document['team1score'],
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: new TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18.0,
                                            color:
                                                Colors.white.withOpacity(1.0)),
                                      ),
                                    ),
                                    new Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: new Text(
                                        document['team2score'],
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: new TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18.0,
                                            color:
                                                Colors.white.withOpacity(1.0)),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 120.0,
                                  width: 1.0,
                                  color: Colors.black87,
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                ),
                                new Expanded(
                                  child: new Column(
                                    children: <Widget>[
                                      new Expanded(
                                        child: new Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: new Text(
                                            document['team1'],
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(1.0)),
                                          ),
                                        ),
                                      ),
                                      new Expanded(
                                          child: new Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: new Text(
                                          document['team2'],
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                              color: Colors.white
                                                  .withOpacity(1.0)),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class fixopen extends StatefulWidget {
  @override
  _fixopenState createState() => _fixopenState();
}

class _fixopenState extends State<fixopen> {
  //CollectionReference get team1 => Firestore.instance.collection('team1');
//  Future<Null> team() async {
//    Firestore.instance.collection('ALFCteams').document().snapshots();
//  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          Container(
            color: Color(0xFF240629),
            height: 180.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('text'
                  ,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
                Text(
                  '1',
                  style: TextStyle(color: Colors.white, fontSize: 32.0),
                ),
                Icon(
                  Icons.bookmark,
                  size: 42.0,
                  color: Colors.white,
                ),
                Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 32.0),
                ),
                Text(
                  'Team B',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                )
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Container(
              color: Color(0xFF781336),
              height: 80.0,
              child: new Center(
                  child: Text(
                'Lineup',
                style: TextStyle(color: Colors.white,fontSize: 22.0),
              )),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('ALFCdata').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return const Text('Loading...');
                return new ListView.builder(
                  itemBuilder:(contex,index) {snapshot.data.documents
                      .map((DocumentSnapshot document) {
                    return new Card(
                      color: Colors.green,
                      child:new Text(document['team1'],style: TextStyle(color: Colors.black87,fontSize: 22.0)),

                    );
                  }).toList();
                  }
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
