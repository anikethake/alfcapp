import 'package:flutter/material.dart';


class About extends StatelessWidget {
  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar


    //Content of tabs


    
    body:

      new Container(
        color: Color(0xFF240629),
        child:
            Center(
              child: new Padding(
                padding: const EdgeInsets.all (44.0),
                child: new Container(
                  color: Color(0xFFEA6056),

                    child: new Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.all(38.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: new Text('ABOUT A L F C',
                                style: new TextStyle(fontSize:22.0,color: Colors.white.withOpacity(1.0),fontFamily: 'Ubuntu'),),
                            ),
                         // FlatButton.icon(onPressed: null, icon: Icon(Icon.), label: null)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 38.0),
                          child: new Container(
                            color: Color(0xFFEEAA46),

                             child: new Center(
                               child: new Padding(
                                 padding: const EdgeInsets.all(18.0),
                                 child: new Text('Aurangabad league football championship is a platform for the players of the region to showcase their raw talent. \n \n'
                                     'The ultimate aim of the league is to bring out the talent and polish it to its best.\n \n The important highlight being that this league is being watched over by all the registered referees​ with WIFA.',
                          style: new TextStyle(fontSize: 15.0,color: Colors.white,fontFamily: 'Poppins'),



                ),
                               ),
                             )),
                        ),
                      ),




                    ],

          ),

                ),
              ),
            ),

      ),

  );
}


