import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_router.dart';
import '../bloc/user_bloc.dart';
import 'message_display.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String username;
  String password;
  String email;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        children: <Widget>[
          //textField
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Votre nom d\'utilisateur'),
            onChanged: (value) {
              username = value;
            },
          ),
//          SizedBox(height: 30),
          TextFormField(
            validator: (value){
              Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regex = new RegExp(pattern);
              if(!(regex.hasMatch(value)))
                return 'email non valide';
              return null;
            },

            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Votre email'),
        onChanged: (value) {
              email = value;
            },
          ),
//          SizedBox(height: 30),
          TextFormField(
            controller: _pass,
            validator: (value){
              Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
              RegExp regex = new RegExp(pattern);
              if(!(regex.hasMatch(value)))
                return 'Votre mot de passe doit comporter au moins 8 caractères (32 au maximum) et au moins un chiffre et une lettre';
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Votre mot de passe '),
            onChanged: (value) {
              password = value;
            },
          ),
          TextFormField(
            controller: _confirmPass,
            validator: (value){
              if(value.isEmpty)
                return 'Aucun mot de passe';
              if(value != _pass.text)
                return 'le mot de passe ne correspond pas';
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Confirmez votre mot de passe '),
            onChanged: (value) {
              password = value;
              _form.currentState.validate();

            },
          ),
//          SizedBox(height: 10),
          BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if ((state is Empty)) {
              return Container();
            } else if (state is Error) {
              return MessageDisplay(message: state.message);
            } else if (state is RegisterLoaded) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamed(NamedRoute.HOME_ROUTE);
              });
              return Container();
            }
            return Container();
          }),
//          SizedBox(height: 150),
          Row(
            children: <Widget>[
              Expanded(child: ButtonTheme(
                height: 60,
                child: RaisedButton(
                  child: Text('M\'inscrire'),
                  color: Theme.of(context).primaryColor,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: () {
                    dispatchRegistrationUser();
                  },
                ),
              ))
            ],
          )
        ],
      ),

    );


  }

  void dispatchRegistrationUser() {
    BlocProvider.of<UserBloc>(context).add(RegisterEvent(username: username,email: email,password: password));
  }

}
