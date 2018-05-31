//import 'package:alfcapp/intro_page_view.dart';
import 'package:alfcapp/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:progress_hud/progress_hud.dart';


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
    //  Firestore.instance.collection('tea').document()
    //      .setData({ 'title': 'Mount Baker', 'type': 'volcano' });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF00204A),

        title: new Center(child: new Padding(
          padding: const EdgeInsets.all(4.0),
          child: new Text("Fixtures",
            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 28.0,color: Color(0xFF42A5F5).withOpacity(1.0)),
          ),

        )),
      ),
      body: new TeamList(),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF00204A),
       child: ButtonBar(
         children: <Widget>[
           //Icon(Icons.schedule),
         ],
       ),

       // child: ,
      ),


    );
  }
}

class TeamList extends StatelessWidget {
  DateTime now = new DateTime.now();


  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration( color: Color(0xFF00204A)),
      child:  new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('ALFCdata').orderBy('matchdate').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {


          if (!snapshot.hasData) return new ProgressHUD(
            backgroundColor: Colors.black12,
            color: Colors.white,
            containerColor: Colors.blue,
            borderRadius: 5.0,
          );


          return new ListView(



            children: snapshot.data.documents.map((DocumentSnapshot document) {
              DateTime now = new DateTime.now();
              DateTime matchdate= document['matchdate'];
              var formatter = new DateFormat('dd-MM-yyyy');
              String formatted;
              if (formatter.format(now) == formatter.format(matchdate))
                {
                  formatted = "Today";

                }
                 else {
                formatted= formatter.format(matchdate);
              }



              return new Padding(
                padding: new EdgeInsets.all(8.0),
                child: SizedBox(

                  height: 155.0,


                  child:  new Card(
                    child:Container(
                      decoration: new BoxDecoration( color: Color(0xFF005792),),

                      child: Row(

                        children: <Widget>[

                          new  Expanded(

                            child: new Text(document['team1'],
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Color(0xFF00BBF0).withOpacity(1.0)),),

                          ),
                          new  Expanded(

                            child: new Text(

                              formatted,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 18.0,color: Color(0xFFD9FAFF).withOpacity(1.0)),),

                          ),

                          new Expanded(child: new Text(document['team2'],
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Color(0xFF00BBF0).withOpacity(1.0)),
                          )),



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
    );
  }

}











