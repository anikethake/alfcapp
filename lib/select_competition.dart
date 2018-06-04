import 'package:flutter/material.dart';



class select_comp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home:new MyCard()
    );
  }
}
class MyCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('My First App'),
          backgroundColor:new Color(0xFF673AB7),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Card(
                      child: Row(
                        children: <Widget>[
                          new Text('ALFC'),
                        ],
                      ),


                    ),
                    new Card(

                    ),
                    new Card(

                    ),





                          ],
                        )
                    )
                  ],
                ),
              ),



        );



  }
}