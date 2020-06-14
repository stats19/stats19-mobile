import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//colors
const APP_BACKGROUND_COLOR = Colors.limeAccent;
const Color GENERAL_BUTTON_COLOR = Color.fromRGBO(248, 220, 159, 1.0);//Colors.brown[300];
const Color MENU_BACKGROUND_COLOR = Color.fromRGBO(236, 250, 15, 1.0);
const Color MENU_BACKGROUND_ONPRESS_COLOR = Color.fromRGBO(196, 208, 4,1.0);
const Color APPBAR_BACKROUND_COLOR = Color.fromRGBO(53, 53, 53, 1.0);
const  Color ERROR_COLOR = Color.fromRGBO(255, 0, 0, 1);

// Assets images
const DecorationImage BODY_BACKGROUND_DECORATION_IMAGE = DecorationImage(
    image: AssetImage("images/background.jpg"),
    fit: BoxFit.fill,
  );

//Icons
final Icon CLOSE_ARROW = new Icon(Icons.keyboard_arrow_right);
final Icon OPEN_ARROW = new Icon(Icons.keyboard_arrow_down);
const Icon ICON_ACCOUNT = Icon(Icons.account_circle);
const Icon ICON_EMAIL = Icon(Icons.email);
const Icon ICON_SECURE = Icon(Icons.lock);
