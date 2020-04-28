import 'package:flutter/material.dart';

class Stat19SimpleAppBar extends AppBar{
  Stat19SimpleAppBar({Key key, String titleName})
      :super(key:key,
      title: Center(
        child: Text(titleName, textAlign: TextAlign.center,
          style: const TextStyle(
          color:  const Color(0xffffffff),
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto",
          fontStyle:  FontStyle.normal,
          fontSize: 19.0),
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.2),
      bottomOpacity: 0.345,
      toolbarOpacity: 1.0,
      );
}