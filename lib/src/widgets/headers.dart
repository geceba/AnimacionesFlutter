import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(painter: _HeaderDiagonalPainter()),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = new Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = new Path();
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(painter: _HeaderTriangularPainter()),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = new Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = new Path();
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(painter: _HeaderPicoPainter()),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = new Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.50, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(painter: _HeaderCurvoPainter()),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = new Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    //path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(painter: _HeaderWavePainter()),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = new Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    //path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final int color1;
  final int color2;

  IconHeader({@required this.icon, @required this.title, @required this.subtitle, this.color1 = 0xff526bf6,  this.color2 = 0xff67acf2 });

  @override
  Widget build(BuildContext context) {
    final Color colorWhite = Colors.white.withOpacity(0.7);
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(color1: this.color1, color2: this.color2,),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            this.icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(children: <Widget>[
          SizedBox(
            height: 80,
            width: double.infinity,
          ),
          Text(
            this.title,
            style: TextStyle(fontSize: 20, color: colorWhite),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            this.subtitle,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: colorWhite),
          ),
          SizedBox(
            height: 20,
          ),
          FaIcon(
            this.icon,
            size: 80,
            color: Colors.white,
          ),
        ])
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final int color1;
  final int color2;
  
  const _IconHeaderBackground({
    Key key, this.color1, this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          //color: Colors.red,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(this.color1),
                Color(this.color2),
              ])),
    );
  }
}
