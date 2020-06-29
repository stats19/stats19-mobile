import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../navigation/presentation/widgets/bottom_bar.dart';
import '../bloc/player_bloc.dart';
import '../widgets/widgets.dart';

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
          backgroundColor: Colors.blueGrey[900],
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  HeaderPlayer(),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Statistiques",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  StatsPlayer(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomBar()),
    );
  }
}
