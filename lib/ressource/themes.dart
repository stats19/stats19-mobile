import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//colors
final Color APP_BACKGROUND_COLOR = Colors.limeAccent;
final Color GENERAL_BUTTON_COLOR = Color.fromRGBO(248, 220, 159, 1.0);//Colors.brown[300];
final Color MENU_BACKGROUND_COLOR = Color.fromRGBO(236, 250, 15, 1.0);

// Assets images
final DecorationImage BODY_BACKGROUND_DECORATION_IMAGE = DecorationImage(
    image: AssetImage("images/background.jpg"),
    fit: BoxFit.fill,
  );

//Icons
final Icon CLOSE_ARROW = new Icon(Icons.keyboard_arrow_right);
final Icon OPEN_ARROW = new Icon(Icons.keyboard_arrow_down);