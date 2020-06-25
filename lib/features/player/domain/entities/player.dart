import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Player extends Equatable {
  final int playerId;
  final String name;
  final int weight;
  final int height;
  final int age;
  final int playedMatches;
  final int fouls;
  final int redCards;
  final int yellowCards;
  final int shotOnTarget;
  final Double score;
  final int goals;

  Player(
      {@required this.playerId,
      @required this.name,
      @required this.weight,
      @required this.age,
      @required this.height,
      @required this.playedMatches,
      @required this.fouls,
      @required this.redCards,
      @required this.yellowCards,
      @required this.shotOnTarget,
      @required this.score,
      @required this.goals});

  @override
  List<Object> get props => [
        playerId,
        name,
        weight,
        height,
        age,
        playedMatches,
        fouls,
        redCards,
        yellowCards,
        shotOnTarget,
        goals,
        score
      ];

  @override
  bool get stringify => true;
}
