import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/features/leagues/presentation/pages/leagues_page.dart';

import 'features/authentication/presentation/pages/authentication_page.dart';
import 'views/Inscription_Screen.dart';

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
      return MaterialPageRoute(builder: (context) => AuthenticationPage());

    case NamedRoute.HOME_ROUTE:
      return MaterialPageRoute(builder: (context) => LeaguesPage());
    default:
      return null;
  }
}
