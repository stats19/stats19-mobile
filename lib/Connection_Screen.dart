
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/components/AppBar_components.dart';
import 'package:stat19_app_mobile/Inscription_Screen.dart';
import 'package:stat19_app_mobile/home_screen.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';

import 'models/user-model.dart';
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
      decoration: InputDecoration(labelText: "username", icon: Icon(Icons.account_circle),focusColor: Colors.black),
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
      decoration: InputDecoration(labelText: "Password",icon: Icon(Icons.lock)), obscureText: true,
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
              padding: EdgeInsets.fromLTRB(40, 18, 40, 18),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                          child: Text("Pas de compte? S'inscrire",
                              style: TextStyle(decoration: TextDecoration.underline, color: GENERAL_BUTTON_COLOR),
                          ),
                          color: Colors.transparent,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => (MaterialApp( home:InscriptionForm()))));
                          }
                      ),
                    ),
                    SizedBox(height: 30),
                    _username_widget(),
                    _password_widget(),
                    SizedBox(height: 75),
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
                         * TODO : get user with paswd == pswdDB and username == usernameDB using  Authentificacation
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