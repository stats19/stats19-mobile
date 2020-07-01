import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/navigation.dart';
import '../../../../core/presentation/widgets/on_push_value.dart';
import '../../domain/entities/fantasy.dart';

class PositionPlayers extends StatelessWidget {
  final ValueChanged<OnPushValue> onPush;
  final List position;
  final String title;
  const PositionPlayers({
    Key key, this.position, this.title, this.onPush,
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
        border: Border.all(color:  Colors.blueGrey[700], width: 0.7),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
//              spreadRadius: 5,
            blurRadius: 6,
          ),
        ],
        color: Colors.blueGrey,
      ),
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.all(Radius.circular(10)),
//        color: Colors.white,
//        boxShadow: [
//          BoxShadow(
//            color: Colors.black.withOpacity(0.5),
//            blurRadius: 11,
//            spreadRadius: 2.0,
//          )
//        ],
//      ),
      child: Column(
        children: <Widget>[
          Text(title, style: TextStyle(color: Colors.white)),
          Container(
              child: Wrap(
                  children: position
                      .map((fantasyPlayer) => PlayerList(fantasyPlayer: fantasyPlayer, onPush: onPush))
                      .toList())),
        ],
      ),
    );
  }
}

class PlayerList extends StatelessWidget {
  final FantasyPlayer fantasyPlayer;
  final ValueChanged<OnPushValue> onPush;

  const PlayerList({
    Key key,
    this.fantasyPlayer, this.onPush,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: FlatButton(
          onPressed: () => onPush(OnPushValue(type: TabNavigatorRoutes.player, id: fantasyPlayer.playerId)),
          child: Container(
              child: Text(
                fantasyPlayer.name, style: TextStyle(color: Colors.white),
              ))),
    );
  }
}