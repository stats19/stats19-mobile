import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/info_square.dart';
import 'package:stat19_app_mobile/features/player/presentation/bloc/player_bloc.dart';
import 'package:stat19_app_mobile/features/player/presentation/widgets/title_filter.dart';


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
            return Container(
              margin: const EdgeInsets.only(
                left: 20,
                top: 18,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 11,
                    spreadRadius: 2.0,
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  TitleFilter(),
                  GridView.count(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      crossAxisCount: 3,
                      children: [
                    InfoSquare(type: "Age",value: state.player.age),
                    InfoSquare(type: "Poid",value: LbsToKg(state.player.weight) ),
                    InfoSquare(type: "Taille",value: state.player.height),
                    InfoSquare(type: "But",value: state.player.goals),
                    InfoSquare(type: "Tir cadré",value: state.player.shotOnTarget),
                    InfoSquare(type: "Carton rouge",value: state.player.redCards),
                    InfoSquare(type: "Carton jaune",value: state.player.yellowCards),
                  ]),
                ],
              ),
            );
          } else if (state is Error) {
            return Text('there is error' + state.message);
          }
          return Container();
        });
  }

  int LbsToKg(int weight) {
    double KgWeight = weight / 2.2;
    return KgWeight.round();
  }
}