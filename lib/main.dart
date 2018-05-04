import 'package:flutter/material.dart';
import 'menu_screen.dart';
import 'restaurant_screen.dart';
import 'zoom_scaffold.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Zoom Menu',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'restaurant',
        title: 'Home',
      ),
      new MenuItem(
        id: 'fixtures',
        title: 'Fixtures',
      ),
      new MenuItem(
        id: 'other2',
        title: 'Standings',
      ),

      new MenuItem(
        id: 'return',
        title: 'Return' ,
      ),
    ],
  );

  var selectedMenuItemId = 'restaurant';
  var activeScreen = restaurantScreen;

  @override
  Widget build(BuildContext context) {
    return new ZoomScaffold(
      menuScreen: new MenuScreen(
        menu: menu,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          if (itemId == 'restaurant') {
            setState(() => activeScreen = restaurantScreen);
          } if (itemId == 'fixtures') {
            setState(() => activeScreen = fixtureScreen);
          }
        },
      ),
      contentScreen: activeScreen,
    );
  }
}
