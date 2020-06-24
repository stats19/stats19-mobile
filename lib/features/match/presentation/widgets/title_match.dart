import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/match/presentation/bloc/soccer_match_bloc.dart';

class TitleMatch extends StatelessWidget {
  const TitleMatch({
    Key key,
    @required this.matchId,
  }) : super(key: key);

  final int matchId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoccerMatchBloc, SoccerMatchState>(builder: (context, state) {
      if ((state is Empty)) {
        BlocProvider.of<SoccerMatchBloc>(context).add(GetSoccerMatchEvent(matchId));
        return Text("match");
        return Container();
      } else if (state is Loaded) {
        return Text(state.soccerMatch.homeTeam.name + ' - ' + state.soccerMatch.awayTeam.name, style: TextStyle(fontSize: 15));
      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}