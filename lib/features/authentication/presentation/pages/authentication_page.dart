import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app.dart';
import '../../../../core/config/constant.dart';
import '../../../../injection_container.dart';
import '../bloc/user_bloc.dart';
import '../widgets/widgets.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      final token = value.get(CACHED_AUTH_TOKEN);
      if (token != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return App();
        }));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats19'),
      ),
      body: Form(child: buildBody(context)),
    );
  }

  BlocProvider<UserBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UserBloc>(),
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                // to half
                TitlePage(),
                InscriptionWidget(),

                // Bottom half
                AuthForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}




