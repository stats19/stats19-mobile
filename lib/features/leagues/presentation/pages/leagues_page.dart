import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/leagues/presentation/bloc/leagues_bloc.dart';

import '../../../../injection_container.dart';

class LeaguesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les ligues'),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<LeaguesBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LeaguesBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Text('Hello the world!'),
                  BlocBuilder<LeaguesBloc, LeaguesState>(
                      builder: (context, state) {
                    if ((state is Empty)) {
                      BlocProvider.of<LeaguesBloc>(context).add(GetLeaguesEvent());
                      return Container();
                    } else if (state is Loading) {
                      return Text("is loading");
                    } else if (state is Loaded) {
                      return Container(
                      margin: const EdgeInsets.all(10.0),
                      child: (new ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.leagues == null
                                ? 0
                                : state.leagues.length,
                            itemBuilder: (BuildContext context, int index) {
                              return new Card(
                                child:
                                    new Text(state.leagues[index].name),
                              );
                            },
                          )));
                    } else if (state is Error) {
                      // return MessageDisplay(message: state.message);
                      return Text('there is error' + state.message);
                    }
                    return Container();
                  })
                ],
              )),
        ),
      ),
    );
  }
}
