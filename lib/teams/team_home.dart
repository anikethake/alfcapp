import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class teamlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('ALFCteams').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int messageCount = snapshot.data.documents.length;
        return new ListView.builder(
          itemCount: messageCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            return new InkWell(
                child: new ListTile(
                    key: new ValueKey(document.documentID),
                  title: new Text(document['name'] ?? '<No message retrieved>'),
                ),
                onTap: () {
                  return Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new playerlistpage(_,index)));
                });
          },
        );
      },
    );
  }
}

class teamlistpage extends StatelessWidget {
  teamlistpage();

  CollectionReference get players => Firestore.instance.collection('ALFCteams');

  Future<Null> _addMessage() async {
    final DocumentReference document = players.document();
    document.setData(<String, dynamic>{
      'playername': 'Hello world!',
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Teams'),
        ),
        body: new Material(child: new teamlist()),
      ),
    );
  }
}

class playerlistpage extends StatelessWidget {
  playerlistpage(_,indexnew);


  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('ALFCteams').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int messageCount = snapshot.data.documents.length;
        return new ListView.builder(

          itemCount: messageCount,
          itemBuilder: (_,indexnew) {
            final DocumentSnapshot document = snapshot.data.documents[indexnew];
            return new InkWell(
                child: new ListTile(
                    key: new ValueKey(document.documentID),
                  title: new Text(document['playername'] ?? '<No message retrieved>'),
                ),
                onTap: () {
                  return Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => null));
                });
          },
        );
      },
    );
  }
}
