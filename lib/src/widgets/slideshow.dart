import 'package:animation/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotTop;
  final Color primaryColor;
  final Color secondaryColor;

  Slideshow(
      {@required this.slides,
      this.dotTop = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              if (this.dotTop)
                _Dots(
                    this.slides.length, this.primaryColor, this.secondaryColor),
              Expanded(child: _Slides(this.slides)),
              if (!this.dotTop)
                _Dots(
                    this.slides.length, this.primaryColor, this.secondaryColor),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color primaryColor;
  final Color secondaryColor;

  _Dots(this.totalSlides, this.primaryColor, this.secondaryColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(this.totalSlides,
              (i) => _Dot(i, this.primaryColor, this.secondaryColor))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color primaryColor;
  final Color secondaryColor;

  _Dot(this.index, this.primaryColor, this.secondaryColor);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 12,
        height: 12,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
                ? this.primaryColor
                : this.secondaryColor,
            shape: BoxShape.circle));
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      controller: pageViewController,
      // children: <Widget>[
      //   _Slide('assets/svgs/slide-1.svg'),
      //   _Slide('assets/svgs/slide-2.svg'),
      //   _Slide('assets/svgs/slide-3.svg'),
      // ],
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    ));
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}
