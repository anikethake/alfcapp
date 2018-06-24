import 'package:alfcapp/main.dart';
import 'package:flutter/material.dart';


class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Color(0xFF2F0536),
        child: new ListView(
          children: <Widget>[
            AppBar(
                title: Text('Select Competition'),
                backgroundColor: Color(0xFF781336),
                leading: Icon(Icons.error)),

            new Container(
              // decoration: new BoxDecoration( color: Color(0xFF005792),),
              child: new Column(
                children: <Widget>[
                  new InkWell(
                      child: new SizedBox(
                        height: 120.0,
                        child: new Card(
                          color: Color(0xFFEA6056),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: new Image.asset('assets/logo.png'),
                                ),
                              new Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  'Aurangabad League \n Football Championship',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 17.0,
                                      color: Colors.white.withOpacity(1.0)),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new BackdropPage()),
                          );
                      }),
                ],
                ),
              ),
            new Center(
              child: new Column(
                children: <Widget>[
                  new InkWell(
                      child: new SizedBox(
                        height: 120.0,
                        child: new Card(
                          color: Color(0xFFEEAA46),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                  new Image.asset('assets/logo_blah.png'),
                                  ),
                                ),
                              new Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Text(
                                  'Aurangabad\'s 5 on 5',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 17.0,
                                      color: Colors.white.withOpacity(1.0)),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return new Container(
                                  child: new Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: new Text('Coming Soon...',
                                                          textAlign: TextAlign.center,
                                                          style: new TextStyle(
                                                              color:
                                                              Theme.of(context).accentColor,
                                                              fontSize: 24.0))));
                            });
                      }),
                ],
                ),
              ),
            new Column(
              children: <Widget>[
                new InkWell(
                    child: new SizedBox(
                      height: 120.0,
                      child: new Card(
                        color: Color(0xFF4ED0C4),
                        child: Row(
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: new Image.asset('assets/logo_blah.png'),
                                ),
                              ),
                            new Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: new Text(
                                '11-a side\nknock-out\ntournament',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                    fontSize: 17.0,
                                    color: Colors.white.withOpacity(1.0)),
                                ),
                              ),
                          ],
                          ),
                        ),
                      ),
                    onTap: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return new Container(
                                child: new Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: new Text('Coming Soon..',
                                                        textAlign: TextAlign.center,
                                                        style: new TextStyle(
                                                            color:
                                                            Theme.of(context).accentColor,
                                                            fontSize: 24.0))));
                          });
                    }),
              ],
              ),
            new Center(
              child: new Column(
                children: <Widget>[
                  new InkWell(
                      child: new SizedBox(
                        height: 120.0,
                        child: new Card(
                          color: Color(0xFF795548),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                  new Image.asset('assets/logo_blah.png'),
                                  ),
                                ),
                              new Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Text(
                                  'Coming Soon',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 17.0,
                                      color: Colors.white.withOpacity(1.0)),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return new Container(
                                  child: new Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: new Text('Coming Soon...',
                                                          textAlign: TextAlign.center,
                                                          style: new TextStyle(
                                                              color:
                                                              Theme.of(context).accentColor,
                                                              fontSize: 24.0))));
                            });
                      }),
                ],
                ),
              ),
            new Center(
              child: new Column(
                children: <Widget>[
                  new InkWell(
                      child: new SizedBox(
                        height: 120.0,
                        child: new Card(
                          color: Color(0xFF20113A),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                  new Image.asset('assets/logo_blah.png'),
                                  ),
                                ),
                              new Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Text(
                                  'Coming Soon',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 17.0,
                                      color: Colors.white.withOpacity(1.0)),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return new Container(
                                  child: new Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: new Text('Coming Soon...',
                                                          textAlign: TextAlign.center,
                                                          style: new TextStyle(
                                                              color:
                                                              Theme.of(context).accentColor,
                                                              fontSize: 24.0))));
                            });
                      }),
                ],
                ),
              ),
            new Center(
              child: new Column(
                children: <Widget>[
                  new InkWell(
                      child: new SizedBox(
                        height: 120.0,
                        child: new Card(
                          color: Color(0xFF240629),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(22.0),
                                child: new Image.asset('assets/logo_blah.png'),
                                ),
                              new Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Text(
                                  'Coming Soon',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 17.0,
                                      color: Colors.white.withOpacity(1.0)),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return new Container(
                                  child: new Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: new Text('Coming Soon...',
                                                          textAlign: TextAlign.center,
                                                          style: new TextStyle(
                                                              color:
                                                              Theme.of(context).accentColor,
                                                              fontSize: 24.0))));
                            });
                      }),
                ],
                ),
              ),



          ],
          ),
        ),
      );
  }
}