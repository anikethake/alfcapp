import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'page_data.dart';
import 'page_transformer.dart';

class IntroPageItem extends StatelessWidget {
  IntroPageItem({
    @required this.item,
    @required this.pageVisibility,
  });

  final IntroItem item;
  final PageVisibility pageVisibility;

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return new Opacity(
      opacity: pageVisibility.visibleFraction,
      child: new Transform(
        alignment: FractionalOffset.topLeft,
        transform: new Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildTextContainer(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final categoryText = _applyTextEffects(
      translationFactor: 300.0,
      child: new Text(
        item.category,
        style: textTheme.caption.copyWith(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          fontSize: 34.0,
        ),
        textAlign: TextAlign.center,
      ),
    );

    final titleText = _applyTextEffects(
      translationFactor: 200.0,
      child: new Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: new Text(
          item.title,
          style: textTheme.title
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return new Positioned(
      bottom: 56.0,
      left: 32.0,
      right: 32.0,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          categoryText,
          //titleText,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = new Image.asset(
      item.imageUrl,
      fit: BoxFit.cover,
      alignment: new FractionalOffset(
        0.5 + (pageVisibility.pagePosition / 3),
        0.5,
      ),
    );



    return new Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: new Material(


        elevation: 4.0,
        borderRadius: new BorderRadius.circular(8.0),
        child: new Stack(
          fit: StackFit.expand,
          children: [
            image,

            _buildTextContainer(context),
          ],
        ),
      ),
    );
  }
}
