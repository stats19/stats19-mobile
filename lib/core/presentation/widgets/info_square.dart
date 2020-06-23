import 'package:flutter/material.dart';

class InfoSquare extends StatelessWidget {
  final int value;
  final String type;

  const InfoSquare({this.type, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
          color: Colors.blueGrey,
        ),
        height: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Align(
                  child: Text(type,
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  alignment: Alignment.topLeft,
                ),
                Expanded(
                  child: Align(
                    child: Text(value.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    alignment: Alignment.bottomRight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}