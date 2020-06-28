import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/info_square.dart';
import 'package:stat19_app_mobile/features/team/presentation/bloc/team_bloc.dart';

class TeamStats extends StatelessWidget {
  const TeamStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(
        builder: (context, state) {
          if (state is Loading) {
//            return CircularProgressIndicator();
            return Container();
          } else if (state is Loaded) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(crossAxisCount: 3, children: [
                InfoSquare(type: "Match joué", value: state.team.matchesPlayed),
                InfoSquare(type: "Match gagné", value: state.team.matchesWin),
                InfoSquare(type: "Match nul", value: state.team.matchesDraw),
                InfoSquare(type: "Match perdu", value: state.team.matchesLose),
                InfoSquare(type: "Victoire a domicile", value: state.team.homeWin),
                InfoSquare(type: "Victoire à l\'exterieur", value: state.team.awayWin),
                InfoSquare(type: "But marqué", value: state.team.goals),
                InfoSquare(type: "But encaissé", value: state.team.goalsConceded),
                InfoSquare(type: "Fautes", value: state.team.foul),
                //TODO add best player stat
//                InfoSquare(type: "Meilleur joueur", value: state.team.),
              ]),
            );
          } else if (state is Error) {
            return Text('there is error' + state.message);
          }
          return Container();
        });
  }
}