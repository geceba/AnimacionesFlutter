import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double bulletPrimary;
  final double bulletSecondary;

  Slideshow(
      {@required this.slides,
      this.dotTop = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.bulletPrimary = 12.0,
      this.bulletSecondary = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor =
                  this.primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor =
                  this.secondaryColor;

              Provider.of<_SlideshowModel>(context).bulletPrimary =
                  this.bulletPrimary;
              Provider.of<_SlideshowModel>(context).bulletSecondary =
                  this.bulletSecondary;

              return _CreateSlideshow(dotTop: dotTop, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CreateSlideshow extends StatelessWidget {
  const _CreateSlideshow({
    Key key,
    @required this.dotTop,
    @required this.slides,
  }) : super(key: key);

  final bool dotTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.dotTop) _Dots(this.slides.length),
        Expanded(child: _Slides(this.slides)),
        if (!this.dotTop) _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(this.totalSlides, (i) => _Dot(i))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    double tam;
    Color color;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      tam = ssModel.bulletPrimary;
      color = ssModel.primaryColor;
    } else {
      tam = ssModel.bulletSecondary;
      color = ssModel.secondaryColor;
    }

    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: tam,
        height: tam,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle));
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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  double _bulletPrimary = 12;
  double _bulletSecondary = 12;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color color) {
    this._primaryColor = color; 
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color color) {
    this._secondaryColor = color; 
  }

  double get bulletPrimary => this._bulletPrimary;

  set bulletPrimary(double bulletPrimary) {
    this._bulletPrimary = bulletPrimary;
  }

  double get bulletSecondary => this._bulletSecondary;

  set bulletSecondary(double bulletSecondary) {
    this._bulletSecondary = bulletSecondary;
  }
}
