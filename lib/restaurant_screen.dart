import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'intro_page_view.dart';
import 'fixture.dart';

final Screen restaurantScreen = new Screen(
    title: 'ALFC',
    background: new DecorationImage(
      image: new AssetImage('asseRts/wood_bk.jpg'),
      fit: BoxFit.cover,
    ),
    contentBuilder: (BuildContext context) {
      return IntroPageView();
      
    }
);

final Screen fixtureScreen = new Screen(
    title: 'Fixtures',
    background: new DecorationImage(
      image: new AssetImage('asseRts/wood_bk.jpg'),
      fit: BoxFit.cover,
    ),
    contentBuilder: (BuildContext context) {
      return Fixtures();

    }
);




