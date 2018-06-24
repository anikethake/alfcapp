import 'package:alfcapp/about.dart';
import 'package:alfcapp/main.dart';
import 'package:alfcapp/organizing.dart';
import 'package:alfcapp/sponsors.dart';
import 'package:flutter/material.dart';
import 'intro_page_view.dart';
import 'package:url_launcher/url_launcher.dart';

class TwoPanels extends StatefulWidget {
  final AnimationController controller;

  TwoPanels({this.controller});

  @override
  _TwoPanelsState createState() => new _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> {
  static const header_height = 32.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPanelHeight = height ;
    final frontPanelHeight = -header_height;

    return new RelativeRectTween(
            begin: new RelativeRect.fromLTRB(
                0.0, backPanelHeight, 0.0, frontPanelHeight),
            end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(new CurvedAnimation(
            parent: widget.controller, curve: Curves.linear));
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    //final ThemeData theme = Theme.of(context);

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            color: Color(0xFFCDDC39),
            child: new Center(
                child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: new ListTile(
                    title: new Center(child: new Text('About',style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans',fontSize:20.0),)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new About()));
                    },
                  ),
                ),
                new Container(width: 250.0,height: 1.0,color: Colors.black87,),
                new Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: new ListTile(
                    title: new Center(child: new Text('Organizer\'s team',style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans',fontSize:20.0),)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new organizingteam()));
                    },
                  ),
                ),
                new Container(width: 250.0,height: 1.0,color: Colors.black87,),
                new Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: new ListTile(
                    title: new Center(child: new Text('Our Sponsors',style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans',fontSize:20.0),)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new sponsors()));
                    },
                  ),
                ),

                new Container(width: 250.0,height: 1.0,color: Colors.black87,),
                new Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: new ListTile(
                    title: new Center(child: new Text('Social Media',style: TextStyle(color: Colors.white,fontFamily: 'JosefinSans',fontSize:20.0),)),
                    onTap: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return new Container(
                                child: new Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        new Expanded(
                                          child: InkWell(
                                              child: new Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: new SizedBox(
                                                  height: 45.0,
                                                  width: 45.0,
                                                  child: new Image.network(
                                                      'http://icons.iconarchive.com/icons/blackvariant/button-ui-requests-14/512/Instagram-icon.png'),
                                                ),
                                              ),
                                              onTap: () => launch(
                                                  'https://www.instagram.com/alfc.2k18',
                                                  forceWebView: false)),
                                        ),
                                        new Expanded(
                                          child: InkWell(
                                              child: new Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new SizedBox(
                                                  height: 45.0,
                                                  width: 45.0,
                                                  child: new Image.network(
                                                      'http://www.stickpng.com/assets/images/58e91965eb97430e819064f5.png'),
                                                ),
                                              ),
                                              onTap: () => launch(
                                                  'https://www.facebook.com/ALFC2k18-Aurangabad-League-Football-Championship-2048301502105701',
                                                  forceWebView: false)),
                                        ),
                                        new Expanded(

                                          child: InkWell(
                                              child: new Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new SizedBox(
                                                  height: 45.0,
                                                  width: 45.0,
                                                  child: new Image.network(
                                                      'http://files.softicons.com/download/android-icons/flat-circles-icon-pack-by-vincent-winberg/png/500x500/Twitter.png'),
                                                ),
                                              ),
                                              onTap: () => launch(
                                                  'https://twitter.com/adlfc2k18',
                                                  forceWebView: false)),
                                        ),
                                      ],
                                    )));
                          });
                    },
                  ),
                ),
                new Container(width: 250.0,height: 1.0,color: Colors.black87,),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: FloatingActionButton(
                  backgroundColor: Color(0xFF2F0536),
                  child: Icon(Icons.keyboard_return),
                  onPressed:()=> Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new BackdropPage()))
                 // onPressed: () => Navigator.pop(context,constraints),

                ),
              )
              ],
            )),
          ),
          new PositionedTransition(
            rect: getPanelAnimation(constraints),
            child: new Material(
              elevation: 12.0,
              borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(00.0),
                  topRight: new Radius.circular(00.0)),
              child: new Column(
                children: <Widget>[
//                  new Container(
//                    color: new Color(0xFF00204A),
//                    height: header_height,
//                    child: new Center(
//                      child: new Text(
//                        "Home",
//                        style: new TextStyle(fontSize: 22.0),
//                      ),
//                    ),
//                  ),
                  new Expanded(
                    child: new IntroPageView(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(
      builder: bothPanels,
    );
  }
}
