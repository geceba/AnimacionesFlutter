import 'package:flutter/material.dart';
import 'dart:math' as Math;

class RadialProgress extends StatefulWidget {
  final percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryStroke;
  final double primaryStroke;

  RadialProgress(
      {Key key,
      @required this.percent,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.secondaryStroke = 4,
      this.primaryStroke = 10})
      : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double prevPercent;

  @override
  void initState() {
    prevPercent = widget.percent;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final differenceAnimation = widget.percent - prevPercent;
    prevPercent = widget.percent;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
                painter: _MiRadialProgress(
                    (widget.percent - differenceAnimation) +
                        (differenceAnimation * controller.value),
                    widget.primaryColor,
                    widget.secondaryColor,
                    widget.secondaryStroke,
                    widget.primaryStroke)),
          );
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  final percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryStroke;
  final double primaryStroke;

  _MiRadialProgress(this.percent, this.primaryColor, this.secondaryColor,
      this.secondaryStroke, this.primaryStroke);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = secondaryStroke
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height / 2);
    final double radius = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arc
    final paintArco = new Paint()
      ..strokeWidth = primaryStroke
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * Math.pi * (percent / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -Math.pi / 2, arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
