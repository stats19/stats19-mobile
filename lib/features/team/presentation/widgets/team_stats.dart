import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/presentation/widgets/info_square.dart';
import '../bloc/team_bloc.dart';

class TeamStats extends StatelessWidget {
  const TeamStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(builder: (context, state) {
      if (state is Loading) {
        return Container();
      } else if (state is Loaded) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(crossAxisCount: 3, children: [
            InfoSquare(
                type: "played_matches".tr(), value: state.team.matchesPlayed),
            InfoSquare(type: "wins".tr(), value: state.team.matchesWin),
            InfoSquare(type: "draws".tr(), value: state.team.matchesDraw),
            InfoSquare(type: "loses".tr(), value: state.team.matchesLose),
            InfoSquare(type: "home_wins".tr(), value: state.team.homeWin),
            InfoSquare(type: "away_wins".tr(), value: state.team.awayWin),
            InfoSquare(type: "goals".tr(), value: state.team.goals),
            InfoSquare(
                type: "goals_conceded".tr(), value: state.team.goalsConceded),
            InfoSquare(type: "fouls".tr(), value: state.team.foul),
          ]),
        );
      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}
