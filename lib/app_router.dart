import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/views/Connection_Screen.dart';
import 'package:stat19_app_mobile/views/Inscription_Screen.dart';
import 'package:stat19_app_mobile/views/HomePage_Screen.dart';

class NamedRoute{
  static const String INSCRIPTION_ROUTE = "inscription";
  static const String CONNECTION_ROUTE = "connection";
  static const String HOME_ROUTE = "home";
}

Route<dynamic> routing(RouteSettings settings){
  switch(settings.name){
    case NamedRoute.INSCRIPTION_ROUTE:
      return new MaterialPageRoute(builder: (context) => InscriptionFormScreen());

    case NamedRoute.CONNECTION_ROUTE:
      return MaterialPageRoute(builder: (context) => ConnectionScreen());

    case NamedRoute.HOME_ROUTE:
      return MaterialPageRoute(builder: (context) => MainPage());
    default:
      return null;
  }
}
