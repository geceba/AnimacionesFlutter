import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  CircularProgressPage({Key key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double percent = 0.0;
  double newPercent = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));
    controller.addListener(() {
      setState(() {
        percent = lerpDouble(percent, newPercent, controller.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.pink,
          onPressed: () {
            percent = newPercent;
            newPercent += 10;
            if (newPercent > 100) {
              newPercent = 0;
              percent = 0;
            }

            controller.forward(from: 0.0);

            setState(() {});
          },
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(5),
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: _MiRadialProgress(percent),
            ),
          ),
        ));
  }
}

class _MiRadialProgress extends CustomPainter {
  final percent;
  _MiRadialProgress(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height / 2);
    final double radius = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arc
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * Math.pi * (percent / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -Math.pi / 2, arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
