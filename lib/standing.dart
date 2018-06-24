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

      body:

      new Container(
        color: Color(0xFF009688),
        child: new Column(
          children: <Widget>[
            new SafeArea(
              child: new AppBar(
                backgroundColor: Color(0xFFCDDC39),

                title: new Center(child: new Padding(
                    padding: const EdgeInsets.only(left: 2.0,right: 2.0),
                    child: new Row(
                        children: <Widget>[
                          new  Expanded(
                            child: new Text('Team',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white.withOpacity(1.0)),),

                            ),
                          new  Expanded(
                            child: new Text('MP',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white.withOpacity(1.0)),),

                            ),
                          new  Expanded(
                            child: new Text('D',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white.withOpacity(1.0)),),

                            ),
                          new  Expanded(
                            child: new Text('L',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white.withOpacity(1.0)),),

                            ),
                          new  Expanded(
                            child: new Text('W',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white.withOpacity(1.0)),),

                            ),

                          new Expanded(
                              child: new Text('GD',
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white.withOpacity(1.0)),
                                              )),

                          new Expanded(
                              child: new Text('PTS',
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.white.withOpacity(1.0)),
                                              )),

                        ]
                        )

                    )),
                ),
            ),
            new Expanded(child: new TeamList()),
          ],
        ),
      ),

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




    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Pool A',style: TextStyle(fontSize: 22.0),),
        ),
        SizedBox(
          height: 200.0,
          child: new Container(
            padding: const EdgeInsets.only(right: 4.0 ,left: 4.0),
            decoration: new BoxDecoration( color: Color(0xFF009688)),
            child:  new StreamBuilder<QuerySnapshot>(
              stream : Firestore.instance.collection('ALFCstanding').where('pool', isEqualTo: 'a').snapshots(),
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
                     return new Padding(
                      padding: new EdgeInsets.only(left: 5.0,right:5.0),
                      child: Row(
                        children: <Widget>[

                          new  Expanded(
                            child: new Text(document['name'],
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),),

                          ),
                          new  Expanded(
                            child: new Text(document['MP'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),),

                          ),
                          new  Expanded(
                            child: new Text(document['D'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),),

                          ),
                          new  Expanded(
                            child: new Text(document['L'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),),

                          ),
                          new  Expanded(
                            child: new Text(document['W'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),),

                          ),

                          new Expanded(
                            child: new Text(document['GD'].toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),
                          )),

                          new Expanded(


                              child: new Text(document['PTS'].toString(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),
                              )),




                        ],
                      ),
                    );
                  }).toList(),

                ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Pool B',style: TextStyle(fontSize: 22.0),),
          ),
        SizedBox(
          height: 200.0,
          child: new Container(
            padding: const EdgeInsets.only(right: 4.0 ,left: 4.0),
            decoration: new BoxDecoration( color: Color(0xFF009688)),
            child:  new StreamBuilder<QuerySnapshot>(
              stream : Firestore.instance.collection('ALFCstanding').where('pool',isEqualTo: 'b').snapshots(),
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
                                                            return new Padding(
                                                              padding: new EdgeInsets.only(left: 5.0,right:5.0),
                                                              child: Row(
                                                                children: <Widget>[

                                                                  new  Expanded(
                                                                    child: new Text(document['name'],
                                                                                      textAlign: TextAlign.center,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),),

                                                                    ),
                                                                  new  Expanded(
                                                                    child: new Text(document['MP'].toString(),
                                                                                      textAlign: TextAlign.center,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),),

                                                                    ),
                                                                  new  Expanded(
                                                                    child: new Text(document['D'].toString(),
                                                                                      textAlign: TextAlign.center,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),),

                                                                    ),
                                                                  new  Expanded(
                                                                    child: new Text(document['L'].toString(),
                                                                                      textAlign: TextAlign.center,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),),

                                                                    ),
                                                                  new  Expanded(
                                                                    child: new Text(document['W'].toString(),
                                                                                      textAlign: TextAlign.center,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),),

                                                                    ),

                                                                  new Expanded(
                                                                      child: new Text(document['GD'].toString(),
                                                                                        textAlign: TextAlign.center,
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),
                                                                                      )),

                                                                  new Expanded(


                                                                      child: new Text(document['PTS'].toString(),
                                                                                        textAlign: TextAlign.center,
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.white.withOpacity(1.0)),
                                                                                      )),




                                                                ],
                                                                ),
                                                              );
                                                          }).toList(),

                    ),
                  );
              },
              ),
            ),
        )
      ],
    );
  }

}











