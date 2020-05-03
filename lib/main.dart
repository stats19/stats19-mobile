import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'app_router.dart';

//void main() => runApp(MaterialApp(
//    home:InscriptionForm()));

void main(){
    runApp(MyApp());
}
//TODO : Impl Aunt method valid auhentification without passing by connection page
bool Authentification(){
  return false;
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'router',
      onGenerateRoute: routing,
      initialRoute: Authentification()?NamedRoute.HOME_ROUTE:NamedRoute.CONNECTION_ROUTE,
    );
  }

}