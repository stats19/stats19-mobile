import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/features/fantasy/presentation/bloc/fantasy_bloc.dart';
import 'package:stat19_app_mobile/features/fantasy/presentation/widgets/widgets.dart';
import 'package:stat19_app_mobile/features/player/presentation/pages/player_page.dart';
import '../../domain/entities/fantasy.dart';

import '../../../../injection_container.dart';
import '../../../navigation/presentation/widgets/bottom_bar.dart';

class FantasyPage extends StatelessWidget {
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
                FantasyTeam()
              ],
            ),
          ),
          bottomNavigationBar: BottomBar()),
    );
  }
}

class FantasyTeam extends StatelessWidget {
  const FantasyTeam({
    Key key,
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
                child: CircularProgressIndicator(),
              );
            } else if (state is Loaded) {
              print(state.fantasy.middleFielders.toString());

              return Center(
                child: Column(
                  children: <Widget>[
                    PositionPlayers(position: state.fantasy.forwards, title: "Attaquants"),
                    PositionPlayers(position: state.fantasy.middleFielders, title: "Milieus de terrain"),
                    PositionPlayers(position: state.fantasy.defenders, title: "Défenseurs"),
                    PositionPlayers(position: state.fantasy.defenders, title: "Gardiens"),
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




