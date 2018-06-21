import 'package:flutter/material.dart';

class news extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:18.0),
            child: AppBar(
              backgroundColor: Color(0xFFffeb3b),
              title: Container(

                height: 60.0,
                child: Center(
                  child: new Text(
                    'News',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white.withOpacity(1.0),
                        fontFamily: 'Ubuntu'),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: new Text('News 1'),
          ),
        ],
      ),
    );
  }
}
