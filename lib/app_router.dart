import 'package:flutter/material.dart';

import 'features/authentication/presentation/pages/authentication_page.dart';
import 'features/league/presentation/pages/leagues_page.dart';

class NamedRoute{
  static const String CONNECTION_ROUTE = "connection";
  static const String HOME_ROUTE = "home";
}

Route<dynamic> routing(RouteSettings settings){
  switch(settings.name){
    case NamedRoute.CONNECTION_ROUTE:
      return MaterialPageRoute(builder: (context) => AuthenticationPage());

    case NamedRoute.HOME_ROUTE:
      return MaterialPageRoute(builder: (context) => LeaguesPage());
    default:
      return null;
  }
}
