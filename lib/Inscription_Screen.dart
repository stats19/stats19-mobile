
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';
import 'components/AppBar_components.dart';
import 'models/user-model.dart';
import 'ressource/themes.dart';
import 'ressource/values.dart';

class InscriptionFormScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return InscriptionFormState();
  }
}

class InscriptionFormState extends State<InscriptionFormScreen>{
  User _new_user = new User();

  final _formKey = GlobalKey<FormState>();

  Widget _username_widget(){
    return TextFormField(
      decoration: InputDecoration(labelText: "username", icon: ICON_EMAIL),
      validator: (String value){
        if(value.isEmpty) return "Your username is required!";
        if(value.length < 3 ) return "Your username is short";
        return null;
      },
      onSaved: (String value){
        _new_user.username = value;
      },
    );
  }
  Widget _email_widget(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Email", icon: ICON_EMAIL),
      validator: (String value){
        if(value.isEmpty) return "Your Email is required!";
        if(!RegExp(EMAIL_INPUT_VALUE_REGEX).hasMatch(value)){
          return "Your email adress is not valid";
        }
        return null;
      },
      onSaved: (String value){
        _new_user.email = value;
      },
    );
  }
  Widget _password_widget(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Password",icon: ICON_SECURE),
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (String value){
        if(value.isEmpty) return "Your password is required!";
        if(value.length <= 4 ) return "Your password is too short";
        return null;
      },
      onSaved: (String value){
        _new_user.password = value;
      },
      onFieldSubmitted:(String value){
        if(value != null) value = "";
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    //TODO :  ADD our logo
    return MaterialApp(
      home: Scaffold(
        appBar: new Stat19SpecifiqueAppBar(titleName: "S'inscrire",context: context),
        body: Container(
          decoration: BoxDecoration(
            image: BODY_BACKGROUND_DECORATION_IMAGE,
          ),
          child: Container(
            alignment: Alignment.center,
            //padding: EdgeInsets.fromLTRB(40,10,20,10),
            margin: EdgeInsets.all(45),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _username_widget(),
                  _email_widget(),
                  _password_widget(),
                  SizedBox(height: 100),
                  RaisedButton(
                    child: Text("Submit"),
                    color: GENERAL_BUTTON_COLOR,
                    onPressed: (){
                      if(! _formKey.currentState.validate()) {
                        return;
                      }

                      _formKey.currentState.save();
                      print("username: " + _new_user.username);
                      print("email: " + _new_user.email);
                      print("pswd: " + _new_user.password);
                      _formKey.currentState.reset();
                      /**
                       * //TODO : send new user to server
                       * TODO : valid auhentification without passing by connection page
                       */
                      Navigator.pushNamed(context, NamedRoute.HOME_ROUTE);
                    },
                  )
                ],
              ),
            ),
          ),
        )
    ),);
  }
}