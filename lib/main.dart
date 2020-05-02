import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stat19_app_mobile/home_screen.dart';

import 'Connection_Screen.dart';

//void main() => runApp(MaterialApp(
//    home:InscriptionForm()));

void main(){
    //TODO : valid auhentification without passing by connection page
    if (Authenticaction()){
      runApp(MainPage());
    }else{
      runApp(MaterialApp( home:ConnectionForm()));
    }
}

bool Authenticaction(){
  return false;
}
