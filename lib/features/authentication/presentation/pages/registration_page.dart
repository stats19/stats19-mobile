import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/user_bloc.dart';
import '../widgets/widgets.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                // Bottom half
                RegisterForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}




