import 'package:flutter/material.dart';


class organizingteam extends StatelessWidget {
  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar


    //Content of tabs



    body:

    new Container(
      decoration: new BoxDecoration(color: Colors.indigo),
      child:
      Center(
        child: new Container(
          //decoration: new BoxDecoration( color: Color(0xFF005792),),

          child: new Column(

            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text('Organizing Team of ALFC',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize:32.0,color: Colors.black87.withOpacity(0.5)),),
              new Card(

                  child: new Center(
                    child: new Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Text('Aurangabad league football championship is a platform for the players of the region to showcase their raw talent. \n \n'
                          'The ultimate aim of the league is to bring out the talent and polish it to its best.\n \n The important highlight being that this league is being watched over by all the registered referees​ with WIFA.',
                        style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 26.0,color: Colors.blueGrey.withOpacity(0.5)),


                      ),
                    ),
                  )),
              //new MyCard(),
              new Text('\n Team Leader \n',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize:32.0,color: Colors.black87.withOpacity(0.5)),),
              new Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Team Leader',
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 26.0,color: Colors.blueGrey.withOpacity(0.5)),),
                  ),
                ),
              )
            ],

          ),

        ),
      ),

    ),

  );
}


