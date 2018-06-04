import 'package:flutter/material.dart';


class sponsors extends StatelessWidget {
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
              new Text('Sponsors for ALFC',
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize:32.0,color: Colors.black87.withOpacity(0.5)),),
              new Card(

                  child: new Center(
                    child: new Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Text('List of sponsors with logos',
                        style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 26.0,color: Colors.blueGrey.withOpacity(0.5)),


                      ),
                    ),
                  )),
              //new MyCard(),


            ],

          ),

        ),
      ),

    ),

  );
}


