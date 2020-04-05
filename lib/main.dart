//import 'package:animation/src/pages/Animations.dart';
//import 'package:animation/src/pages/Headers.dart';
//import 'package:animation/src/challenge/cuadrado_animado_page.dart';
import 'package:animation/src/pages/GraficasCirculares.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños',
      debugShowCheckedModeBanner: false,
      home: GraficasCircularesPage(),
    );
  }
}