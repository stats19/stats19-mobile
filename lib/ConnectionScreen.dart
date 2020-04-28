
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/AppBar_components.dart';
import 'package:stat19_app_mobile/InscriptionScreen.dart';
import 'package:stat19_app_mobile/principale_screen.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';

import 'models/user.dart';
import 'ressource/themes.dart';

class ConnectionForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ConnectionFormState();
  }
}

class ConnectionFormState extends State<ConnectionForm>{
  User _user = new User();

  final _formKey = GlobalKey<FormState>();
  Widget _username_widget(){
    return TextFormField(
      decoration: InputDecoration(labelText: "username"),
      validator: (String value){
        if(value.isEmpty) return "Your username is required!";
        return null;
      },
      onSaved: (String value){
        _user.username = value;
      },
    );
  }
  
  Widget _password_widget(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"), obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (String value){
        if(value.isEmpty) return "Your password is required!";
        return null;
      },
      onSaved: (String value){
        _user.password = value;
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new Stat19SimpleAppBar(titleName: "Se connecter"),
        body:
        Container(
          decoration: BoxDecoration(
            image: BODY_BACKGROUND_DECORATION_IMAGE,
          ),
          child: Container(
              margin: EdgeInsets.all(40),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: RaisedButton(
                          child: Text("Pas de compte? S'inscrire",
                              style: TextStyle(decoration: TextDecoration.underline, color: GENERAL_BUTTON_COLOR),
                          ),
                          color: Colors.transparent,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => (MaterialApp( home:InscriptionForm()))));
                          }
                      ),
                    ),
                    _username_widget(),
                    _password_widget(),
                    SizedBox(height: 100),
                    RaisedButton(
                      child: Text("Submit"),
                      color: GENERAL_BUTTON_COLOR,
                      onPressed: (){
                        if(!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        print("username: " + _user.username);
                        print("pswd: " + _user.password);
                        /**
                         * //TODO : get user with paswd == pswdDB and username == usernameDB using  Authentificacation
                         * redirect to another main page (Done) And TODO : valid auhentification without passing by connection page
                         */
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                       //TODO : find a way to clear Input after validation ( _formKey.currentState.reset();)

                      },
                    )
                  ]),
                ),
              ),
          )
    );
  }
}