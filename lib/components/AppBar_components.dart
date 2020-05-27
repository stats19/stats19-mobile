import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';

class Stat19SpecifiqueAppBar extends AppBar{
  Stat19SpecifiqueAppBar({Key key, String titleName, BuildContext context})
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
      leading: Builder(
        builder: (_){
          return IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context),
            );
          }
      ),
      backgroundColor: APPBAR_BACKROUND_COLOR,
      bottomOpacity: 0.345,
      toolbarOpacity: 1.0,
      );
}

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
    backgroundColor: APPBAR_BACKROUND_COLOR,
    bottomOpacity: 0.345,
    toolbarOpacity: 1.0,
  );
}