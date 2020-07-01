import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';

import '../../../../injection_container.dart';
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
      child: BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
        if (state is Empty) {
          BlocProvider.of<PlayerBloc>(context)
              .add(GetPlayerEvent(playerId: playerId));
          return Container();
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is Loaded) {
          return buildPlayerBody();
        }

        return Container();
      }),
    );
  }

  Scaffold buildPlayerBody() {
    return Scaffold(
        appBar: AppBar(
          title: TitlePlayer(),
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
        ));
  }
}
