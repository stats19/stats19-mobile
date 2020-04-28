
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/principale_screen.dart';
import 'package:stat19_app_mobile/ressource/themes.dart';
import 'package:stat19_app_mobile/ressource/values.dart';

import 'AppBar_components.dart';
import 'models/user.dart';

class InscriptionForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return InscriptionFormState();
  }
}

class InscriptionFormState extends State<InscriptionForm>{
  User _new_user = new User();

  final _formKey = GlobalKey<FormState>();
  Widget _username_widget(){
    return TextFormField(
      decoration: InputDecoration(labelText: "username"),
      maxLength: 15,
      validator: (String value){
        if(value.isEmpty) return "Your username is required!";
        if(value.length < 3 ) return "Your username is short";
        return null;
      },
      onSaved: (String value){
        _new_user.username(value);
      },
    );
  }
  Widget _email_widget(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Email"),
      validator: (String value){
        if(value.isEmpty) return "Your Email is required!";
        if(!RegExp(EMAIL_INPUT_VALUE_REGEX).hasMatch(value)){
          return "Your email adress is not valid";
        }
        return null;
      },
      onSaved: (String value){
        _new_user.email(value);
      },
    );
  }
  Widget _password_widget(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value){
        if(value.isEmpty) return "Your password is required!";
        if(value.length <= 4 ) return "Your password is too short";
        return null;
      },
      onSaved: (String value){
        _new_user.password = (value);
      },
      onFieldSubmitted:(String value){
        if(value != null) value = "";
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    //TODO: find a way to make the app bar as a one methode or class
   //TODO / In THE appBAR active arrow to go back to previous page
    //TODO : see if you can make the Appbar transparent
    //TODO :  ADD our logo
    return Scaffold(
      appBar: new Stat19SimpleAppBar(titleName: "S'inscrire"),
    body: Container(
      decoration: BoxDecoration(
        image: BODY_BACKGROUND_DECORATION_IMAGE,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(20,10,20,10),
        margin: EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _username_widget(),
              _email_widget(),
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
                  print("username: " + _new_user.username);
                  print("email: " + _new_user.email);
                  print("pswd: " + _new_user.password);
                  /**
                   * //TODO : set info new user via service to api
                   * redirect to another main page (Done) And TODO : valid auhentification without passing by connection page
                   */
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                  //TODO : find a way to clear Input after validation ( _formKey.currentState.reset();)
                },
              )
            ],
          ),
        ),
      ),
    )
    );
  }
}