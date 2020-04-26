import 'package:animate_do/animate_do.dart';
import 'package:animation/src/widgets/boton_gordo.dart';
import 'package:animation/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final int color1;
  final int color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(
          FontAwesomeIcons.carCrash, 'Motor Accident', 0xff6989F5, 0xff906EF5),
      new ItemBoton(
          FontAwesomeIcons.plus, 'Medical Emergency', 0xff66A9F2, 0xff536CF6),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          0xffF2D572, 0xffE06AA3),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', 0xff317183, 0xff46997D),
      new ItemBoton(
          FontAwesomeIcons.carCrash, 'Motor Accident', 0xff6989F5, 0xff906EF5),
      new ItemBoton(
          FontAwesomeIcons.plus, 'Medical Emergency', 0xff66A9F2, 0xff536CF6),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          0xffF2D572, 0xffE06AA3),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', 0xff317183, 0xff46997D),
      new ItemBoton(
          FontAwesomeIcons.carCrash, 'Motor Accident', 0xff6989F5, 0xff906EF5),
      new ItemBoton(
          FontAwesomeIcons.plus, 'Medical Emergency', 0xff66A9F2, 0xff536CF6),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          0xffF2D572, 0xffE06AA3),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', 0xff317183, 0xff46997D),
    ];

    List<Widget> itemsMap = items
        .map((item) => FadeInLeft(
              duration: Duration(milliseconds: 250),
              child: BotonGordo(
                icon: item.icon,
                text: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: () {},
              ),
            ))
        .toList();
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 200),
            child:
                ListView(physics: BouncingScrollPhysics(), children: <Widget>[
              SizedBox(
                height: 80,
              ),
              ...itemsMap
            ])),
        _Encabezado()
      ],
    ));
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia medica',
          subtitle: 'Haz solicitado',
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Asistencia Medica',
      subtitle: 'Haz solcitado',
    );
  }
}
