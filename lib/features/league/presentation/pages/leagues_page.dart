import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/navigation.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/on_push_value.dart';

import '../../../../injection_container.dart';
import '../bloc/leagues_bloc.dart';

class LeaguesPage extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;

  const LeaguesPage({this.onPush});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('leagues').tr(),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.blueGrey[900],
      body: buildBody(context)
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
                  BlocBuilder<LeaguesBloc, LeaguesState>(
                      builder: (context, state) {
                    if ((state is Empty)) {
                      BlocProvider.of<LeaguesBloc>(context)
                          .add(GetLeaguesEvent());
                      return Container();
                    } else if (state is Loading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is LeaguesLoaded) {
                      return Container(
                          margin: const EdgeInsets.all(10.0),
                          child: (new ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.leagues == null
                                ? 0
                                : state.leagues.length,
                            itemBuilder: (BuildContext context, int index) {
                              return RaisedButton(
                                  child: new Text(state.leagues[index].name),
                                  splashColor: Colors.grey[900],
                                  onPressed: () => onPush(OnPushValue(
                                      type: TabNavigatorRoutes.league,
                                      id: state.leagues[index].leagueId)));
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
