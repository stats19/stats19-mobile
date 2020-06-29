import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/navigation/presentation/widgets/bottom_bar.dart';
import 'package:stat19_app_mobile/features/player/presentation/bloc/player_bloc.dart';
import 'package:stat19_app_mobile/features/player/presentation/widgets/widgets.dart';

import '../../../../injection_container.dart';

class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  final int playerId;

  PlayerPage({this.playerId});

  BlocProvider<PlayerBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PlayerBloc>(),
      child: Scaffold(
          appBar: AppBar(
            title: TitlePlayer(playerId: playerId),
          ),
          backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeaderPlayer(),
                StatsPlayer(),
              ],
            ),
          ),
          bottomNavigationBar: BottomBar()),
    );
  }
}
