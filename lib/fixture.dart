import 'dart:async';

import 'package:alfcapp/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:progress_hud/progress_hud.dart';
import 'teams/team_home.dart';

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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String team1;
  String team2;
  String team2score;
  String team1score;
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
                  key: _scaffoldKey,
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
                                builder: (context) => new fixopenscore(
                                    team1: document1['team1'],
                                    team2: document1['team2'],
                                    date: formatted),
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
                        child: InkWell(
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
                                              color: Colors.white
                                                  .withOpacity(1.0)),
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
                                              color: Colors.white
                                                  .withOpacity(1.0)),
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
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => new fixopen(
                                      team1: document['team1'],
                                      team2: document['team2'],
                                      team1score: document['team1score'],
                                      team2score: document['team2score'],
                                    ),
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
        )
      ],
    );
  }
}

class fixopen extends StatelessWidget {
  fixopen({Key key, this.team1, this.team2, this.team1score, this.team2score})
      : super(key: key);
  String team1;
  String team2;
  String team1score;
  String team2score;

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      team1,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      team1score,
                      style: TextStyle(color: Colors.white, fontSize: 32.0),
                    ),
                  ),
                ),
                Icon(
                  Icons.bookmark,
                  size: 42.0,
                  color: Colors.white,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      team2score,
                      style: TextStyle(color: Colors.white, fontSize: 32.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      team2,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
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
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              )),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Container(child: SizedBox(
                    height: 400.0,
                    width: 180.0,
                    child: lineup(team1))),
              ),
              Center(
                child: Container(
                  color: Colors.black87,
                  height: 400.0,
                  width: 1.0,
                ),
              ),
              Flexible(
                child: Container(
                  child: SizedBox
                    (
                      height: 400.0,
                      width: 180.0,
                      child: lineup(team2)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class fixopenscore extends StatelessWidget {
  fixopenscore({Key key, this.team1, this.team2, this.date}) : super(key: key);
  String team1;
  String team2;
  String date;

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          Container(
            color: Color(0xFF240629),
            height: 180.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      team1,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),

                    Text(
                      team2,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:28.0),
                  child: Text(
                    date,
                    style: TextStyle(color: Colors.white, fontSize: 26.0),
                    ),
                ),
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
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              )),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: Container
                  (
                  child: SizedBox(
                    height: 400.0,
                    width: 180.0,
                    child: lineup(team1),
                  ),
                ),
              ),
              Container(

                color: Colors.black87,
                height: 400.0,
                width: 1.0,
              ),
              Container(
                child: SizedBox(
                  height: 400.0,
                  width: 180.0,
                  child: lineup(team2),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class lineup extends StatelessWidget {
  lineup(String this.teamname);
  String teamname;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(teamname).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int messageCount = snapshot.data.documents.length;

        return new ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: messageCount,
          padding: const EdgeInsets.all(0.0),
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];

            return new InkWell(
              child: new Center(
                child: ListTile(
                  leading: Icon(Icons.accessibility),
                  title: new Text(
                    document['name'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
//                onTap: () {
//                  Navigator.of(context).push(
////                    new MaterialPageRoute(
////                      builder: (context) {
////                         //new
////                        playerwin();
////                      },
////                      ),
//                        MaterialPageRoute(
//                            builder: (context) => playerscreen(
//                                  name: document['name'],
//                                )),
//                      );
////                setState(() {
////                  name=document['name'];
////                });
//                },
            );
          },
        );
      },
    );
  }
}

