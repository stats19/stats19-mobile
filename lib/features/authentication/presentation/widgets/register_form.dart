import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stat19_app_mobile/features/authentication/presentation/pages/authentication_page.dart';

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
                hintText: 'username_hint'.tr()),
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
                return 'email_error'.tr();
              return null;
            },

            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'email_hint'.tr()),
        onChanged: (value) {
              email = value;
            },
          ),
//          SizedBox(height: 30),
          TextFormField(
            obscureText: true,
            controller: _pass,
            validator: (value){
              Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
              RegExp regex = new RegExp(pattern);
              if(!(regex.hasMatch(value)))
                return 'password_error'.tr();
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'password_hint'.tr()),
            onChanged: (value) {
              password = value;
            },
          ),
          TextFormField(
            obscureText: true,
            controller: _confirmPass,
            validator: (value){
              if(value.isEmpty)
                return 'password_error2'.tr();
              if(value != _pass.text)
                return 'password_error3'.tr();
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'password_repeat_hint'.tr()),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AuthenticationPage()));
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
                  child: Text('register_button'.tr()),
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
