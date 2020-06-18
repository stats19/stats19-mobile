import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/info_square.dart';
import 'package:stat19_app_mobile/features/player/presentation/bloc/player_bloc.dart';


class StatsPlayer extends StatelessWidget {
  const StatsPlayer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          if (state is Loading) {
            return CircularProgressIndicator();
          } else if (state is Loaded) {
            return Expanded(
              child: GridView.count(crossAxisCount: 3, children: [
                InfoSquare(type: "Age",value: state.player.age),
                InfoSquare(type: "Poid",value: state.player.weight),
                InfoSquare(type: "Taille",value: state.player.height),
                InfoSquare(type: "But",value: state.player.goals),
                InfoSquare(type: "Tir cadré",value: state.player.shotOnTarget),
                InfoSquare(type: "Passe décisive",value: 0),
                InfoSquare(type: "Carton rouge",value: state.player.redCards),
                InfoSquare(type: "Carton jaune",value: state.player.yellowCards),
              ]),
            );
          } else if (state is Error) {
            return Text('there is error' + state.message);
          }
          return Container();
        });
  }
}