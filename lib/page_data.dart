class IntroItem {
  IntroItem({
    this.sr,
    this.title,
    this.category,
    this.imageUrl,

  });
  final String sr;
  final String title;
  final String category;
  final String imageUrl;

}

final sampleItems = <IntroItem>[
  new IntroItem(sr:'1',title: 'The schedule of the event', category: 'FIXTURES', imageUrl: 'assets/pic-01.png', ),
  new IntroItem(sr:'2',title: 'Score board', category: 'STANDING', imageUrl: 'assets/pic-03.png',),
  new IntroItem(sr:'3;',title: 'Info about teams in ALFC.', category: 'TEAMS', imageUrl: 'assets/pic-02.png',),
  new IntroItem(sr:'4;',title: 'News related to ALFC.', category: 'NEWS', imageUrl: 'assets/pic-03.png',),
];