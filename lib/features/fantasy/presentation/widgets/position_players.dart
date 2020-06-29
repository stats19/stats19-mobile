import 'package:flutter/material.dart';
import 'package:stat19_app_mobile/features/fantasy/domain/entities/fantasy.dart';
import 'package:stat19_app_mobile/features/player/presentation/pages/player_page.dart';

class PositionPlayers extends StatelessWidget {
  final List position;
  final String title;
  const PositionPlayers({
    Key key, this.position, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        top: 18,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
          Text(title),
          Container(
              child: Wrap(
                  children: position
                      .map((fantasyPlayer) => PlayerList(fantasyPlayer: fantasyPlayer))
                      .toList())),
        ],
      ),
    );
  }
}

class PlayerList extends StatelessWidget {
  final FantasyPlayer fantasyPlayer;

  const PlayerList({
    Key key,
    this.fantasyPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PlayerPage(
                  playerId: fantasyPlayer.playerId,
                );
              }),
            );
          },
          child: Container(
              child: Text(
                fantasyPlayer.name,
              ))),
    );
  }
}