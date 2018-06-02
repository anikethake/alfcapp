import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_hud/progress_hud.dart';


class TeamSelection extends StatefulWidget {
  @override
  _TeamSelectionState createState() => new _TeamSelectionState();
}

class _TeamSelectionState extends State<TeamSelection> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
      decoration: new BoxDecoration(color: Color(0xFF00204A)),
      child: new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('ALFCstanding').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new ProgressHUD(
            backgroundColor: Colors.black12,
            color: Colors.white,
            containerColor: Colors.blue,
            borderRadius: 5.0,
          );


          return new Container(

            child: new ListView(
              children: snapshot.data.documents.map((
                  DocumentSnapshot document) {
                return new Padding(
                  padding: new EdgeInsets.only(left: 5.0, right: 5.0),
                  child: new Container(

                    child: SizedBox(
                      height: 50.0,

                      child: new Card(
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0xFF005792),),
                          child: Row(
                            children: <Widget>[

                              new Expanded(
                                child: new Text(document['name'],
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Color(0xFFD9FAFF).withOpacity(
                                          1.0)),),

                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),

            ),
          );
        },
      ),
    );
  }
}


