import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/player_bloc.dart';

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
        BlocProvider.of<PlayerBloc>(context).add(GetPlayerEvent(playerId: playerId));
        return Text("Joueur");
      } else if (state is Loaded) {
        return Text(state.player.name);
      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}