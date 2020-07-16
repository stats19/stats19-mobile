import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../app.dart';
import '../bloc/user_bloc.dart';
import 'message_display.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key key,
  }) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(height: 30),
        TextField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'password_hint'.tr()),
          onChanged: (value) {
            password = value;
          },
        ),
        SizedBox(height: 10),
        BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if ((state is Empty)) {
            return Container();
          } else if (state is Error) {
            return MessageDisplay(message: state.message);
          } else if (state is Loaded) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => App()));
            });
          }
          return Container();
        }),
        SizedBox(height: 150),
        Row(
          children: <Widget>[
            Expanded(child: ButtonTheme(
              height: 60,
              child: RaisedButton(
                child: Text('connection_button').tr(),
                color: Theme.of(context).primaryColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: () {
                  dispatchLoginUser();
                },
              ),
            ))
          ],
        )

      ],
    );
  }

  void dispatchLoginUser() {
    BlocProvider.of<UserBloc>(context).add(UserLogin(username, password));
  }
}
