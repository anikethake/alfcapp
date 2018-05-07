import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_hud/progress_hud.dart';


//void main() => runApp(new MyApp());

class Standing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:'Standings',
      home: new MyStanding(),
    );
  }
}

class MyStanding extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyStanding> {




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF00204A),

        title: new Center(child: new Padding(
          padding: const EdgeInsets.only(left: 2.0,right: 2.0),
          child: new Row(
            children: <Widget>[
              new  Expanded(
                child: new Text('Team',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Color(0xFF00BBF0).withOpacity(1.0)),),

              ),
              new  Expanded(
                child: new Text('W',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Color(0xFF00BBF0).withOpacity(1.0)),),

              ),
              new  Expanded(
                child: new Text('D',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Color(0xFF00BBF0).withOpacity(1.0)),),

              ),
              new  Expanded(
                child: new Text('L',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Color(0xFF00BBF0).withOpacity(1.0)),),

              ),
              new  Expanded(
                child: new Text('GP',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Color(0xFF00BBF0).withOpacity(1.0)),),

              ),

              new Expanded(
                  child: new Text('GF',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Color(0xFF00BBF0).withOpacity(1.0)),
                  )),
              new Expanded(
                  child: new Text('GA',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Color(0xFF00BBF0).withOpacity(1.0)),
                  )),
              new Expanded(
                  child: new Text('PTS',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Color(0xFF00BBF0).withOpacity(1.0)),
                  )),

            ]
          )

        )),
      ),
      body: new TeamList(),

    );
  }
}

class TeamList extends StatefulWidget {
  @override
  _MyTeamListState createState() => new _MyTeamListState();

}




class _MyTeamListState extends State<TeamList>
{
  int W,D,L,pts;
  @override
  void initState() {

    super.initState();

    //Map<String, String> data = <String, String>{
    //  "D": D.toString(),
    //  "PTS": pts.toString(),
   // };

    //Firestore.instance.collection('ALFCstanding').document()
   //     .updateData(data);









  }





  //String pts;

  @override
  Widget build(BuildContext context) {




    return new Container(
      padding: const EdgeInsets.only(right: 4.0 ,left: 4.0),
      decoration: new BoxDecoration( color: Color(0xFF00204A)),
      child:  new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('ALFCstanding').orderBy('W').snapshots,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)




        {
         if (!snapshot.hasData) return  new ProgressHUD(
           backgroundColor: Colors.black12,
           color: Colors.white,
           containerColor: Colors.blue,
           borderRadius: 5.0,
         );


         return new Container(

           child: new ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document)
            {
                  W = document['W']*3 ;
                  D = document['D']*1 ;
                  L = document['L']*0 ;
                  pts= W+D+L;

              return new Padding(
                padding: new EdgeInsets.only(left: 5.0,right:5.0),
                child: new Container(

                child: SizedBox(
                  height: 50.0,

                  child: new Card(
                    child:Container(
                      decoration: new BoxDecoration( color: Color(0xFF005792),),
                      child: Row(
                        children: <Widget>[

                          new  Expanded(
                            child: new Text(document['name'],
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Color(0xFFD9FAFF).withOpacity(1.0)),),

                          ),
                          new  Expanded(
                            child: new Text(document['W'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Color(0xFFD9FAFF).withOpacity(1.0)),),

                          ),
                          new  Expanded(
                            child: new Text(document['D'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Color(0xFFD9FAFF).withOpacity(1.0)),),

                          ),
                          new  Expanded(
                            child: new Text(document['L'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Color(0xFFD9FAFF).withOpacity(1.0)),),

                          ),
                          new  Expanded(
                            child: new Text(document['GP'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Color(0xFFD9FAFF).withOpacity(1.0)),),

                          ),

                          new Expanded(
                            child: new Text(document['GF'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Color(0xFFD9FAFF).withOpacity(1.0)),
                          )),
                          new Expanded(
                              child: new Text(document['GA'].toString(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Color(0xFFD9FAFF).withOpacity(1.0)),
                              )),
                          new Expanded(


                              child: new Text(pts.toString(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Color(0xFF00BBF0).withOpacity(1.0)),
                              )),




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











