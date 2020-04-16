import 'package:animation/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: MySlideshow()),
          Expanded(child: MySlideshow()),
        ]
      ),
    );
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      dotTop: false,
      primaryColor: Colors.red,
      bulletPrimary: 15,
      bulletSecondary: 12,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
      ],
    );
  }
}
