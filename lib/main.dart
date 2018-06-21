import 'dart:async';

import 'package:alfcapp/teams/team_detailpage.dart';
import 'package:flutter/material.dart';
//import 'home_page.dart';
import 'twopanels.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(primarySwatch: Colors.teal),
    home: new select_comp(),
  ));
}

class BackdropPage extends StatefulWidget {
  @override
  _BackdropPageState createState() => new _BackdropPageState();
}

class _BackdropPageState extends State<BackdropPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor:Color(0xFF240629),

      body: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: new SafeArea(
              child: new AppBar(
                title: new SafeArea(child: new Container(child: new Text("A L F C",style:TextStyle(fontFamily: "Open Sans Condensed",fontSize: 32.0),))),
                backgroundColor: Color(0xFF781336),
                elevation: 0.0,
                leading: new IconButton(
                  onPressed: () {
                    controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
                  },
                  icon: new AnimatedIcon(
                    icon: AnimatedIcons.close_menu,
                    progress: controller.view,
                    ),
                  ),
                actions: <Widget>[
                  IconButton(
                    icon:new Icon(Icons.notifications),
                    onPressed: (){
                     // null
                    },
                  )
                ],
                ),
            ),
          ),

          new Expanded(
            child: new TwoPanels(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}

class select_comp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new MyCard());
  }
}

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
            ),

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
                          color:  Color(0xFFEEAA46),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: new Image.asset('assets/logo_blah.png'),
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
                              padding: const EdgeInsets.all(2.0),
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
                          color:  Color(0xFF795548),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: new Image.asset('assets/logo_blah.png'),
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
                          color:  Color(0xFF20113A),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: new Image.asset('assets/logo_blah.png'),
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
                          color:  Color(0xFF240629),
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(2.0),
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

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new BackdropPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('assets/splashcreen.png'),
      ),
    );
  }
}
