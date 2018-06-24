import 'dart:async';

import 'package:alfcapp/select_comp.dart';
import 'package:alfcapp/teams/team_detailpage.dart';
import 'package:flutter/material.dart';
//import 'home_page.dart';
import 'twopanels.dart';
import 'package:flutter/services.dart';

void main() {
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(new MaterialApp(
   // debugShowCheckedModeBanner: false,
    // theme: new ThemeData(primarySwatch: Colors.teal),
    home: new MyCard(),
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
      backgroundColor: Color(0xFF240629),
      body: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: new SafeArea(
              child: new AppBar(
                title: new SafeArea(
                    child: new Container(
                        child: new Text(
                  "A L F C",
                  style: TextStyle(
                      fontFamily: "Open Sans Condensed", fontSize: 32.0),
                ))),
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
                    icon: new Icon(Icons.notifications),
                    onPressed: () {
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
        Container(
          color: Color(0xFF781336),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('ALFC in Assosciation with Deluxe food products',
                            style: TextStyle(fontSize: 8.0),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Container(
                    height: 20.0,
                    child: Image.asset('assets/deluxe.png')),
              )
            ],
          ),
        ),
        ],
      ),
    );
  }
}

//class select_comp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(home: new MyCard());
//  }
//}



//class SplashScreen extends StatefulWidget {
//  @override
//  _SplashScreenState createState() => new _SplashScreenState();
//}
//
//class _SplashScreenState extends State<SplashScreen> {
//  startTime() async {
//    var _duration = new Duration(seconds: 2);
//    return new Timer(_duration, navigationPage);
//  }
//
//  void navigationPage() {
//    Navigator.push(
//      context,
//      new MaterialPageRoute(builder: (context) => new BackdropPage()),
//    );
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    startTime();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new Center(
//        child: new Image.asset('assets/splashcreen.png'),
//      ),
//    );
//  }
//}
