import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/loading_widget.dart';

import '../../../../core/presentation/widgets/on_push_value.dart';
import '../../../../injection_container.dart';
import '../bloc/fantasy_bloc.dart';
import '../widgets/widgets.dart';

class FantasyPage extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;

  const FantasyPage({Key key, this.onPush}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }
  
  BlocProvider<FantasyBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FantasyBloc>(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Fantasy"),
          ),
          backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FantasyTeam(onPush: onPush)
              ],
            ),
          )),
    );
  }
}

class FantasyTeam extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;
  const FantasyTeam({
    Key key, this.onPush,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<FantasyBloc, FantasyState>(
          builder: (context, state) {
            if (state is FantasyInitial) {
              BlocProvider.of<FantasyBloc>(context).add(GetFantasyEvent());
            } else if(state is Loading) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: LoadingWidget(),
              );
            } else if (state is Loaded) {
              print(state.fantasy.middleFielders.toString());

              return Center(
                child: Column(
                  children: <Widget>[
                    PositionPlayers(position: state.fantasy.forwards, title: "Attaquants", onPush: onPush),
                    PositionPlayers(position: state.fantasy.middleFielders, title: "Milieux de terrain", onPush: onPush),
                    PositionPlayers(position: state.fantasy.defenders, title: "Défenseurs", onPush: onPush),
                    PositionPlayers(position: state.fantasy.goalKeepers, title: "Gardiens", onPush: onPush),
                  ],
                ),
              );
            } else if (state is Error) {
              return Text('there is error' + state.message);
            }
            return Container();
          });
  }
}




