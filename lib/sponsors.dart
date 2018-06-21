import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class sponsors extends StatelessWidget {
  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar


    //Content of tabs



    body:

    new Container(
      color: Color(0xFF240629),
      child:
      Center(
        child: new Container(
          //decoration: new BoxDecoration( color: Color(0xFF005792),),


          child: new Column(

            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: AppBar(
                    backgroundColor:Color(0xFF781336),
                    title: Container(
                      height: 60.0,

                      child: Center(
                        child: new Text('OUR  SPONSORS',
                          style: new TextStyle(fontWeight: FontWeight.bold,fontSize:25.0,color: Colors.white.withOpacity(1.0),fontFamily: 'Ubuntu'),),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150.0,
                  child: new Container(
                    width: 120.0,
                    decoration: new BoxDecoration(
                      color: Color(0xFF1dd1e8),
                      shape: BoxShape.circle,
                      border: new Border.all(
                        color: Colors.blue,
                        width: 10.0,
                        ),

                      ),
                    child: new Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new Image.asset('assets/deluxe.png'),
                      ),
                      ),
                    ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: new Container(
                                height: 130.0,
                                width: 180.0,
                                child: new Center(
                                  child: new Image.asset('assets/ultimate.jpg'),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Container(
                                height: 70.0,
                                width: 70.0,

                                child: new Center(
                                  child: new Image.asset('assets/bag.png'),
                                  ),
                                ),
                              ),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Container(
                                height: 70.0,
                                width: 70.0,
                                child: new Center(
                                  child: new Image.asset('assets/ayyan_logo.png'),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Container(
                                height: 120.0,
                                width: 120.0,
                                child: new Center(
                                  child: new Image.asset('assets/ACHEIVER.jpg'),
                                  ),
                                ),
                              ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Container(
                                height: 70.0,
                                width: 70.0,
                                child: new Center(
                                  child: new Image.asset('assets/modern.png'),
                                  ),
                                ),
                              ),
                          ],

                          ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Container(
                                height: 70.0,
                                width: 70.0,
                                child: new Center(
                                  child: new Image.asset('assets/aloft.jpg'),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Container(
                                height: 70.0,
                                width: 70.0,
                                child: new Center(
                                  child: new Image.asset('assets/ms.jpg'),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Container(
                                height: 70.0,
                                width: 70.0,
                                child: new Center(
                                  child: new Image.asset('assets/malik.jpg'),
                                  ),
                                ),
                              ),

                          ],
                          ),
                      ),

                    ],
                  ),
                ),
              ),


            ],

          ),

        ),
      ),

    ),

  );
}

