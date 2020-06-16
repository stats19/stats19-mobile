import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stat19_app_mobile/core/presentation/widgets/bottom_bar.dart';
import 'package:stat19_app_mobile/features/player/domain/entities/player.dart';
import 'package:stat19_app_mobile/features/player/presentation/bloc/player_bloc.dart';

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
            title:
                BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
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
            }),
          ),
          backgroundColor: Colors.blueGrey[900],
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: PlayerWidget(),
            ),
          ),
          bottomNavigationBar: BottomBar()),
    );
  }
}

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({
    Key key,
  }) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: BlocBuilder<PlayerBloc, PlayerState>(
                        builder: (context, state) {
                      if (state is Loading) {
                        return CircularProgressIndicator();
                      } else if (state is Loaded) {
                        return Text(state.player.name,
                            style:
                                TextStyle(color: Colors.white, fontSize: 40));
                      } else if (state is Error) {
                        return Text('there is error' + state.message);
                      }
                      return Container();
                    })
                ),
              )
            ],
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Statistiques",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ),
        BlocBuilder<PlayerBloc, PlayerState>(
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
            }),
      ],
    );
  }
}

class InfoSquare extends StatelessWidget {
  final int value;
  final String type;

  const InfoSquare({this.type, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
          color: Colors.blueGrey,
        ),
        height: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Align(
                  child: Text(type,
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  alignment: Alignment.topLeft,
                ),
                Expanded(
                  child: Align(
                    child: Text(value.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    alignment: Alignment.bottomRight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
