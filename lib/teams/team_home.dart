import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:progress_hud/progress_hud.dart';

class teamlistpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Material(color: Color(0xFF240629), child: new teamlist()),
      ),
    );
  }
}


class teamlist extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    void indexfun(var teamindex){
       
    }
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
                child: new Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: new Container(
                    color: Color(0xFFAF5D69),
                    height: 80.0,
                    child: new Center(
                      child: new Text(
                        document['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (context) {
                         new playerscreen();
                      },
                      ),
                    );
                },);
          },
        );
      },
    );
  }
}



class playerscreen extends StatelessWidget {
  var teamindex  = ['Azad united FC','Expert FC',];

  playerscreen();
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Container(
          child:  teamlistcard(teamindex)),
    );
  }
}

teamlistcard(teamindex)
{ 
  return new Material(
    child: new Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('ALFCteams')
            .where('name', isEqualTo: teamindex)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return new ProgressHUD(
              backgroundColor: Colors.black12,
              color: Colors.white,
              containerColor: Colors.blue,
              borderRadius: 5.0,
              );

          return new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Color(0xFF009688),
                height: 160.0,
                child: new Center(
                  child: Container(
                    color: Color(0xFFFF9800),
                    height: 64.0,
                    width: 310.0,
                    child: new Center(
                        child: Text(
                          teamindex[0],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23.0,
                              fontFamily: "Open Sans"),
                          )),
                    ),
                  ),
                ),
              new Expanded(
                child: new ListView(
                  children:
                  snapshot.data.documents.map((DocumentSnapshot document1) {

                    var indexoff=['pl1','pl2','pl3','pl4','pl5','pl6','pl7','pl8','pl9','pl10','pl11','pl12','pl13','pl14','pl15','pl16','pl17','pl18','pl19','pl20','pl21','pl22'];
                    var indexj=['p1j','p2j','p3j','p4j','p5j','p6j','p7j','p8j','p9j','p10j','p11j','p12j','p13j','p14j','p15j','p16j','p17j','p18j','p19j','p20j','p21j','p22j'];
                    var indexy=['p1y','p2y','p3y','p4y','p5y','p6y','p7y','p8y','p9y','p10y','p11y','p12y','p13y','p14y','p15y','p16y','p17y','p18y','p19y','p20y','p21y','p22y'];
                    var indexr=['p1r','p2r','p3r','p4r','p5r','p6r','p7r','p8r','p9r','p10r','p11r','p12r','p13r','p14r','p15r','p16r','p17r','p18r','p19r','p20r','p21r','p22r'];

                    return new Padding(
                      padding: const EdgeInsets.only(right: 38.0, left: 38.0),
                      child: SizedBox(
                        width: 304.0,
                        height: 549.0,
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0xFFCDDC39),
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.circular(0.0),
                            ),
                          child: new Column(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text(
                                    'Team Players',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Color(0xFF333333)
                                            .withOpacity(1.0)),
                                    ),
                                  ),
                                ),
                              new Padding(
                                padding: const EdgeInsets.only(top:2.0),
                                child: Container(
                                  color: Colors.black87,
                                  width: 250.0,
                                  height: 1.0,
                                  ),
                                ),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[0],indexj[0],indexy[0],indexr[0])),//palyer card calll
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[1],indexj[1],indexy[1],indexr[1])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[2],indexj[2],indexy[2],indexr[2])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[3],indexj[3],indexy[3],indexr[3])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[4],indexj[4],indexy[4],indexr[4])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[5],indexj[5],indexy[5],indexr[5])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[6],indexj[6],indexy[6],indexr[6])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[7],indexj[7],indexy[7],indexr[7])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[8],indexj[8],indexy[8],indexr[8])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[9],indexj[9],indexy[9],indexr[9])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[10],indexj[10],indexy[10],indexr[10])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[11],indexj[11],indexy[11],indexr[11])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[12],indexj[12],indexy[12],indexr[12])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[13],indexj[13],indexy[13],indexr[13])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[14],indexj[14],indexy[14],indexr[14])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[15],indexj[15],indexy[15],indexr[15])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[16],indexj[16],indexy[16],indexr[16])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[17],indexj[17],indexy[17],indexr[17])),
                              new Expanded(
                                  child: playerscard(context, document1,indexoff[18],indexj[18],indexy[18],indexr[18])),
//                                    new Expanded(
//                                        child: playerscard(context, document1,indexoff[19],indexj[19],indexy[19],indexr[19])),
//                                    new Expanded(
//                                        child: playerscard(context, document1,indexoff[20],indexj[20],indexy[20],indexr[20])),
//                                    new Expanded(
//                                        child: playerscard(context, document1,indexoff[21],indexj[21],indexy[21],indexr[21])),







                            ],
                            ),
                          ),
                        ),
                      );
                  }).toList(),
                  ),
                ),
            ],
            );
        },
        ),
    ),
  );
}





//player carddd
playerscard(context, document1,indexoff, indexj, indexy,indexr) {
  int i = 0;
  return new InkWell(
    child: new Padding(
      padding: const EdgeInsets.all(18.0),
      child: new Text(
        document1[indexoff],
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Color(0xFF333333).withOpacity(1.0)),
      ),
    ),
    onTap: () {
      showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return new Container(
                height: 250.0,
                color: Color(0xFFFFEB3B),
                child: new Column(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: new Text(document1[indexoff]),
                            ),
                            new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Expanded(
                                    child: new Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: new SizedBox(
                                        height: 45.0,
                                        width: 45.0,
                                        child: new Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: new Border.all(
                                              color: Colors.white,
                                              width: 2.5,
                                            ),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                                document1[indexj].toString()),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Expanded(
                                    child: new Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: new SizedBox(
                                        height: 45.0,
                                        width: 45.0,
                                        child: new Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: new Border.all(
                                              color: Colors.white,
                                              width: 2.5,
                                            ),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                                document1[indexy].toString()),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Expanded(
                                    child: new Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: new SizedBox(
                                        height: 45.0,
                                        width: 45.0,
                                        child: new Container(
                                          decoration: new BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: new Border.all(
                                              color: Colors.white,
                                              width: 2.5,
                                            ),
                                          ),
                                          child: new Center(
                                            child: new Text(
                                                document1[indexr].toString()),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: new Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: new Center(
                                      child: new Text('Joursey No.'),
                                    ),
                                  ),
                                ),
                                new Expanded(
                                  child: new Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: new Center(
                                      child: new Text('Yellow Card'),
                                    ),
                                  ),
                                ),
                                new Expanded(
                                  child: new Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: new Center(
                                      child: new Text('Red Card'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ));
          });
    },
  );

}
