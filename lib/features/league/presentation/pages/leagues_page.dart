import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';

import '../../../../core/presentation/widgets/navigation.dart';
import '../../../../core/presentation/widgets/on_push_value.dart';
import '../../../../injection_container.dart';
import '../bloc/leagues_bloc.dart';

class LeaguesPage extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;

  const LeaguesPage({this.onPush});

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<LeaguesBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LeaguesBloc>(),
      child: Center(
        child:
            BlocBuilder<LeaguesBloc, LeaguesState>(builder: (context, state) {
          if ((state is Empty)) {
            BlocProvider.of<LeaguesBloc>(context).add(GetLeaguesEvent());
            return Container();
          } else if (state is Loading) {
            return LoadingWidget();
          } else if (state is LeaguesLoaded) {
            return buildLeagueBody(state);
          } else if (state is Error) {
            // return MessageDisplay(message: state.message);
            return Text('there is error' + state.message);
          }
          return Container();
        }),
      ),
    );
  }

  Scaffold buildLeagueBody(LeaguesLoaded state) {
    return Scaffold(
        appBar: AppBar(
          title: Text('leagues').tr(),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.blueGrey[900],
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              margin: const EdgeInsets.all(10.0),
              child: (new ListView.separated(
                shrinkWrap: true,
                itemCount: state.leagues == null ? 0 : state.leagues.length,
                itemBuilder: (BuildContext context, int index) {
                  return RaisedButton(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(4),
                                  child: Image.network(
                                    state.leagues[index].picture,
                                    width: 50,
                                    height: 50,
                                  ))),
                          Expanded(
                            flex: 3,
                            child: Text(state.leagues[index].name),
                          )
                        ],
                      ),
                      splashColor: Colors.grey[900],
                      onPressed: () => onPush(OnPushValue(
                          type: TabNavigatorRoutes.league,
                          id: state.leagues[index].leagueId)));
                }, separatorBuilder: (BuildContext context, int index) => const Divider(),
              ))),
        ));
  }
}
