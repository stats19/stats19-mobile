import 'package:flutter/material.dart';

class InfoSquare extends StatelessWidget {
  final int value;
  final String type;

  const InfoSquare({this.type, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color:  Colors.blueGrey[700], width: 0.7),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
//              spreadRadius: 5,
              blurRadius: 6,
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
                      style: TextStyle(color: Colors.white, fontSize: 13)),
                  alignment: Alignment.topLeft,
                ),
                Expanded(
                  child: Align(
                    child: Text(value.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 23)),
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