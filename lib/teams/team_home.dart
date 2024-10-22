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


class teamlist extends StatefulWidget {




  @override
  teamlistState createState() {
    return new teamlistState();
  }
}

class teamlistState extends State<teamlist> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String name;
  @override
  Widget build(BuildContext context) {

    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('ALFCteams').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int messageCount = snapshot.data.documents.length;

        return new ListView.builder(
          shrinkWrap: true,
          key: _scaffoldKey,
          itemCount: messageCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];

            return new InkWell(
                child: new Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: new Container(
                    color: Color(0xFFAF5D69),
                    height: 40.0,
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
//                    new MaterialPageRoute(
//                      builder: (context) {
//                         //new
//                        playerwin();
//                      },
//                      ),
                     MaterialPageRoute(builder: (context) => playerscreen(name: document['name'],)),
                    );
//                setState(() {
//                  name=document['name'];
//                });


                },);
          },
        );
      },
    );
  }
}




class playerscreen extends StatelessWidget {
  playerscreen({Key key,this.name}) : super(key: key);
  String name;

  @override
  Widget build(BuildContext context) {

    return  Material(
      child:  Container(

        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('ALFCteams')
              .where('name', isEqualTo: name)
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
                            name,
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

                    shrinkWrap: true,
                    children:
                    snapshot.data.documents.map((DocumentSnapshot document1) {

                      var indexoff=['pl1','pl2','pl3','pl4','pl5','pl6','pl7','pl8','pl9','pl10','pl11','pl12','pl13','pl14','pl15','pl16','pl17','pl18','pl19','pl20','pl21','pl22'];
                      var indexj=['p1j','p2j','p3j','p4j','p5j','p6j','p7j','p8j','p9j','p10j','p11j','p12j','p13j','p14j','p15j','p16j','p17j','p18j','p19j','p20j','p21j','p22j'];
                      var indexy=['p1y','p2y','p3y','p4y','p5y','p6y','p7y','p8y','p9y','p10y','p11y','p12y','p13y','p14y','p15y','p16y','p17y','p18y','p19y','p20y','p21y','p22y'];
                      var indexr=['p1r','p2r','p3r','p4r','p5r','p6r','p7r','p8r','p9r','p10r','p11r','p12r','p13r','p14r','p15r','p16r','p17r','p18r','p19r','p20r','p21r','p22r'];
                      var indexg=['p1g','p2g','p3g','p4g','p5g','p6g','p7g','p8g','p9g','p10g','p11g','p12g','p13g','p14g','p15g','p16g','p17g','p18g','p19g','p20g','p21g','p22g'];

                      return new Padding(
                        padding: const EdgeInsets.only(right: 38.0, left: 38.0),
                        child: SizedBox(
                          width: 304.0,
                          height: 1150.0,
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Color(0xFFCDDC39),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(0.0),
                              ),
                            child: new Column(

                              
                              children: <Widget>[
                                new Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text(
                                    'TEAM PLAYERS',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Color(0xFF333333)
                                            .withOpacity(1.0),
                                        fontFamily: 'SourceSansPro'),
                                    ),
                                  ),
                                new Padding(
                                  padding: const EdgeInsets.only(top:10.0),
                                  child: Container(
                                    color: Colors.black87,
                                    width: 250.0,
                                    height: 1.0,
                                    ),
                                  ),
                                ListTile(

                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[0],indexj[0],indexy[0],indexr[0],indexg[0]),
                                ),//palyer card calll
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[1],indexj[1],indexy[1],indexr[1],indexg[1]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[2],indexj[2],indexy[2],indexr[2],indexg[2]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[3],indexj[3],indexy[3],indexr[3],indexg[3]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[4],indexj[4],indexy[4],indexr[4],indexg[4]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[5],indexj[5],indexy[5],indexr[5],indexg[5]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[6],indexj[6],indexy[6],indexr[6],indexg[6]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[7],indexj[7],indexy[7],indexr[7],indexg[7]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[8],indexj[8],indexy[8],indexr[8],indexg[8]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[9],indexj[9],indexy[9],indexr[9],indexg[9]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[10],indexj[10],indexy[10],indexr[10],indexg[10]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[11],indexj[11],indexy[11],indexr[11],indexg[11]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[12],indexj[12],indexy[12],indexr[12],indexg[12]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[13],indexj[13],indexy[13],indexr[13],indexg[13]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[14],indexj[14],indexy[14],indexr[14],indexg[14]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[15],indexj[15],indexy[15],indexr[15],indexg[15]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[16],indexj[16],indexy[16],indexr[16],indexg[16]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[17],indexj[17],indexy[17],indexr[17],indexg[17]),
                                ),
                                ListTile(
                                  leading: Icon(Icons.accessibility),
                                  title: playerscard(context, document1,indexoff[18],indexj[18],indexy[18],indexr[18],indexg[18]),
                                ),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    backgroundColor: Color(0xFF009688),
                    child: Icon(Icons.keyboard_return),
                    onPressed: () => Navigator.pop(context),
                    ),
                  ),
              ],
              );
          },
          ),
        ),
      );
  }
}







//player carddd
playerscard(context, document1,indexoff, indexj, indexy,indexr,indexg) {

  return new InkWell(
    child: new Text(
      document1[indexoff],
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: new TextStyle(
          //fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: Color(0xFF333333).withOpacity(1.0)
          ,fontFamily: 'SourceSansPro'),
    ),
    onTap: () {
      showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return new Container(
                height: 250.0,
                color: Color(0xFFFFEB3B),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: <Widget>[
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height:80.0,
                              child: Image.asset('assets/anon.png')),
                          Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(document1[indexoff],style: TextStyle(fontFamily: 'SourceSansPro',fontSize: 16.0)),
                              )),
                        ]
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(12.0),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Jersey No.'),
                              )
                            ],
                          ),
                          Column(

                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(12.0),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Yellow Cards'),
                              ),
                            ],
                          ),

                        ]
                        ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(12.0),
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
                                          document1[indexg].toString()),
                                      ),
                                    ),
                                  ),
                                ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Goals'),
                            ),

                            ],
                          ),
                          Column(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(12.0),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Red Cards'),
                            ),
                            ],
                          ),

                        ]
                        ),

                  ],
                ),

                );
          });
    },
  );

}
































