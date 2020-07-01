import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/player_bloc.dart';

class TitlePlayer extends StatelessWidget {
  const TitlePlayer({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      if (state is Loaded) {
        return Text(state.player.name);
      } else if (state is Error) {
        return Text('there is error' + state.message);
      }
      return Container();
    });
  }
}