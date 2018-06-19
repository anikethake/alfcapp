import 'package:flutter/material.dart';


class About extends StatelessWidget {
  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar


    //Content of tabs


    
    body:

      new Container(
        decoration: new BoxDecoration(color: Color(0xFF240629)),
        child:
            Center(
              child: new Padding(
                padding: const EdgeInsets.all(54.0),
                child: new Container(
                  decoration: new BoxDecoration( color: Color(0xFFEA6056),),

                    child: new Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: new Text('About ALFC',
                          style: new TextStyle(fontWeight: FontWeight.bold,fontSize:22.0,color: Colors.black87.withOpacity(0.5)),),
                      ),
                      new Card(
                        color: Color(0xFFEEAA46),

                         child: new Center(
                           child: new Padding(
                             padding: const EdgeInsets.all(18.0),
                             child: new Text('Aurangabad league football championship is a platform for the players of the region to showcase their raw talent. \n \n'
                                 'The ultimate aim of the league is to bring out the talent and polish it to its best.\n \n The important highlight being that this league is being watched over by all the registered referees​ with WIFA.',
                      style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white,),


                ),
                           ),
                         )),
                      new Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: new Card(),
                      ),



                    ],

          ),

                ),
              ),
            ),

      ),

  );
}


