import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/league/presentation/bloc/leagues_bloc.dart';

class TitleLeague extends StatelessWidget {
  const TitleLeague({
    Key key,
    @required this.leagueId,
  }) : super(key: key);

  final int leagueId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaguesBloc, LeaguesState>(builder: (context, state) {
      if ((state is Empty)) {
        BlocProvider.of<LeaguesBloc>(context).add(GetLeaguesEvent());
        return Text("équipe");
        return Container();
      } else if (state is LeaguesLoaded) {
        return Text(leagueId.toString());
      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}