import 'dart:async';

import 'package:alfcapp/teams/team_detailpage.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
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
      appBar: new AppBar(
        title: new Center(child: new Text("ALFC")),
        backgroundColor: Color(0xFF005792),
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
      ),
      body: new TwoPanels(
        controller: controller,
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
      appBar: new AppBar(
        title: new Center(
          child: new Text(
            'Select Competition',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
                color: Colors.white.withOpacity(1.0)),
          ),
        ),
        backgroundColor: new Color(0xFF005792),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF00204A),
        child: ButtonBar(
          children: <Widget>[
            //Icon(Icons.schedule),
          ],
        ),

        // child: ,
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Container(
              // decoration: new BoxDecoration( color: Color(0xFF005792),),
              child: new Column(
                children: <Widget>[
                  new InkWell(
                      child: new SizedBox(
                        height: 220.0,
                        child: new Card(
                          color: Colors.lightGreen,
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: new Image.asset('assets/logo.png'),
                              ),
                              new Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  'Aurangabad \n League \n Football \n Championship',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                      color: Colors.white.withOpacity(0.7)),
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
                              builder: (context) => new SplashScreen()),
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
                        height: 220.0,
                        child: new Card(
                          color: Colors.green,
                          child: Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Image.asset('assets/otherlogo.png'),
                              ),
                              new Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Text(
                                  'Aurangabad\'s\n5 on 5',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                      color: Colors.white.withOpacity(0.7)),
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
                      height: 220.0,
                      child: new Card(
                        color: Colors.lightGreen,
                        child: Row(
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: new Image.asset('assets/otherlogo.png'),
                            ),
                            new Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: new Text(
                                '11-a side\nknock-out\ntournament',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                    color: Colors.white.withOpacity(0.7)),
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
