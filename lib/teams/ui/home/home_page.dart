import 'package:flutter/material.dart';
import 'teamlistbody.dart';

class teamlist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //appBar: AppBar(new Text('data')),
      body: new Column(
        children: <Widget>[
          
          new teamlistbody(),
        ],
      ),
    );
  }
}

