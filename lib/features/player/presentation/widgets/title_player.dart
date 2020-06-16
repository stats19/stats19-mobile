import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/player/presentation/bloc/player_bloc.dart';

class TitlePlayer extends StatelessWidget {
  const TitlePlayer({
    Key key,
    @required this.playerId,
  }) : super(key: key);

  final int playerId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      if ((state is Empty)) {
        BlocProvider.of<PlayerBloc>(context).add(GetPlayerEvent(playerId));
        return Text("Joueur");
        return Container();
      } else if (state is Loaded) {
        return Text(state.player.name);
      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}