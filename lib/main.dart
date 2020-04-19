import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stats19'),
        ),
        body: Stack(
          children: [
           // Text('Hello the world!',textAlign: TextAlign.center),
            Positioned(
              top: 250,
              left: 120,
              child: Text('Hello the world!'),
            ),
          ],
        ),
      ),
    );
  }
}
