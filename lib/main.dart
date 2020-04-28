import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stat19_app_mobile/principale_screen.dart';

import 'ConnectionScreen.dart';

//void main() => runApp(MaterialApp(
//    home:InscriptionForm()));

void main(){

    if (Authenticaction()){
      //If user is authentified
      runApp(MainPage());
    }else{
      runApp(MaterialApp( home:ConnectionForm()));
    }
}

bool Authenticaction(){
  return false;
}
